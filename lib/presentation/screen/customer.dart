import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/themes.dart';
import 'package:flutter_firebase/presentation/widget/app_bar_widget.dart';
import 'package:flutter_firebase/presentation/widget/buttons.dart';
import 'package:flutter_firebase/presentation/widget/main_title_widget.dart';
import 'package:flutter_firebase/presentation/widget/second_title.dart';
import 'package:flutter_firebase/presentation/widget/text_form_field.dart';

class Customer extends StatefulWidget {
  const Customer({super.key});

  @override
  State<Customer> createState() => _CustomerState();
}
class _CustomerState extends State<Customer> {
  final TextEditingController Customer_NameController = TextEditingController();
  final TextEditingController Customer_PhoneController =
      TextEditingController();
  final TextEditingController Customer_LandController = TextEditingController();
  final TextEditingController Customer_NicController = TextEditingController();
  final TextEditingController Customer_AddressController =
      TextEditingController();

clear(){
  Customer_AddressController.clear();
  Customer_LandController.clear();
  Customer_NameController.clear();
  Customer_NicController.clear();
  Customer_PhoneController.clear();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        appBarName: 'Customer',
      ),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.only(top: 30.0, right: 15, left: 15),
        child: Column(
          children: [
            const Title_Widget(
              title: 'CUSTOMER DETAILS',
            ),
            const Second_Title(
              second_title: 'Enter Customer Details',
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormFieldComponent(
              lableText: 'Customer Name',
              maxLines: 1,
              controller: Customer_NameController,
              obscureText: false,
              suffixIcon: Icons.person,
              inputType: TextInputType.name,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormFieldComponent(
              lableText: 'NIC',
              maxLines: 1,
              controller: Customer_NicController,
              obscureText: false,
              suffixIcon: Icons.indeterminate_check_box_outlined,
              inputType: TextInputType.text,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormFieldComponent(
              lableText: 'Phone Number',
              maxLines: 1,
              controller: Customer_PhoneController,
              obscureText: false,
              suffixIcon: Icons.phone,
              inputType: TextInputType.phone,
          
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormFieldComponent(
              lableText: 'Land Number',
              maxLines: 1,
              controller: Customer_LandController,
              obscureText: false,
              suffixIcon: Icons.quick_contacts_dialer_outlined,
              inputType: TextInputType.phone,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormFieldComponent(
              lableText: 'Address',
              maxLines: 1,
              controller: Customer_AddressController,
              obscureText: false,
              suffixIcon: Icons.location_on,
              inputType: TextInputType.text,
            ),
            const SizedBox(
              height: 5,
            ),
            ButtonComponent(
                buttonText: "SAVE",
                textColor: Colors.white,
                buttonColor: AppThemes.PrimaryColor,
                callback: () {
                  
                }),               
          ],
        ),
      )),
    );
  }
}
