import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/bloc/app_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO'),
        actions: [
          IconButton(
            icon: Icon(Icons.select_all),
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
          ),
        ],
      ),
      body: Center(
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(color: Colors.black),
          itemCount: 3,
          itemBuilder: (_, index) {
            return ListTile(
              leading: Icon(Icons.radio_button_unchecked_rounded), //Icons.check_circle_rounded
              title: Text('TODO'),
              onTap: () {
                Navigator.pushNamed(context, '/detail');
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('TODO'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Help'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Sign Out'),
              onTap: () {
                context.read<AppBloc>().add(AppSignoutRequested());
              },
            ),
          ],
        ),
      ),
    );
  }
}
