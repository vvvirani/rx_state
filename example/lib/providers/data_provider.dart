import 'package:example/models/todo_model.dart';
import 'package:example/services/http_service.dart';
import 'package:rx_state/rx_state.dart';

class DataProvider extends HttpService {
  RxBool _isLoading = RxBool(false);

  Rx<List<Todo>> _todos = Rx<List<Todo>>([]);

  void getTodos() async {
    try {
      _isLoading.toggle();
      Result result =
          await request(requestType: RequestType.get, path: 'todos');
      if (result is Success) {
        _todos.value = todoFromJson(result.value);
      }
    } finally {
      _isLoading.toggle();
    }
  }

  void updateTodo(int index, bool value) {
    _todos.value[index].completed = value;
    _todos.refresh();
  }

  bool get isLoading => _isLoading.value;

  List<Todo> get todos => _todos.value;
}
