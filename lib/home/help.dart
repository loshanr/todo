import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Screen'),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'The application is designed to be used to maintain our day-to-day tasks or list everything that we have to do, with the most important tasks at the top of the list, and the least important tasks at the bottom. It is helpful in planning our daily schedules. We can add more tasks at any time and delete a task that is completed.'),
            SizedBox(height: 12),
            Text(
              'User Will be able to',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            Text(
                'Create (add) a new task or adding a new ToDo in the ToDo App'),
            SizedBox(height: 8),
            Text(
                'See all the tasks or view all the To Dos that were added to the app'),
            SizedBox(height: 8),
            Text('Add check mark and complete the task'),
            SizedBox(height: 8),
            Text('Delete any ToDo from the list of ToDos'),
            SizedBox(height: 8),
            Text('Exit from the app'),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
