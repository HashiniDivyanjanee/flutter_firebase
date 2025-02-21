import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/front.dart';
import 'package:flutter_firebase/constant/themes.dart';

class DropDownList<T> extends StatelessWidget {
  final String? hint;
  final List<T> items;
  final T? value;
  final String Function(T)? itemLabelBuilder;
  final ValueChanged<T?> onChanged;
  final double? elevation;

  const DropDownList({ 
    this.hint,
    this.items = const [],
    required this.value,
    required this.onChanged,
    this.itemLabelBuilder,
    this.elevation = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15, top: 15),
      child: Container(
        decoration: BoxDecoration(
            color: AppThemes.cardBackgroundColor,
            borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: DropdownButtonFormField<T>(
          value: value,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
          hint: hint != null ? Text(hint!, style: const TextStyle(  color: AppThemes.SecondTextColor, fontSize: 15,
                    fontFamily: AppFontFamily.HintTextFont),) : null,
          items: items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                itemLabelBuilder != null
                    ? itemLabelBuilder!(item)
                    : item.toString(),
                style: const TextStyle(
                    color: AppThemes.SecondTextColor,fontSize: 14,
                    fontFamily: AppFontFamily.HintTextFont),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          dropdownColor: const Color.fromARGB(255, 229, 238, 241),
          elevation: elevation!.toInt(),
        ),
      ),
    );
  }
}
