import 'package:evently_task/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final String? prefixIcon;
  final bool isPassword;
  final int minLines;
  final TextEditingController? controller;

  const CustomTextField(
      {super.key,
      required this.hint,
      this.prefixIcon,
      this.isPassword = false,
      this.controller,
      this.minLines = 1});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color:AppColors.blue),
      controller:  widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: widget.prefixIcon == null
            ? null : Container(
         // color: AppColors.white,
          margin: EdgeInsets.symmetric(horizontal: 4),
                child:SvgPicture.asset(widget.prefixIcon!),
              ),
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  obscureText = !obscureText;
                  setState(() {});
                },
                child: Icon(
                    obscureText ? Icons.visibility_off : Icons.remove_red_eye))
            : null,
        hintText: widget.hint,
        //hintStyle: Theme.of(context). textTheme.titleSmall,
      ),
      minLines: widget.minLines,
      maxLines: widget.isPassword ? 1 : widget.minLines + 1,
      obscureText: widget.isPassword ? obscureText : false,
    );
  }
}
