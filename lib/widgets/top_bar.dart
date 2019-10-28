import 'package:flutter/material.dart';
import 'package:trump_machine/services/database_service.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final BuildContext context;

  @override
  final Size preferredSize;
  TopBar({
    @required this.title,
    this.context,
  }) : preferredSize = Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.share),
          onPressed: () {
            DBQuoteProvider.db.getFavoriteList();
          },
        )
      ],
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: Colors.white),
      automaticallyImplyLeading: true,
      title: Text(
        title,
        style: Theme.of(context)
            .primaryTextTheme
            .headline
            .copyWith(color: Colors.white),
      ),
    ));
  }
}
