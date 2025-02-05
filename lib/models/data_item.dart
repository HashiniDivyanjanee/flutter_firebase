import 'package:cloud_firestore/cloud_firestore.dart';

class DataItem {
  final String? id;
  final String title;
  final String description;

  DataItem({this.id, required this.title, required this.description});

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'timestamp': FieldValue.serverTimestamp(),
      };

  factory DataItem.fromJson(Map<String, dynamic> json, String id) =>
      DataItem(id: id, title: json['title'], description: json['description']);
}
