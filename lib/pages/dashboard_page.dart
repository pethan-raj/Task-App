import 'package:data_terrain_task/widgets/pie_chart_widget.dart';
import 'package:data_terrain_task/widgets/table_template_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../properties/app_colors.dart';
import '../properties/app_fonts.dart';
import '../widgets/custom_layout.dart';
import '../widgets/drop_down_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width > 600 ? 32 : 16),
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).width > 600 ? 36 : 24,
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: _buildPlannedPrograms(),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: _buildStatusMetrics(),
                  ),
                ],
              );
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildPlannedPrograms(),
                  _buildStatusMetrics(),
                ],
              );
            }
          },
        ),
        _buildTopPrograms(),
        _buildTopMentors(),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: _buildTypeMetrics()),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(child: _buildModeMetrics()),
                ],
              );
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTypeMetrics(),
                  _buildModeMetrics(),
                ],
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildPlannedPrograms() {
    final List<Map<String, dynamic>> programList = [
      {'count': 327, 'name': 'Programs'},
      {'count': 120, 'name': 'Mentors'},
      {'count': 556, 'name': 'Mentees'},
    ];
    final List<Color> colors = [
      const Color(0xFFFFF4DE),
      const Color(0xFFC9F7F5),
      const Color(0xFFEEE5FF),
    ];
    return CustomLayout(
      title: 'Planned Programs',
      height: MediaQuery.sizeOf(context).width > 600 ? 416 : 342,
      child: Expanded(
        child: Column(
          children: List.generate(
            programList.length,
            (index) => Padding(
              padding: EdgeInsets.only(top: index != 0 ? 14 : 0),
              child: Row(
                children: [
                  Container(
                    height: 74,
                    width: 76,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: colors[index],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      programList[index]['count'].toString(),
                      style: AppFont.style(
                        textStyle: const TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      programList[index]['name'] ?? 'Name',
                      style: AppFont.style(
                        textStyle: const TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusMetrics() {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    List<List<int>> data = [
      [8, 6, 30],
      [30, 46, 46],
      [55, 28, 55],
      [28, 17, 28],
      [50, 4, 50],
      [40, 52, 52],
      [24, 18, 24],
      [30, 30, 30],
      [50, 3, 50],
      [20, 7, 20],
      [7, 4, 16],
      [50, 40, 50],
    ];
    List<Color> colors = [
      const Color(0xFFC7DEFF),
      const Color(0xFF7E9FD4),
      AppColors.primaryColor
    ];
    List<String> legends = ['Completed', 'Active', 'All Programs'];
    return CustomLayout(
      title: 'Program Status Metrics',
      actionWidget: const DropDownWidget(
        items: ['Month', 'Year'],
      ),
      height: 416,
      child: Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: 1200,
                  padding: const EdgeInsets.only(top: 12),
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: 60,
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              if (value % 10 == 0) {
                                return Text(
                                  value.toInt().toString(),
                                  style: AppFont.style(
                                    textStyle: const TextStyle(
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                            reservedSize: 24,
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                months[value.toInt()],
                                style: AppFont.style(
                                  textStyle: const TextStyle(
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              );
                            },
                            reservedSize: 24,
                          ),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      borderData: FlBorderData(
                        border: const Border(
                          bottom: BorderSide(
                            color: AppColors.borderColor,
                          ),
                          left: BorderSide(
                            color: AppColors.borderColor,
                          ),
                        ),
                      ),
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        getDrawingHorizontalLine: (value) {
                          return const FlLine(
                            color: AppColors.borderColor,
                            strokeWidth: 1,
                          );
                        },
                      ),
                      barGroups: List.generate(
                        data.length,
                        (index) {
                          return BarChartGroupData(
                            x: index,
                            barsSpace: 5,
                            barRods: List.generate(
                              data[index].length,
                              (barIndex) => BarChartRodData(
                                toY: data[index][barIndex].toDouble(),
                                color: colors[barIndex],
                                borderRadius: BorderRadius.zero,
                                width: 15,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                legends.length,
                (index) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 12,
                      width: 12,
                      margin: EdgeInsets.only(
                        right: 6,
                        left: index != 0 ? 12 : 0,
                      ),
                      decoration: BoxDecoration(
                        color: colors[index],
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      legends[index],
                      style: AppFont.style(
                        textStyle: const TextStyle(
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopPrograms() {
    List<String> columns = [
      'Program Name',
      'Category',
      'Created By',
      'Email',
      'View',
    ];

    List<Map<String, dynamic>> data = [
      {
        'program': 'Leadership Growth',
        'category': 'Engineer',
        'createdBy': '(202) 555–0191',
        'email': 'contact@c',
      },
      {
        'program': 'Tech Mentorship',
        'category': 'Doctor',
        'createdBy': '(303) 555–0123',
        'email': 'support@li',
      },
      {
        'program': 'Career Guidance',
        'category': 'Artist',
        'createdBy': '(404) 555–0145',
        'email': 'info@techs',
      },
      {
        'program': 'Business Skills',
        'category': 'Chef',
        'createdBy': '(505) 555–0167',
        'email': 'hello@desi',
      },
      {
        'program': 'Soft Skills',
        'category': 'Teacher',
        'createdBy': '(606) 555–0189',
        'email': 'team@futu',
      },
    ];
    return CustomLayout(
      title: 'Top Programs',
      showTitleExternalLink: true,
      child: TableTemplateWidget(
        columns: columns,
        dataRow: List.generate(
          data.length,
          (index) => DataRow(
            cells: [
              DataCell(_buildRowText(text: data[index]['program'].toString())),
              DataCell(_buildRowText(text: data[index]['category'].toString())),
              DataCell(
                  _buildRowText(text: data[index]['createdBy'].toString())),
              DataCell(_buildRowText(text: data[index]['email'].toString())),
              const DataCell(
                Icon(
                  Icons.visibility_outlined,
                  color: AppColors.blackColor,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopMentors() {
    List<String> columns = [
      'Mentor Name',
      'Program',
      'Email',
      'Rating',
      'View',
    ];

    List<Map<String, dynamic>> data = [
      {
        'mentorName': 'John kennedy',
        'program': 'Teaching Program',
        'email': 'johnk@gmail.com',
        'rating': '4.9',
      },
      {
        'mentorName': 'Jenifer Smith',
        'program': 'Teaching Program',
        'email': 'jenny@gmail.com',
        'rating': '4.8',
      },
      {
        'mentorName': 'Thomas shelby',
        'program': 'Teaching Program',
        'email': 'thomas@gmail.com',
        'rating': '4.7',
      },
      {
        'mentorName': 'John Miller',
        'program': 'Teaching Program',
        'email': 'miller@gmail.com',
        'rating': '4.5',
      },
      {
        'mentorName': 'Jason Morgan',
        'program': 'Teaching Program',
        'email': 'jason@gmail.com',
        'rating': '4.8',
      },
    ];
    return CustomLayout(
      title: 'Top Mentors',
      showTitleExternalLink: true,
      child: TableTemplateWidget(
        columns: columns,
        dataRow: List.generate(
          data.length,
          (index) => DataRow(
            cells: [
              DataCell(
                  _buildRowText(text: data[index]['mentorName'].toString())),
              DataCell(_buildRowText(text: data[index]['program'].toString())),
              DataCell(_buildRowText(text: data[index]['email'].toString())),
              DataCell(Row(
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: Color(0xFFFFBB00),
                  ),
                  _buildRowText(
                    text: data[index]['rating'].toString(),
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              )),
              const DataCell(
                Icon(
                  Icons.visibility_outlined,
                  color: AppColors.blackColor,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRowText(
          {required String text, Color? color, FontWeight? fontWeight}) =>
      Text(
        text,
        style: AppFont.style(
          textStyle: TextStyle(
              color: color ?? AppColors.blackColor,
              fontWeight: fontWeight ?? FontWeight.w400),
        ),
      );

  Widget _buildTypeMetrics() {
    List<Map<String, dynamic>> programs = [
      {'type': 'Premium', 'count': 40, 'color': const Color(0xFFFFBB00)},
      {'type': 'Free', 'count': 54, 'color': AppColors.primaryColor},
    ];
    return CustomLayout(
      title: 'Program Type Metrics',
      height: 415,
      actionWidget: const DropDownWidget(
        items: ['Month', 'Year'],
      ),
      child: Expanded(child: PieChartWidget(programs: programs)),
    );
  }

  Widget _buildModeMetrics() {
    List<Map<String, dynamic>> programs = [
      {'type': 'Virtual', 'count': 36, 'color': AppColors.primaryColor},
      {'type': 'Physical', 'count': 50, 'color': const Color(0xFFD4E6FF)},
    ];
    return CustomLayout(
      title: 'Program Mode Metrics',
      actionWidget: const DropDownWidget(
        items: ['Month', 'Year'],
      ),
      height: 415,
      child: Expanded(child: PieChartWidget(programs: programs)),
    );
  }
}
