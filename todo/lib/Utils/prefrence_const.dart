import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceConstants {

  static List<String> todoList = [];

// From here start to debug the code and try to fix this problem
  static Future<void> saveTask(String taskName,bool checked) async{
    final prefs = await SharedPreferences.getInstance();
    List<String> tasks = prefs.getStringList('tasks') ?? [];
    // List<bool>
    tasks.add(taskName);
    await prefs.setStringList('tasks', tasks);
  }

  static Future<List<String>> loadTasks() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('tasks') ?? [];
  }

  static Future<void> removeTask(int index) async{
    final prefs = await SharedPreferences.getInstance();
    List<String> tasks = prefs.getStringList('tasks') ?? [];
    tasks.remove(index);
    await prefs.setStringList('tasks', tasks);
  }

  static Future<void> loadAllTaskAvailable() async{
    todoList = await loadTasks();
  }

}