import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/bloc/app_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO'),
        actions: [
          IconButton(
            icon: const Icon(Icons.select_all),
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
          ),
        ],
      ),
      body: Center(
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(color: Colors.black),
          itemCount: 3,
          itemBuilder: (_, index) {
            return ListTile(
              leading: const Icon(Icons.radio_button_unchecked_rounded), //Icons.check_circle_rounded
              title: const Text('TODO'),
              onTap: () {
                Navigator.pushNamed(context, '/detail');
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              child: Text('TODO'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: const Text('Help'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Sign Out'),
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
