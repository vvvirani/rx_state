import 'package:example/locator/locator.dart';
import 'package:example/providers/data_provider.dart';
import 'package:example/views/second_page.dart';
import 'package:flutter/material.dart';
import 'package:rx_state/rx_state.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DataProvider _dataProvider = locator<DataProvider>();

  @override
  void initState() {
    super.initState();
    _dataProvider.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Rx State Demo Home Page')),
      body: RxObserverBuilder(
        builder: () {
          return _dataProvider.isLoading
              ? _buildLoading()
              : _buildTodosListView();
        },
      ),
    );
  }

  Widget _buildLoading() {
    return Center(child: CircularProgressIndicator());
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
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SecondPage()));
          },
        );
      },
    );
  }
}
