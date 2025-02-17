import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/models/estimate.dart';

class EstimateRepo {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('estimate');

// ** Save Estimate ** //
  Future<void> SaveEstimate(
    String JobType,
    String VehicleType,
    String Brand,
    String Model,
    String licensePlate,
    String Customer,
    String CustPhone,
  ) async {
    await _collection.add(EstimateItem(
      JobType: JobType,
      VehicleType: VehicleType,
      Brand: Brand,
      Model: Model,
      licensePlate: licensePlate,
      Customer: Customer,
      CustPhone: CustPhone,
    ).toJson());
  }

// ** Load Estimate ** //
  Future<List<EstimateItem>> LoadEstimate() async {
    final snapshot = await _collection.orderBy('DateTime').get();
    return snapshot.docs
        .map((doc) =>
            EstimateItem.fromJson(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  // ** Update Estimate ** //
  Future<void> UpdateEstimate(
    String id,
    String JobType,
    String VehicleType,
    String Brand,
    String Model,
    String licensePlate,
    String Customer,
    String CustPhone,
  ) async {
    await _collection.doc(id).update({
      'JobType': JobType,
      'VehicleType': VehicleType,
      'Brand': Brand,
      'Model': Model,
      'licensePlate': licensePlate,
      'Customer': Customer,
      'CustPhone': CustPhone,
      'DateTime': FieldValue.serverTimestamp(),
    });
  }

  // ** Delete Estimate ** //
  Future<void> DeleteEstimate(String id) async {
    await _collection.doc(id).delete();
  }
}
