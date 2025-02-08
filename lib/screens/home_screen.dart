import 'package:flutter/material.dart';
import 'package:fl_sm/task/task_list.dart';
import 'package:fl_sm/themes/theme_manager.dart';
import 'add_task_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
      builder: (context, themeManager, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('To-Do List'),
            actions: [
              Switch(
                value: themeManager.isDark,
                onChanged: (value) => themeManager.toggleTheme(),
              ),
            ],
          ),
          body: TaskList(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTaskScreen(
                    onTaskAdded: (task) {
                      // Add task logic using state management
                    },
                  ),
                ),
              );
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}