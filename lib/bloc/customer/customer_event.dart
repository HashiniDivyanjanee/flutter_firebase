part of 'customer_bloc.dart';

abstract class CustomerEvent extends Equatable {
  const CustomerEvent();

  @override
  List<Object> get props => [];
}

class SaveCustomerEvent extends CustomerEvent {
  final String name;
  final String nic;
  final String phone;
  final String landline;
  final String address;

  SaveCustomerEvent(
     this.name, this.nic, this.phone, this.landline, this.address);
}

class LoadCustomerEvent extends CustomerEvent {}

class UpdateCustomerEvent extends CustomerEvent {
  final String cid;
  final String name;
  final String nic;
  final String phone;
  final String landline;
  final String address;

  UpdateCustomerEvent(
      this.cid, this.name, this.nic, this.phone, this.landline, this.address);
}

class DeleteCustomerEvent extends CustomerEvent{
  final String cid;

  DeleteCustomerEvent(this.cid);
}
