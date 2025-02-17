import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_firebase/models/estimate.dart';
import 'package:flutter_firebase/repository/estimate_repo.dart';

part 'estimate_event.dart';
part 'estimate_state.dart';

class EstimateBloc extends Bloc<EstimateEvent, EstimateState> {
  final EstimateRepo repository;
  EstimateBloc(this.repository) : super(EstimateInitial()) {
    on<SaveEstimate>(_saveEstimate);
    on<UpdateEstimate>(_updateEstimate);
    on<LoadEstimate>(_loadEstimate);
    on<DeleteEstimate>(_deleteEstimate);
  }

  Future<void> _saveEstimate(
      SaveEstimate event, Emitter<EstimateState> emit) async {
    emit(EstimateLoading());
    try {
      await repository.SaveEstimate(
          event.JobType,
          event.VehicleType,
          event.Brand,
          event.Model,
          event.licensePlate,
          event.Customer,
          event.CustPhone);
      emit(EstimateSuccess(await repository.LoadEstimate()));
    } catch (e) {
      emit(EstimateError(e.toString()));
    }
  }

  Future<void> _loadEstimate(
      LoadEstimate event, Emitter<EstimateState> emit) async {
    emit(EstimateLoading());
    try {
      final Estimateitems = await repository.LoadEstimate();
      emit(EstimateSuccess(Estimateitems));
    } catch (e) {
      emit(EstimateError(e.toString()));
    }
  }

  Future<void> _updateEstimate(
      UpdateEstimate event, Emitter<EstimateState> emit) async {
    emit(EstimateLoading());
    try {
      await repository.UpdateEstimate(
          event.id,
          event.JobType,
          event.VehicleType,
          event.Brand,
          event.Model,
          event.licensePlate,
          event.Customer,
          event.CustPhone);
      emit(EstimateSuccess(await repository.LoadEstimate()));
    } catch (e) {
      emit(EstimateError(e.toString()));
    }
  }

  Future<void> _deleteEstimate(
    DeleteEstimate event, Emitter<EstimateState> emit) async{
      emit(EstimateLoading());
      try {
        await repository.DeleteEstimate(event.id);
        emit(EstimateSuccess(await repository.LoadEstimate()));
      } catch (e) {
        emit(EstimateError(e.toString()));
      }
    }
  
}
