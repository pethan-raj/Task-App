import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../properties/app_colors.dart';
import '../properties/app_fonts.dart';

class PieChartWidget extends StatelessWidget {
  final List<Map<String, dynamic>> programs;
  const PieChartWidget({super.key, required this.programs});

  @override
  Widget build(BuildContext context) {
    int total = programs.fold(0, (a, b) => a + (b['count'] as int));
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  sections: List.generate(
                    programs.length,
                    (index) => PieChartSectionData(
                      color: programs[index]['color'] ?? AppColors.borderColor,
                      value: programs[index]['count'].toDouble(),
                      title: '',
                      radius: 32,
                    ),
                  ),
                  sectionsSpace: 0,
                  centerSpaceColor: AppColors.whiteColor,
                ),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Total Programs',
                    style: AppFont.style(
                      textStyle: const TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    total.toString(),
                    style: AppFont.style(
                      textStyle: const TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            programs.length,
            (index) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 12,
                  width: 12,
                  margin: const EdgeInsets.only(
                    right: 6,
                    left: 12,
                  ),
                  decoration: BoxDecoration(
                    color: programs[index]['color'] ?? AppColors.borderColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Text(
                  programs[index]['type'].toString(),
                  style: AppFont.style(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  programs[index]['count'].toString(),
                  style: AppFont.style(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
