import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/color_manager.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.onSaved,
  });

  final String hintText;
  final FormFieldSetter onSaved;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      height: 40.h,
      child: TextFormField(
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
        onSaved: onSaved,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16.0).r,
          filled: true,
          fillColor: Colors.white.withOpacity(0.15),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: ColorsManager.inActiveColor,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(Radius.circular(8)).r,
          ),
        ),
      ),
    );
  }
}
