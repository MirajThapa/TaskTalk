import 'package:shared_preferences/shared_preferences.dart';

class PreferenceConstants {
  static List<Map<String, dynamic>> todoList = [];

  // Load all tasks available in SharedPreferences
  static Future<void> loadAllTaskAvailable() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? savedTasks = prefs.getStringList('todoList');
    if (savedTasks != null) {
      todoList = savedTasks.map((task) {
        List<String> taskData = task.split('|');
        return {'task': taskData[0], 'completed': taskData[1] == 'true'};
      }).toList();
    }
  }

  // Save a new task to SharedPreferences
  static Future<void> saveTask(String task) async {
    final prefs = await SharedPreferences.getInstance();
    todoList.add({'task': task, 'completed': false});
    List<String> savedTasks = todoList.map((task) => '${task['task']}|${task['completed']}').toList();
    await prefs.setStringList('todoList', savedTasks);
  }

  // Remove a task from SharedPreferences
  static Future<void> removeTask(int index) async {
    final prefs = await SharedPreferences.getInstance();
    todoList.removeAt(index);
    List<String> savedTasks = todoList.map((task) => '${task['task']}|${task['completed']}').toList();
    await prefs.setStringList('todoList', savedTasks);
  }
}
