import 'package:example/locator/locator.dart';
import 'package:example/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:rx_state/rx_state.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  DataProvider _dataProvider = locator<DataProvider>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: RxObservable(
        builder: () {
          return _buildTodosListView();
        },
      ),
    );
  }

  Widget _buildTodosListView() {
    return ListView.builder(
      itemCount: _dataProvider.todos.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_dataProvider.todos[index].title!),
          trailing: Switch(
            value: _dataProvider.todos[index].completed!,
            onChanged: (val) {
              _dataProvider.updateTodo(index, val);
            },
          ),
        );
      },
    );
  }
}
