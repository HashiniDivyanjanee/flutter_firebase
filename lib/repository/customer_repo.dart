import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/models/customer.dart';

class CustomerRepository {
  final CollectionReference _custCollection =
      FirebaseFirestore.instance.collection('customer');

// **Save Customer** //
  Future<void> saveCustomer(
    String name,
    String nic,
    String phone,
    String landline,
    String address,
  ) async {
    DocumentReference docRef = await _custCollection.add({
      'name': name,
      'nic': nic,
      'phone': phone,
      'landline': landline,
      'address': address
    });

    await docRef.update({'cid': docRef.id});
  }

// **Load Customer** //
  Future<List<Customer>> loadCustomer() async {
    final snapshot = await _custCollection.get();
    return snapshot.docs
        .map((doc) =>
            Customer.fromJson(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

// **Update Customer** //
  Future<void> updateCustomer(
    String cid,
    String name,
    String nic,
    String phone,
    String landline,
    String address,
  ) async {
    await _custCollection.doc(cid).update({
      name: name,
      nic: nic,
      phone: phone,
      landline: landline,
      address: address
    });
  }

// **Delete Customer** //
  Future<void> deleteCustomer(String cid) async {
    await _custCollection.doc(cid).delete();
  }
}
