import 'package:flutter/material.dart';
import 'package:todo/Utils/dialog_box.dart';
import 'package:todo/Utils/prefrence_const.dart';
import 'package:todo/Utils/todo_tile.dart';


import 'Utils/long_press_dialog_box.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{
  final _controller = TextEditingController();

  List todoList = [
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
        PreferenceConstants.loadAllTaskAvailable().then((value) {
        todoList = PreferenceConstants.todoList;
      });
    });
    
  }

  void checkBoxChanged(bool? value, int index){
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }
  

void deleteEditTask(int index){
    showDialog(context: context, builder: (builder){
        return LongPressDialogBox(onEdit: (){
          print('Edit Functionality');
          setState(() {
            // code for edit the preferences
          });
        }, onDelete: (){
          print('Delete functionality');
          setState(() {
            todoList.removeAt(index);
            PreferenceConstants.removeTask(index);
            print([_controller.text]);
          });
          Navigator.pop(context);
        });
    });
  }

  void createNewTaskbar(){
    showDialog(
      context: context, 
      builder: (context){
        return DialogBox(
          controller: _controller,
          onSave: () async {
            setState((){
              print(_controller.text);
              todoList.add([_controller.text,false]);
              _controller.clear();
            });

            await PreferenceConstants.saveTask(_controller.text);

            Navigator.of(context).pop();
          },
          onCancle: () => Navigator.of(context).pop(),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.yellow,
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTaskbar,
        child: Icon(Icons.add),),
      appBar: AppBar(
        title: Text('TO DO'),
        elevation: 0,
      ),

      body: ListView.builder(
        itemCount: PreferenceConstants.todoList.length,
        itemBuilder: (context, index) => GestureDetector(
          onLongPress: (){
            // print('Long pressed ${todoList[index][0]}');

          },
          child: TodoTile(taskName: PreferenceConstants.todoList[index][0], 
                          taskCompleted: PreferenceConstants.todoList[index][1],
                          onChanged: (value) => checkBoxChanged(value, index), 
                          onLongPress: () {deleteEditTask(index); }
                          )
        ),
      ),
    );
  }
}