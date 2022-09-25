import 'package:flutter/material.dart';

class TitledTextField extends StatelessWidget {
  TitledTextField({
    Key? key,
    required this.title,
    this.suffixIcon,
    this.perfix,
    this.controller,
    this.onPress,
    this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);
  final String title;
  final TextEditingController? controller;
  Widget? suffixIcon;
  Widget? perfix;
  Function()? onPress;
  TextInputType? keyboardType;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 8),
        TextFormField(
          keyboardType: keyboardType,
          obscureText: obscureText,
          onTap: onPress,
          controller: controller,
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffF9F9F9),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              suffixIcon: suffixIcon,
              prefix: perfix),
        )
      ],
    );
  }
}
