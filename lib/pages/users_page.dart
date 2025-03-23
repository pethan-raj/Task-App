import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../properties/app_assets.dart';
import '../properties/app_colors.dart';
import '../properties/app_fonts.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset(
            AppAssets.users,
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
