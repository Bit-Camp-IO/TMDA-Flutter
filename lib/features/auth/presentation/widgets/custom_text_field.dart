import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500
        ),
        onSaved: onSaved,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16.0).r,
          filled: true,
          fillColor: Colors.white.withOpacity(0.15),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(const Radius.circular(8).w),
          ),
        ),
      ),
    );
  }
}
