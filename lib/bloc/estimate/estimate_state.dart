part of 'estimate_bloc.dart';

sealed class EstimateState extends Equatable {
  const EstimateState();

  @override
  List<Object> get props => [];
}

final class EstimateInitial extends EstimateState {}

final class EstimateLoading extends EstimateState {}

final class EstimateSuccess extends EstimateState {}

final class EstimateError extends EstimateState {
  final String error;

  EstimateError(this.error);

  @override
  List<Object> get props => [error];
}
