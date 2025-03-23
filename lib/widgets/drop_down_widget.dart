import 'package:flutter/material.dart';

import '../properties/app_colors.dart';
import '../properties/app_fonts.dart';

class DropDownWidget extends StatelessWidget {
  final String? text;
  final List<String> items;
  const DropDownWidget({
    super.key,
    this.text,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    String selectedItem = items.isNotEmpty ? items[0] : '';
    return SizedBox(
      width: 82,
      height: 32,
      child: DropdownButtonFormField<String>(
        style: AppFont.style(
          textStyle: const TextStyle(
            color: AppColors.primaryColor,
          ),
        ),
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppColors.primaryColor,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          labelText: text,
          fillColor: const Color(0xFFD9E4F2),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: const BorderSide(color: Colors.transparent),
            gapPadding: 0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: const BorderSide(color: Colors.transparent),
            gapPadding: 0,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: const BorderSide(color: Colors.transparent),
            gapPadding: 0,
          ),
        ),

        value: selectedItem, // Ensure selectedItem is valid
        items: items
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    item,
                    overflow: TextOverflow.ellipsis,
                    style: AppFont.style(
                      textStyle: const TextStyle(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: (value) {},
      ),
    );
  }
}
