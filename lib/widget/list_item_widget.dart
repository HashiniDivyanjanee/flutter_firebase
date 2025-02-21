import 'package:flutter/material.dart';
import 'package:flutter_firebase/constant/themes.dart';
import 'package:flutter_firebase/models/customer.dart';

class ListItemWidget extends StatelessWidget {
  final Customer data;
  final VoidCallback callback_edit;
   final VoidCallback callback_delete;
  const ListItemWidget({super.key, required this.data, required this.callback_edit, required this.callback_delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppThemes.cardBackgroundColor,
      margin: const EdgeInsets.all(5),
      elevation: 8,
      shadowColor: AppThemes.PrimaryColor,
      child: ListTile(
        dense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        title: Text(
          data.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Column(
          children: [
            Row(
              children: [
                Text(
                  data.phone,
                  style: const TextStyle(
                      color: AppThemes.PrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                const Spacer(),
                Text(
                  data.address,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                const Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.edit,
                  ),
                  onPressed: callback_edit,
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: const Color.fromARGB(255, 207, 22, 9),
                  ),
                  onPressed: callback_delete,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
