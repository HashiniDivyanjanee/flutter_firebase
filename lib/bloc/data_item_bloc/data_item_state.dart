part of 'data_item_bloc.dart';

abstract class DataItemState extends Equatable {
  const DataItemState();

  @override
  List<Object> get props => [];
}

final class DataItemInitial extends DataItemState {}

class DataLoading extends DataItemState {}

class DataSuccess extends DataItemState {
  final List<DataItem> items;
  DataSuccess(this.items);

  @override
  List<Object> get props => [items];
}

class DataError extends DataItemState {
  final String message;

  DataError(this.message);

  @override
  List<Object> get props => [message];
}
