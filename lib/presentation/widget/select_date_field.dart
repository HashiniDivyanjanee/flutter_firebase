import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/themes.dart';

class SelectDateField extends StatefulWidget {
   final ValueChanged<DateTime?> onDateSelected; 
    const SelectDateField({super.key, required this.onDateSelected});


  @override
  _SelectDateFieldState createState() => _SelectDateFieldState();
}

class _SelectDateFieldState extends State<SelectDateField> {
  DateTime? selectedDate;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),


      
      firstDate: DateTime(2022),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
      widget.onDateSelected(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15, left: 25, right: 25),
      decoration: BoxDecoration(
          color: AppThemes.cardBackgroundColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        style: const TextStyle(
            fontSize: 15,
            color: AppThemes.SecondTextColor,
            fontWeight: FontWeight.normal),
        readOnly: true,
        decoration: InputDecoration(
            hintText: selectedDate != null
                ? "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}"
                : "Schedule Date",
            suffixIcon: const Icon(
              Icons.calendar_month,
              color: AppThemes.PrimaryColor,
            ),
            border: const OutlineInputBorder(borderSide: BorderSide.none)),
        onTap: () => selectDate(context),
      ),
    );
  }
}
