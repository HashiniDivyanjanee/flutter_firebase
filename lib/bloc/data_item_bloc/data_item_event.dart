part of 'data_item_bloc.dart';

abstract class DataItemEvent extends Equatable {
  const DataItemEvent();

  @override
  List<Object> get props => [];
}

class SaveDataEvent extends DataItemEvent {
  final String title;
  final String description;

  SaveDataEvent(this.title, this.description);
}

class LoadDataEvent extends DataItemEvent{}

class DeleteDataEvent extends DataItemEvent{
  final String id;

  DeleteDataEvent(this.id);
}

class EditDataEvent extends DataItemEvent{
  final String id;
  final String title;
  final String description;

  EditDataEvent(this.id, this.title, this.description);


}