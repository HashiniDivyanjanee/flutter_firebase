import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'estimate_event.dart';
part 'estimate_state.dart';

class EstimateBloc extends Bloc<EstimateEvent, EstimateState> {
  EstimateBloc() : super(EstimateInitial()) {
    on<EstimateEvent>((event, emit) {
    
    });
  }
}
