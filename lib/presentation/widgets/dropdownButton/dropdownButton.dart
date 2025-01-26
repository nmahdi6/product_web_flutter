import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

DropdownButtonFormField<String> dropdownButton(String selectedItem,
    List<String> items, TextStyle textTheme, BuildContext context,
    {void Function(String?)? onChanged}) {
  return DropdownButtonFormField<String>(
    borderRadius: BorderRadius.circular(12),
    itemHeight: 50,
    isDense: false,
    decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.grey, width: 2),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.grey, width: 3),
        ),
        filled: true,
        fillColor: AppColors.black
        //     context.watch<SettingsCubit>().state.selectedDarkModeChartColor,
        ),
    icon: Row(
      children: [
        const Icon(Icons.arrow_drop_down),
        Text(
          "سال",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.white,
              fontSize: 24),
        ),
      ],
    ),
    value: selectedItem,
    isExpanded: true,
    dropdownColor: AppColors.black,
    // alignment: AlignmentDirectional.bottomStart,
    items: items
        .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: textTheme,
              ),
            ))
        .toList(),
    onChanged: (value) {
      onChanged.toString();
    },
  );
}
