import 'package:amaliyot_41/models/todo_model.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final TodoModel todo;
  final Function() onDelete;
  final Function() onEdit;
  final Function() onChecked;
  const TodoItem(
    this.todo, {
    super.key,
    required this.onDelete,
    required this.onEdit,
    required this.onChecked,
  });

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: widget.onChecked,
        icon: Icon(widget.todo.isDone
            ? Icons.check_box_rounded
            : Icons.check_box_outlined),
      ),
      title: Text(
        widget.todo.title,
        style: TextStyle(
          decoration: widget.todo.isDone
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: widget.onEdit,
            icon: const Icon(
              Icons.edit,
              color: Color.fromARGB(255, 0, 164, 36),
            ),
          ),
          IconButton(
            onPressed: widget.onDelete,
            icon: const Icon(
              Icons.delete,
              color: Color.fromARGB(255, 233, 16, 0),
            ),
          )
        ],
      ),
    );
  }
}
