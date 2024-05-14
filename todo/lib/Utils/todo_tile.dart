
import 'package:flutter/material.dart';
import 'package:todo/Utils/long_press_dialog_box.dart';

class TodoTile extends StatelessWidget{
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  VoidCallback onLongPress;

   TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.onLongPress
    });


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: GestureDetector(
        onLongPress: onLongPress,
        child: Container(
            padding: EdgeInsets.all(24),
            child: 
            Row(
              children: [
              Checkbox(value: taskCompleted, onChanged: onChanged, activeColor: Colors.black,),
              Text(taskName,
            style: TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none),),
          ],
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 224, 210, 77),
          borderRadius: BorderRadius.circular(12),
        ),
        )
        
        // task name
        
      )
      
    );

  }
}