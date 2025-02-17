class Customer {
  final String? cid;
  final String name;
  final String nic;
  final String phone;
  final String landline;
  final String address;

  Customer(
      {this.cid,
      required this.name,
      required this.nic,
      required this.phone,
      required this.landline,
      required this.address});

  Map<String, dynamic> toJson() => {
        'name': name,
        'nic': nic,
        'phone': phone,
        'landline': landline,
        'address': address
      };

  factory Customer.fromJson(Map<String, dynamic> json, String cid) => Customer(
      cid: cid,
      name: json['name'],
      nic: json['nic'],
      phone: json['phone'],
      landline: json['landline'],
      address: json['address']);
}
