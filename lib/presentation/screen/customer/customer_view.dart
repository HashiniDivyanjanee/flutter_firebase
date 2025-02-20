import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/bloc/customer/customer_bloc.dart';
import 'package:flutter_firebase/presentation/widget/app_bar_widget.dart';
import 'package:flutter_firebase/presentation/widget/list_item_widget.dart';

class CustomerView extends StatefulWidget {
  const CustomerView({super.key});

  @override
  State<CustomerView> createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
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
          return ListView.builder(itemBuilder: (context, index) {
            return ListItemWidget(data: state.customer[index]);
          });
        } else if (state is CustomerError) {
          return Center(child: Text("data"));
        }

        return Text("data");
      }),
    );
  }
}
