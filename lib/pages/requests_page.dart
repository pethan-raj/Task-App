import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../properties/app_assets.dart';
import '../properties/app_colors.dart';
import '../properties/app_fonts.dart';

class RequestsPage extends StatefulWidget {
  const RequestsPage({super.key});

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset(
            AppAssets.requests,
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
