import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wedevs_task/app/core/core_model/logged_user.dart';

import '/app/service/endpoints.dart';
import '/app/session_manager/session_manager.dart';
import '/flavors/build_config.dart';
import 'client/api_options.dart';
import 'client/rest_client.dart';

class Services {
  final pref = SessionManager();
  final dio = RestClient(
    baseUrl: BuildConfig.instance.config.baseUrl,
    token: '',
  );

  Future<Map<String, dynamic>> _buildHeader() async {
    return {};
  }

  Future<bool> validateResponse(Response<dynamic> response) async {
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<bool> registerUser(
    String username,
    String email,
    String password,
  ) async {
    final data = {
      'username': username,
      'email': email,
      'password': password,
    };

    final response = await dio.post(
      APIType.public,
      endpointRegister,
      data,
    );
    if (response.statusCode == 200) {
      final responseMap = response.data as Map<String, dynamic>;
      if (responseMap['code'] is int && responseMap['code'] == 200) {
        return true;
      }
    }
    return false;
  }

  Future<String?> authenticateUser({
    required String username,
    required String password,
  }) async {
    final data = {
      'username': username,
      'password': password,
    };

    final response = await dio.post(
      APIType.public,
      endpointLogin,
      data,
    );
    if (response.statusCode == 200) {
      final responseMap = response.data as Map<String, dynamic>;
      pref
        ..setIsLogin(isLogin: true)
        ..setUser(responseMap)
        ..setLoggedUserName(username)
        ..setLoggedUserPassword(password);

      LoggedUser.fromJson(responseMap);
      return responseMap['token'];
    }
    return null;
  }

  Future<int> uploadProfilePicture(String token, File imageFile) async {
    print('Uploading profile picture');
    print('Token: $token');
    print('Image file: ${imageFile.path}');

    print('url: ${BuildConfig.instance.config.baseUrl}wp/v2/media');

    final dio = Dio();
    final url = '${BuildConfig.instance.config.baseUrl}wp/v2/media';
    final formData = FormData.fromMap(
      {
        'file': await MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.path.split('/').last,
        ),
      },
    );

    try {
      final response = await dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Disposition':
                'attachment; filename=${imageFile.path.split('/').last}',
          },
        ),
      );

      print(response.data);

      if (response.statusCode == 201) {
        return response.data['id'];
      } else {
        throw Exception('Failed to upload profile picture: ${response.data}');
      }
    } catch (e) {
      throw Exception('Exception occurred: $e');
    }
  }

  Future<void> assignProfilePicture(
    String token,
    int userId,
    int mediaId,
  ) async {
    print('Assigning profile picture');
    print('Token: $token');
    print('User ID: $userId');
    print('Media ID: $mediaId');

    final dioo = Dio();
    final url = '${BuildConfig.instance.config.baseUrl}wp/v2/users/$userId';
    final data = {
      'meta': {
        'profile_picture': mediaId,
      },
    };

    try {
      final response = await dioo.post(
        url,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        print('Profile picture assigned successfully');
      } else {
        throw Exception('Failed to assign profile picture: ${response.data}');
      }
    } catch (e) {
      throw Exception('Exception occurred: $e');
    }
  }

  Future<void> registerAndUploadProfilePicture(
    String username,
    String email,
    String password,
    File profilePicture,
  ) async {
    try {
      await registerUser(username, email, password);
      final token = await authenticateUser(
        username: username,
        password: password,
      );
      final mediaId = await uploadProfilePicture(token!, profilePicture);
      // Replace `1` with the actual user ID if needed
      await assignProfilePicture(token, 1, mediaId);
    } catch (e) {
      print('Error: $e');
    }
  }
}
