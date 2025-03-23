import 'package:data_terrain_task/pages/programs_page.dart';
import 'package:data_terrain_task/pages/requests_page.dart';
import 'package:data_terrain_task/pages/users_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../controller/home_controller.dart';
import '../models/image_label_model.dart';
import '../properties/app_assets.dart';
import '../properties/app_colors.dart';
import '../properties/app_fonts.dart';
import '../widgets/drawer_widget.dart';
import 'dashboard_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ImageLabelModel> _bottomNavBarItems = [
    ImageLabelModel(label: 'Dashboard', imagePath: AppAssets.dashBoard),
    ImageLabelModel(label: 'Programs', imagePath: AppAssets.programs),
    ImageLabelModel(label: 'Users', imagePath: AppAssets.users),
    ImageLabelModel(label: 'Requests', imagePath: AppAssets.requests),
  ];
  final List<Widget> _pages = [
    const DashboardPage(),
    const ProgramsPage(),
    const UsersPage(),
    const RequestsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _buildAppBar(),
      endDrawer: const DrawerWidget(),
      body: _pages[context.watch<HomeController>().currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<HomeController>().currentPageIndex,
        onTap: (value) {
          context.read<HomeController>().currentPageIndex = value;
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.whiteColor,
        selectedLabelStyle: AppFont.style(
          textStyle: const TextStyle(),
        ),
        unselectedLabelStyle: AppFont.style(
          textStyle: const TextStyle(),
        ),
        items: List.generate(
          _bottomNavBarItems.length,
          (index) => _bottomNavigationBarItems(
              label: _bottomNavBarItems[index].label,
              imagePath: _bottomNavBarItems[index].imagePath),
        ),
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Container(
          width: 30,
          padding: const EdgeInsets.all(2),
          margin: EdgeInsets.only(
              left: MediaQuery.sizeOf(context).width > 600 ? 18 : 0),
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            AppAssets.profile,
          ),
        ),
        actions: [
          _customActionButton(icon: Icons.search_rounded),
          _customActionButton(icon: CupertinoIcons.bell_fill, showBadge: true),
          _drawerButton(),
        ],
      );
  Widget _customActionButton(
          {required IconData icon, bool showBadge = false}) =>
      Container(
        height: 24,
        width: 24,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFEEF5FF),
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: Badge(
          backgroundColor:
              showBadge ? const Color(0xFFFD003A) : Colors.transparent,
          child: Icon(
            icon,
            color: const Color(0xFF00AEBD),
            size: 18,
          ),
        ),
      );

  Widget _drawerButton() => Builder(
        builder: (context) => GestureDetector(
          onTap: () {
            Scaffold.of(context).openEndDrawer();
          },
          child: Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.sizeOf(context).width > 600 ? 32 : 16.0,
            ),
            child: SvgPicture.asset(AppAssets.drawer),
          ),
        ),
      );

  BottomNavigationBarItem _bottomNavigationBarItems(
          {required String label, required String imagePath}) =>
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          imagePath,
          colorFilter: const ColorFilter.mode(
            AppColors.blackColor,
            BlendMode.srcATop,
          ),
        ),
        label: label,
        activeIcon: SvgPicture.asset(
          imagePath,
          colorFilter: const ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcATop,
          ),
        ),
      );
}
