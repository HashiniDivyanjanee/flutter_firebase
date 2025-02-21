import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/widget/drop_down_list.dart';
import 'package:flutter_firebase/widget/main_title_widget.dart';
import 'package:flutter_firebase/widget/second_title.dart';
import 'package:flutter_firebase/widget/select_date_field.dart';
import 'package:flutter_firebase/widget/text_form_field.dart';

class JobRegister extends StatefulWidget {
  JobRegister({super.key});

  @override
  State<JobRegister> createState() => _JobRegisterState();
}

class _JobRegisterState extends State<JobRegister> {
  final TextEditingController License_PlateController = TextEditingController();
  final TextEditingController MileageController = TextEditingController();
  final TextEditingController BrandController = TextEditingController();
  final TextEditingController ModelController = TextEditingController();
  final TextEditingController YearController = TextEditingController();
  final TextEditingController ColorController = TextEditingController();
  final TextEditingController InsuranceClaimController =
      TextEditingController();
  final TextEditingController Customer_NoteController = TextEditingController();
  final TextEditingController Office_NoteController = TextEditingController();
  final customerIdController = TextEditingController();
  final customerPhoneController = TextEditingController();
  final customerNameController = TextEditingController();
  List<File> selectedImages = [];
  String combinedValue = '';
  DateTime? ScheduledDate;
  String? selectedValue;

  final List<String> dropdownItems = [
    'RUNNING REPAIR',
    'NORMAL SERVICE',
    'BODY WASH',
    'ACCIDENT REPAIR',
    'FULL SERVICE'
  ];

  clear() {
    License_PlateController.clear();
    MileageController.clear();
    BrandController.clear();
    ModelController.clear();
    YearController.clear();
    ColorController.clear();
    InsuranceClaimController.clear();
    Customer_NoteController.clear();
    Office_NoteController.clear();
    customerNameController.clear();
    customerPhoneController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Title_Widget(
                    title: 'CUSTOMER DETAILS',
                  ),
                  const Second_Title(
                    second_title: 'Enter Customer Details',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormFieldComponent(
                    controller: customerPhoneController,
                    lableText: "Phone Number",
                    suffixIcon: Icons.phone,
                    inputType: TextInputType.phone,
                    textCapitalization: TextCapitalization.words,
                    obscureText: false,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      TextFormFieldComponent(
                        controller: customerIdController,
                        lableText: "Customer ID",
                        suffixIcon: Icons.person,
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        obscureText: false,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 16),
                      TextFormFieldComponent(
                        controller: customerNameController,
                        lableText: "Customer Name",
                        suffixIcon: Icons.person,
                        inputType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        obscureText: false,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Title_Widget(
                    title: 'VEHICLE INFORMATION',
                  ),
                  const Second_Title(
                    second_title: 'Enter Vehicle Details',
                  ),
                  DropDownList<String>(
                    items: dropdownItems,
                    value: selectedValue,
                    hint: 'Select Job Type',
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                  ),
                  SelectDateField(
                    onDateSelected: (date) {
                      setState(() {
                        ScheduledDate = date;
                      });
                    },
                  ),
                  TextFormFieldComponent(
                    controller: License_PlateController,
                    lableText: "Vehicle Number",
                    suffixIcon: Icons.numbers,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    obscureText: false,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormFieldComponent(
                    controller: MileageController,
                    lableText: "Current Mileage",
                    suffixIcon: Icons.height,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    obscureText: false,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormFieldComponent(
                    controller: BrandController,
                    lableText: "Brand",
                    suffixIcon: Icons.badge_rounded,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    obscureText: false,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormFieldComponent(
                    controller: ModelController,
                    lableText: "Model",
                    suffixIcon: Icons.model_training,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    obscureText: false,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormFieldComponent(
                    controller: YearController,
                    lableText: "Year",
                    suffixIcon: Icons.date_range,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    obscureText: false,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormFieldComponent(
                    controller: ColorController,
                    lableText: "Color",
                    suffixIcon: Icons.color_lens,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    obscureText: false,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Title_Widget(
                    title: 'BUSINESS DETAILS',
                  ),
                  const Second_Title(
                    second_title: 'Enter Basic Details for new work order',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormFieldComponent(
                    controller: InsuranceClaimController,
                    lableText: "Claim Availble",
                    suffixIcon: Icons.event_available,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    obscureText: false,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormFieldComponent(
                    controller: Customer_NoteController,
                    lableText: "Chassis Number",
                    suffixIcon: Icons.numbers,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    obscureText: false,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormFieldComponent(
                    controller: Office_NoteController,
                    lableText: "Note",
                    suffixIcon: Icons.mode,
                    inputType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    obscureText: false,
                    maxLines: 5,
                  ),
                  const Title_Widget(
                    title: 'IMAGES',
                  ),
                  Second_Title(second_title: 'Select Images to Upload'),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
