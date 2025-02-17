part of 'estimate_bloc.dart';

abstract class EstimateEvent extends Equatable {
  const EstimateEvent();

  @override
  List<Object> get props => [];
}

// *** Save Estimate *** //
class SaveEstimate extends EstimateEvent {
  final String JobType;
  final String VehicleType;
  final String Brand;
  final String Model;
  final String licensePlate;
  final String Customer;
  final String CustPhone;

  SaveEstimate(
      {required this.JobType,
      required this.VehicleType,
      required this.Brand,
      required this.Model,
      required this.licensePlate,
      required this.Customer,
      required this.CustPhone});
}

// *** Load Estimate *** //
class LoadEstimate extends EstimateEvent {}

// *** Update Estimate *** //
class UpdateEstimate extends EstimateEvent {
  final String id;
  final String JobType;
  final String VehicleType;
  final String Brand;
  final String Model;
  final String licensePlate;
  final String Customer;
  final String CustPhone;

  UpdateEstimate(this.id, 
      {required this.JobType,
      required this.VehicleType,
      required this.Brand,
      required this.Model,
      required this.licensePlate,
      required this.Customer,
      required this.CustPhone});
}

// *** Delete Estimate *** //
class DeleteEstimate extends EstimateEvent {
  final String id;

  DeleteEstimate({required this.id});
}
