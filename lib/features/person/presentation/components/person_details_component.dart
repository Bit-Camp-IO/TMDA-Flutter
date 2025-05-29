import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tmda/core/animations/custom_fade_animation.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/extensions.dart';
import 'package:tmda/core/widgets/expandable_text.dart';
import 'package:tmda/core/widgets/section_widget.dart';
import 'package:tmda/features/person/presentation/components/person_card.dart';
import 'package:tmda/features/person/presentation/cubit/person_cubit.dart';

class PersonOverviewComponent extends StatefulWidget {
  const PersonOverviewComponent({super.key});

  @override
  State<PersonOverviewComponent> createState() =>
      _PersonOverviewComponentState();
}

class _PersonOverviewComponentState extends State<PersonOverviewComponent> {
  final ValueNotifier<bool> isTextExpanded = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonCubit, PersonState>(
      buildWhen: (previous, current) =>
          previous.personData != current.personData,
      builder: (context, state) {
        return CustomFadeAnimation(
          duration: Duration(milliseconds: 150),
          child: Column(
            children: [
              PersonPictureCard(
                height: 480.h,
                imagePath: state.personData.profilePath,
                errorImagePath: AssetsManager.neonAvatar,
                name: state.personData.name,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 24).r,
                child: _textWithIcon(
                  icon: Icon(
                    SolarSystemIcons.birthday,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                  text: _formatDate(date: state.personData.birthDay),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 24).r,
                child: _textWithIcon(
                  icon: Icon(
                    SolarSystemIcons.location,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                  text: state.personData.placeOfBirth,
                ),
              ),
              SectionWidget(
                title: context.tr.biography,
                color: ColorsManager.primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
                child: _buildBiographyText(
                  biography: state.personData.biography,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBiographyText({required String biography}) {
    if (biography.isEmpty) {
      return SizedBox(
        height: 100.h,
        child: Center(
          child: Text(
            context.tr.emptyBiography,
            style: context.textTheme.bodyLarge,
          ),
        ),
      );
    } else {
      if (biography.length >= 250) {
        return ValueListenableBuilder(
          valueListenable: isTextExpanded,
          builder: (context, isTextExpandedValue, child) => ExpandableText(
            text: biography,
            isTextExpanded: isTextExpandedValue,
            onPressed: () {
              isTextExpanded.value = !isTextExpanded.value;
            },
          ),
        );
      } else {
        return Text(
          biography,
          style: context.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w400,
            color: ColorsManager.inActiveColor,
          ),
          textAlign: TextAlign.center,
          softWrap: true,
          overflow: TextOverflow.fade,
        );
      }
    }
  }

  Row _textWithIcon({required Icon icon, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        SizedBox(width: 8.w),
        Text(
          text.isNotEmpty ? text : context.tr.unknown,
          style: context.textTheme.bodyLarge!.copyWith(
            color: ColorsManager.inActiveColor,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }

  String _formatDate({required String date}) {
    if (date.isNotEmpty) {
      DateTime dateTime = DateTime.parse(date);
      String formattedDate = DateFormat('d MMMM y').format(dateTime);
      return formattedDate;
    } else {
      return context.tr.unknown;
    }
  }
}
