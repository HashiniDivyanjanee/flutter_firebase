import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_firebase/models/customer.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerBloc() : super(CustomerInitial()) {
    on<SaveCustomerEvent>(_saveCustomer);
    on<UpdateCustomerEvent>(_updateCustomer);
    on<LoadCustomerEvent>(_loadCustomer);
    on<DeleteCustomerEvent>(_deleteCustomer);
  }

  Future<void> _saveCustomer(
      SaveCustomerEvent event, Emitter<CustomerState> emit) async {}

  Future<void> _updateCustomer(
      UpdateCustomerEvent event, Emitter<CustomerState> emit) async {}

  Future<void> _loadCustomer(
      LoadCustomerEvent event, Emitter<CustomerState> emit) async {}

  Future<void> _deleteCustomer(
      DeleteCustomerEvent event, Emitter<CustomerState> emit) async {}
}
