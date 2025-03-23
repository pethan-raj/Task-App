import 'package:data_terrain_task/properties/app_assets.dart';
import 'package:data_terrain_task/properties/app_colors.dart';
import 'package:data_terrain_task/properties/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProgramsPage extends StatefulWidget {
  const ProgramsPage({super.key});

  @override
  State<ProgramsPage> createState() => _ProgramsPageState();
}

class _ProgramsPageState extends State<ProgramsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset(
            AppAssets.programs,
            height: 100,
            colorFilter: const ColorFilter.mode(
              AppColors.borderColor,
              BlendMode.srcATop,
            ),
          ),
        ),
        Text(
          'Coming Soon',
          textAlign: TextAlign.center,
          style: AppFont.style(
            textStyle: const TextStyle(
              color: AppColors.blackColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}
