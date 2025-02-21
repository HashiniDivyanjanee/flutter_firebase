import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/bloc/customer/customer_bloc.dart';
import 'package:flutter_firebase/widget/app_bar_widget.dart';
import 'package:flutter_firebase/widget/list_item_widget.dart';

class CustomerView extends StatefulWidget {
  CustomerView({super.key});

  @override
  State<CustomerView> createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _landlineController = TextEditingController();

  void initState() {
    super.initState();
    BlocProvider.of<CustomerBloc>(context).add(LoadCustomerEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        appBarName: 'Customer',
      ),
      body: BlocBuilder<CustomerBloc, CustomerState>(builder: (context, state) {
        if (state is CustomerLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CustomerSuccess) {
          return ListView.builder(
              itemCount: state.customer.length,
              itemBuilder: (context, index) {
                return ListItemWidget(
                  data: state.customer[index],
                  callback_edit: () {
                    _nameController.text = state.customer[index].name;
                    _phoneController.text = state.customer[index].phone;
                    _addressController.text = state.customer[index].address;
                    _nicController.text = state.customer[index].nic;
                    _landlineController.text = state.customer[index].landline;
                    showDialog(
                      context: context,
                      builder: (dialogContext) => AlertDialog(
                        title: Text('Edit Item'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: _nameController,
                              decoration:
                                  const InputDecoration(labelText: 'Name'),
                            ),
                            TextField(
                              controller: _phoneController,
                              decoration: const InputDecoration(
                                  labelText: 'Phone Number'),
                            ),
                            TextField(
                              controller: _landlineController,
                              decoration: const InputDecoration(
                                  labelText: 'Landline Number'),
                            ),
                            TextField(
                              controller: _addressController,
                              decoration:
                                  const InputDecoration(labelText: 'Address'),
                            ),
                            TextField(
                              controller: _nicController,
                              decoration: const InputDecoration(
                                  labelText: 'NIC Number'),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                BlocProvider.of<CustomerBloc>(dialogContext)
                                    .add(UpdateCustomerEvent(
                                  state.customer[index].cid!,
                                  _nameController.text,
                                  _nicController.text,
                                  _phoneController.text,
                                  _landlineController.text,
                                  _addressController.text,
                                ));
                                Navigator.pop(context);
                              },
                              child: Text('Update'))
                        ],
                      ),
                    );
                  },
                  callback_delete: () {
                    context
                        .read<CustomerBloc>()
                        .add(DeleteCustomerEvent(state.customer[index].cid!));
                  },
                );
              });
        } else if (state is CustomerError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return Center(child: Text("No data available"));
      }),
    );
  }
}
