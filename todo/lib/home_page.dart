import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/Utils/dialog_box.dart';
import 'package:todo/Utils/prefrence_const.dart';
import 'package:todo/Utils/todo_tile.dart';
import 'package:todo/Utils/long_press_dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List<Map<String, dynamic>> todoList = [];

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  void loadTasks() async {
    await PreferenceConstants.loadAllTaskAvailable();
    setState(() {
      todoList = PreferenceConstants.todoList;
    });
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index]['completed'] = value!;
    });
    updatePreferences();
  }

  void deleteEditTask(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return LongPressDialogBox(
          onEdit: () {
            Navigator.pop(context);
            editTask(index);
          },
          onDelete: () {
            setState(() {
              todoList.removeAt(index);
            });
            PreferenceConstants.removeTask(index);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void editTask(int index){
    _controller.text = todoList[index]['task'];
    showDialog(context: context, builder: (context) {
      return DialogBox(
        controller : _controller,
        onSave: () async {
          String editetdTasking = _controller.text;
          setState(() {
            todoList[index]['task'] = editetdTasking;

          });
          updatePreferences();
          _controller.clear();
          Navigator.of(context).pop();
        }, onCancle: () { 
          _controller.clear();
            Navigator.of(context).pop();
         },

      );
    });
  }

  

  void createNewTaskbar() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: () async {
            String newTask = _controller.text;
            setState(() {
              // todoList.add({'task': newTask, 'completed': false});
            });

            await PreferenceConstants.saveTask(newTask);
            _controller.clear();

            Navigator.of(context).pop();
          },
           onCancle: () { Navigator.of(context).pop(); },
        );
      },
    );
  }

  void updatePreferences() async {
    List<String> savedTasks = todoList.map((task) => '${task['task']}|${task['completed']}').toList();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todoList', savedTasks);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTaskbar,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('TO DO'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPress: () => deleteEditTask(index),
            child: TodoTile(
              taskName: todoList[index]['task'],
              taskCompleted: todoList[index]['completed'],
              onChanged: (value) => checkBoxChanged(value, index),
              onLongPress: () => deleteEditTask(index),
            ),
          );
        },
      ),
    );
  }
}
