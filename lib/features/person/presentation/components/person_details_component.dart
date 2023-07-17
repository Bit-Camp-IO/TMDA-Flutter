import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/strings_manager.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonCubit, PersonState>(
      buildWhen: (previous, current) =>
          previous.personData != current.personData,
      builder: (context, state) {
        return Animate(
          effects: [FadeEffect(duration: 150.ms)],
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
                  icon: const Icon(
                    SolarSystemIcons.birthday,
                    color: Colors.white,
                    size: 18,
                  ),
                  text: _formatDate(date: state.personData.birthDay),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 24).r,
                child: _textWithIcon(
                  icon: const Icon(
                    SolarSystemIcons.location,
                    color: Colors.white,
                    size: 18,
                  ),
                  text: state.personData.placeOfBirth,
                ),
              ),
              const SectionWidget(
                title: StringsManager.biography,
                color: ColorsManager.primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
                child: BlocBuilder<PersonCubit, PersonState>(
                  builder: (context, state) {
                    return _buildBiographyText(
                      biography: state.personData.biography,
                      isTextExpanded: state.isTextExpanded,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBiographyText({required String biography, required bool isTextExpanded}) {
    if (biography.isEmpty) {
      return SizedBox(
        height: 100.h,
        child: Center(
          child: Text(
            StringsManager.emptyBiography,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    } else {
      if (biography.length >= 250) {
        return ExpandableText(
          text: biography,
          isTextExpanded: isTextExpanded,
          onPressed: () {
            context
                .read<PersonCubit>()
                .changeReadMoreState(isTextExpanded: !isTextExpanded);
          },
        );
      } else {
        return Text(
          biography,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
        const SizedBox(width: 8),
        Text(
          text.isNotEmpty ? text : StringsManager.unknown,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
      return StringsManager.unknown;
    }
  }
}
