import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'To Do Application 2022',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 8),
              const Text('Version 0.0.1'),
              const SizedBox(height: 32),
              const Text('Developer'),
              const SizedBox(height: 8),
              Text(
                'Loshan Ranjeewa',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 8),
              const Text('Loshanranjeewa@gmail.com'),
              const SizedBox(height: 32),
              const Text('Purpose of Development is to provide'),
              const Text('as an assignment to Wrexham Glyndwr University'),
              const SizedBox(height: 8),
              Text(
                'Subject:',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const Text('COM640 21/22 LONDONTEC Advanced Mobile Development'),
              const Text(' Student ID: 21003706'),
            ],
          ),
        ),
      ),
    );
  }
}
