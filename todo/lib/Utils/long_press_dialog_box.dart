import 'package:flutter/material.dart';
import 'package:todo/Utils/my_button.dart';

class LongPressDialogBox extends StatelessWidget{
  VoidCallback onEdit;
  VoidCallback onDelete;

  LongPressDialogBox({super.key, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
          backgroundColor: Colors.yellow[300],
          content: Container(
          height: 200,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(text: 'Edit', onPressed: onEdit),
                const SizedBox(width: 8,),
                MyButton(text: 'Delete', onPressed: onDelete)
              ],
            )
          ],
        ),
      ),
      
      
    );
  }
}