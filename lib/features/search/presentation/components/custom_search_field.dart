import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/color_manager.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.textEditingController,
    required this.onChanged,
  });

  final TextEditingController textEditingController;
  final void Function(String searchText) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: TextField(
        textInputAction: TextInputAction.search,
        onChanged: onChanged,
        controller: textEditingController,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
        cursorColor: ColorsManager.primaryColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black.withOpacity(0.37),
          hintText: 'Search..',
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: ColorsManager.inActiveColor,
          ),
          prefixIcon: const Icon(
            SolarSystemIcons.search,
            color: ColorsManager.inActiveColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10).w,
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

}