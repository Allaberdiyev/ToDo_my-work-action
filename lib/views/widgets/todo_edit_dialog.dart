import 'package:flutter/material.dart';

class TodoEditDialog extends StatefulWidget {
  final String title;

  TodoEditDialog({
    required this.title,
    super.key,
  });

  TextEditingController titleInput = TextEditingController();

  @override
  State<TodoEditDialog> createState() => _TodoEditDialogState();
}

class _TodoEditDialogState extends State<TodoEditDialog> {
  final _formKey = GlobalKey<FormState>();

  String title = "";

  @override
  void initState() {
    super.initState();
    widget.titleInput.text = widget.title;
  }

  void _update() {
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
      backgroundColor: const Color.fromARGB(255, 175, 175, 175),
      title: const Text(
        "Edit Todo",
        style: TextStyle(fontSize: 17),
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
              controller: widget.titleInput,
            ),
            const SizedBox(
              height: 20,
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
            style: TextStyle(color: Color.fromARGB(255, 217, 0, 0)),
          ),
        ),
        ElevatedButton(
          onPressed: _update,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 191, 191, 191),
            foregroundColor: Color.fromARGB(255, 7, 107, 17),
          ),
          child: const Text("Update"),
        )
      ],
    );
  }
}
