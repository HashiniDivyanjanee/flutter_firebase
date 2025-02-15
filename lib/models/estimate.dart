import 'package:cloud_firestore/cloud_firestore.dart';

class EstimateItem {
  final String? Eid;
  final String JobType;
  final String VehicleType;
  final String Brand;
  final String Model;
  final String licensePlate;
  final String Customer;
  final String CustPhone;

  EstimateItem(
      {this.Eid,
      required this.JobType,
      required this.VehicleType,
      required this.Brand,
      required this.Model,
      required this.licensePlate,
      required this.Customer,
      required this.CustPhone});

  Map<String, dynamic> toJson() => {
        'JobType': JobType,
        'VehicleType': VehicleType,
        'Brand': Brand,
        'Model': Model,
        'licensePlate': licensePlate,
        'DateTime': FieldValue.serverTimestamp(),
        'Customer': Customer,
        'CustPhone': CustPhone,
      };

  factory EstimateItem.fromJson(Map<String, dynamic> json, String Eid) =>
      EstimateItem(
        Eid: Eid,
        JobType: json['JobType'],
        VehicleType: json['VehicleType'],
        Brand: json['Brand'],
        Model: json['Model'],
        licensePlate: json['licensePlate'],
        Customer: json['Customer'],
        CustPhone: json['CustPhone'],
      );
}
