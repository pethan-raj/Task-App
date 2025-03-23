import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/image_label_model.dart';
import '../properties/app_assets.dart';
import '../properties/app_colors.dart';
import '../properties/app_fonts.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final List<ImageLabelModel> _drawerItemList = [
    ImageLabelModel(label: 'Scheduler', imagePath: AppAssets.scheduler),
    ImageLabelModel(label: 'Timesheet', imagePath: AppAssets.feedAndTimeSheet),
    ImageLabelModel(label: 'Discussions', imagePath: AppAssets.discussions),
    ImageLabelModel(label: 'Reports', imagePath: AppAssets.reports),
    ImageLabelModel(label: 'Feedback', imagePath: AppAssets.feedback),
    ImageLabelModel(label: 'Certificates', imagePath: AppAssets.certificates),
    ImageLabelModel(label: 'Feed', imagePath: AppAssets.feedAndTimeSheet),
    ImageLabelModel(label: 'Analytics', imagePath: AppAssets.analytics),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.whiteColor,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: AppColors.borderColor,
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Text(
              'Admin',
              style: AppFont.style(
                textStyle: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackColor.withOpacity(0.05),
                  spreadRadius: 3,
                  blurRadius: 15,
                )
              ],
            ),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildProfileInfo(),
                ...List.generate(
                  _drawerItemList.length,
                  (index) => _buildDrawerItems(index: index),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 94,
            padding: const EdgeInsets.all(6),
            margin: const EdgeInsets.symmetric(vertical: 16),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor,
            ),
            child: Image.asset(AppAssets.profile),
          ),
          Text(
            'John Doe',
            textAlign: TextAlign.center,
            style: AppFont.style(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Mentor',
              textAlign: TextAlign.center,
              style: AppFont.style(
                textStyle: const TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          const Divider(
            color: AppColors.borderColor,
            endIndent: 2,
            indent: 2,
            thickness: 0.8,
          ),
        ],
      );

  Widget _buildDrawerItems({required int index}) => ListTile(
        contentPadding: const EdgeInsets.only(left: 18),
        leading: SvgPicture.asset(_drawerItemList[index].imagePath),
        title: Text(
          _drawerItemList[index].label,
          style: AppFont.style(
            textStyle: const TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
}
