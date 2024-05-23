import 'package:amaliyot_41/models/todo_model.dart';

class TodoController {
  final List<TodoModel> _list = [
    TodoModel(
      title: "Watching",
    ),
    TodoModel(
      title: "Teaching",
    ),
    TodoModel(
      title: "Sleeping",
    ),
  ];

  List<TodoModel> get list {
    return [..._list];
  }

  void add(String title) {
    _list.add(
      TodoModel(
        title: title,
      ),
    );
  }

  void update(int index, String title) {
    _list[index].title = title;
  }

  void makeDone(int index) {
    _list[index].isDone = !_list[index].isDone;
  }

  void delete(int index) {
    _list.removeAt(index);
  }

  int get markedItemsCount {
    int count = 0;
    for (var item in list) {
      if (item.isDone) {
        count++;
      }
    }
    return count;
  }
}
