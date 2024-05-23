import 'package:flutter/material.dart';

class TodoAddDialog extends StatefulWidget {
  const TodoAddDialog({super.key});

  @override
  State<TodoAddDialog> createState() => _TodoAddDialogState();
}

class _TodoAddDialogState extends State<TodoAddDialog> {
  final _formKey = GlobalKey<FormState>();

  String title = "";

  void _add() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.pop(context, {
        "title": title,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 184, 184, 184),
      title: const Text(
        "Add Todo",
        style: TextStyle(color: Color.fromARGB(255, 82, 82, 82), fontSize: 15),
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Write",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Enter a title";
                }
                return null;
              },
              onSaved: (newValue) {
                title = newValue ?? "";
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Close',
            style: TextStyle(color: Color.fromARGB(255, 217, 14, 0)),
          ),
        ),
        ElevatedButton(
          onPressed: _add,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 205, 205, 205),
            foregroundColor: Color.fromARGB(255, 0, 81, 24),
          ),
          child: const Text("Add"),
        )
      ],
    );
  }
}
