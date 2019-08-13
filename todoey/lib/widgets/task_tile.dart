import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isCheck;
  final String title;
  final Function checkboxCallback;

  TaskTile({this.isCheck, this.title, this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          decoration: isCheck ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isCheck,
        activeColor: Colors.lightBlue,
        onChanged: checkboxCallback,
      ),
    );
  }
}
