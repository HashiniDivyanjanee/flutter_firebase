import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/models/data_item.dart';

class DataRepository {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('items');

  // Save Data
  Future<void> saveData(String title, String description) async {
    await _collection
        .add(DataItem(title: title, description: description).toJson());
  }

  // Load Data
  Future<List<DataItem>> loadData() async {
    final snapshot = await _collection.orderBy('timestamp').get();
    return snapshot.docs
        .map((doc) =>
            DataItem.fromJson(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  // Delete Data
  Future<void> deleteData(String id) async {
    await _collection.doc(id).delete();
  }

  // Update Data
  Future<void> updateData(String id, String title, String description) async {
    await _collection.doc(id).update({
      'title': title,
      'description': description,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
