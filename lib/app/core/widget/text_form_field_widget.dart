import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '/app/core/values/text_styles.dart';

import 'asset_image_view.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?) validator;
  final bool obscureText;
  final Widget? suffix;
  final String? prefix;
  final TextInputType keyboardType;

  const TextFormFieldWidget({
    required this.controller,
    required this.hintText,
    required this.validator,
    super.key,
    this.obscureText = false,
    this.suffix,
    this.prefix,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.transparent,
          width: 0,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A395AB8),
            offset: Offset(0, 3),
            blurRadius: 4,
          ),
        ],
      ),
      padding: const EdgeInsets.only(
        top: 2,
        bottom: 2,
      ),
      child: Row(
        children: [
          prefix.isEmptyOrNull
              ? Container()
              : Row(
                  children: [
                    23.width,
                    SizedBox(
                      height: 19.44,
                      width: 15.63,
                      child: AssetImageView(
                        fileName: prefix!,
                        fit: BoxFit.contain,
                      ),
                    ),
                    16.width,
                  ],
                ),
          Expanded(
            child: TextFormField(
              controller: controller,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: hintTextStyle,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
              validator: validator,
              obscureText: obscureText,
              keyboardType: keyboardType,
            ),
          ),
          suffix ?? Container(),
        ],
      ),
    );
  }
}
