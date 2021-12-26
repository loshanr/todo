import 'package:flutter/material.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
