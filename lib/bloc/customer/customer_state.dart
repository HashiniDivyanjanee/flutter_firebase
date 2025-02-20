part of 'customer_bloc.dart';

abstract class CustomerState extends Equatable {
  const CustomerState();
  
  @override
  List<Object> get props => [];
}

final class CustomerInitial extends CustomerState {}

class CustomerLoading extends CustomerState{}

class CustomerSuccess extends CustomerState{
   final List<Customer> customer;
   CustomerSuccess(this.customer);

   @override
  List<Object> get props => [customer];

}

class CustomerError extends CustomerState{
  final String message; 
  CustomerError(this.message);

   @override
  List<Object> get props => [message];
}

