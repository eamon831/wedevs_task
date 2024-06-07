import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:wedevs_task/app/core/core_model/logged_user.dart';
import 'package:wedevs_task/app/model/product.dart';

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
    if (LoggedUser().token?.isNotEmpty ?? false) {
      return {
        'Authorization': 'Bearer ${LoggedUser().token}',
      };
    }
    return {};
  }

  Future<bool> validateResponse(Response<dynamic> response) async {
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<bool> registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
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

  Future<bool> authenticateUser({
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
      final token = responseMap['token'] as String;
      final decodedJWT = JwtDecoder.decode(token);

      if (decodedJWT?['data']?['user']?['id'] == null) {
        return false;
      }

      responseMap['user_id'] = decodedJWT!['data']['user']['id'];
      pref
        ..setIsLogin(isLogin: true)
        ..setUser(responseMap)
        ..setLoggedUserName(username)
        ..setLoggedUserPassword(password);

      LoggedUser.fromJson(responseMap);
      return true;
    }
    return false;
  }

  Future<bool> registerAndUploadProfilePicture(
    String username,
    String email,
    String password,
    File value,
  ) async {
    try {
      final isRegistered = await registerUser(
        username: username,
        email: email,
        password: password,
      );
      if (isRegistered) {
        final isAuthenticated = await authenticateUser(
          username: username,
          password: password,
        );
        if (isAuthenticated) {
          return true;
        }
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future<List<Product>?> fetchProducts() async {
    try {
      //read json file from assets/json directory
      final json = await parseJsonFromAssets('assets/json/response.json');
      //simulate network delay
      await Future.delayed(const Duration(seconds: 2));
      if (json != null && json is List) {
        return json.map((e) => Product.fromJson(e)).toList();
      }
    } on Exception catch (e) {
      log(e.toString());
    }

    return null;
  }

  Future<dynamic> parseJsonFromAssets(String assetsPath) async {
    final jsonStr = await rootBundle.loadString(assetsPath);
    return jsonDecode(jsonStr);
  }

  Future<bool> updateProfile({
    required String email,
    required String fullName,
    required String streetAddress,
    required String apt,
    required String zip,
  }) async {
    final isLogin = await pref.getIsLogin();
    if (!isLogin) {
      toast('User is not logged in');
      return false;
    }
    final data = {
      'email': email,
      'fullName': fullName,
      'streetAddress': streetAddress,
      'apt': apt,
      'zip': zip,
    };

    data.removeWhere((key, value) => value.isEmpty);

    final response = await dio.post(
      APIType.protected,
      endpointUpdateProfile + LoggedUser().userId.toString(),
      data,
      headers: await _buildHeader(),
    );

    if (response.statusCode == 200) {
      //update user data in shared preference
      if (isLogin) {
        final username = await pref.getLoggedUserName();
        final password = await pref.getLoggedUserPassword();
        final isAuthenticated = await authenticateUser(
          username: username!,
          password: password!,
        );
        return isAuthenticated;
      }
    }

    return false;
  }
}
