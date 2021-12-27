import 'package:flutter/material.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('TODO'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
