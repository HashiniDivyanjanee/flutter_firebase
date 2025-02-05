import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_firebase/models/data_item.dart';
import 'package:flutter_firebase/repository/data_repository.dart';

part 'data_item_event.dart';
part 'data_item_state.dart';

class DataItemBloc extends Bloc<DataItemEvent, DataItemState> {
  final DataRepository repository;

  DataItemBloc(this.repository) : super(DataItemInitial()) {
    on<SaveDataEvent>(_saveData);
    on<LoadDataEvent>(_loadData);
    on<DeleteDataEvent>(_deleteData);
    on<EditDataEvent>(_editData);
  }

  Future<void> _saveData(
      SaveDataEvent event, Emitter<DataItemState> emit) async {
    emit(DataLoading());

    try {
      await repository.saveData(event.title, event.description);
      emit(DataSuccess(await repository.loadData()));
    } catch (e) {
      emit(DataError(e.toString()));
    }
  }

  Future<void> _loadData(
      LoadDataEvent event, Emitter<DataItemState> emit) async {
    emit(DataLoading());

    try {
      final items = await repository.loadData();
      emit(DataSuccess(items));
    } catch (e) {
      emit(DataError(e.toString()));
    }
  }

  Future<void> _deleteData(
      DeleteDataEvent event, Emitter<DataItemState> emit) async {
    emit(DataLoading());
    try {
      await repository.deleteData(event.id);
      emit(DataSuccess(await repository.loadData()));
    } catch (e) {
      emit(DataError(e.toString()));
    }
  }

  Future<void> _editData(
      EditDataEvent event, Emitter<DataItemState> emit) async {
    emit(DataLoading());
    try {
      await repository.updateData(event.id, event.title, event.description);
      emit(DataSuccess(await repository.loadData()));
    } catch (e) {
      emit(DataError(e.toString()));
    }
  }
}
