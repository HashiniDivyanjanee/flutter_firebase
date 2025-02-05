import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/bloc/data_item_bloc/data_item_bloc.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<DataItemBloc>().add(SaveDataEvent(
                    _titleController.text, _descriptionController.text));
              },
              child: Text('Save'),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(child: BlocBuilder<DataItemBloc, DataItemState>(
                builder: (context, state) {
              if (state is DataLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is DataError) {
                return Text('Error: ${state.message}');
              } else if (state is DataSuccess) {
                return ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) => ListTile(
                          title: Text(state.items[index].title),
                          subtitle: Text(state.items[index].description),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  _titleController.text =
                                      state.items[index].title;
                                  _descriptionController.text =
                                      state.items[index].description;
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text('Edit Item'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: _titleController,
                                            decoration: const InputDecoration(
                                                labelText: 'Title'),
                                          ),
                                          TextField(
                                            controller: _descriptionController,
                                            decoration: const InputDecoration(
                                                labelText: 'Description'),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              context.read<DataItemBloc>().add(
                                                  EditDataEvent(
                                                      state.items[index].id!,
                                                      _titleController.text,
                                                      _descriptionController
                                                          .text));
                                              Navigator.pop(context);
                                            },
                                            child: Text('Save'))
                                      ],
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  context.read<DataItemBloc>().add(
                                      DeleteDataEvent(state.items[index].id!));
                                },
                              )
                            ],
                          ),
                        ));
              }
              return Center(child: Text('No Data Available'));
            }))
          ],
        ),
      ),
    );
  }
}
