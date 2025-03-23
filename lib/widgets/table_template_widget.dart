import 'package:flutter/material.dart';

import '../properties/app_colors.dart';
import '../properties/app_fonts.dart';

class TableTemplateWidget extends StatefulWidget {
  final List<String> columns;
  final List<DataRow> dataRow;
  const TableTemplateWidget(
      {super.key, required this.columns, required this.dataRow});

  @override
  State<TableTemplateWidget> createState() => _TableTemplateWidgetState();
}

class _TableTemplateWidgetState extends State<TableTemplateWidget> {
  late ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 0);
  }

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      controller: _scrollController,
      thumbColor: AppColors.blackColor,
      trackColor: AppColors.borderColor,
      thumbVisibility: true,
      trackVisibility: true,
      thickness: 4,
      radius: const Radius.circular(4),
      trackRadius: Radius.zero,
      trackBorderColor: AppColors.borderColor,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: DataTable(
              headingRowHeight: 60,
              border: const TableBorder(
                horizontalInside: BorderSide(
                  color: AppColors.borderColor,
                ),
              ),
              dividerThickness: 0.2,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.borderColor,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              headingRowColor: const WidgetStatePropertyAll(Color(0xFFD9E4F2)),
              columns: List.generate(
                widget.columns.length,
                (index) => _buildDataColumn(text: widget.columns[index]),
              ),
              rows: widget.dataRow,
            ),
          ),
        ),
      ),
    );
  }

  DataColumn _buildDataColumn({required String text}) => DataColumn(
        label: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: AppFont.style(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
          ),
        ),
      );
}
