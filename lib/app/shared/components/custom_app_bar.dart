import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        expandedHeight: 150.0,
        flexibleSpace: const FlexibleSpaceBar(
          title: Text('Available seats'),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_circle),
            tooltip: 'Add new entry',
            onPressed: () {/* ... */},
          ),
        ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
