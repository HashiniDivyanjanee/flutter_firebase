import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_firebase/models/customer.dart';
import 'package:flutter_firebase/repository/customer_repo.dart';
part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerRepository customer_repo;

  CustomerBloc(this.customer_repo) : super(CustomerInitial()) {
    on<SaveCustomerEvent>(_saveCustomer);
    on<UpdateCustomerEvent>(_updateCustomer);
    on<LoadCustomerEvent>(_loadCustomer);
    on<DeleteCustomerEvent>(_deleteCustomer);
  }

  Future<void> _saveCustomer(
      SaveCustomerEvent event, Emitter<CustomerState> emit) async {
    emit(CustomerLoading());
    try {
      await customer_repo.saveCustomer(
          event.name, event.nic, event.phone, event.landline, event.address);
      emit(CustomerSuccess(await customer_repo.loadCustomer()));
    } catch (e) {
      emit(CustomerError(e.toString()));
    }
  }

  Future<void> _updateCustomer(
      UpdateCustomerEvent event, Emitter<CustomerState> emit) async {
    emit(CustomerLoading());
    try {
      await customer_repo.updateCustomer(event.cid, event.name, event.nic,
          event.phone, event.landline, event.address);
      emit(CustomerSuccess(await customer_repo.loadCustomer()));
    } catch (e) {
      emit(CustomerError(e.toString()));
    }
  }

  Future<void> _loadCustomer(
      LoadCustomerEvent event, Emitter<CustomerState> emit) async {
    emit(CustomerLoading());
    try {
      final customers = await customer_repo.loadCustomer();
      emit(CustomerSuccess(customers));
    } catch (e) {
      emit(CustomerError(e.toString()));
    }
  }

  Future<void> _deleteCustomer(
      DeleteCustomerEvent event, Emitter<CustomerState> emit) async {
        emit(CustomerLoading());
        try {
          await customer_repo.deleteCustomer(event.cid);
          emit(CustomerSuccess(await customer_repo.loadCustomer()));
        } catch (e) {
          emit(CustomerError(e.toString()));
        }
      }
}
