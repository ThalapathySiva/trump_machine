import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:trump_machine/models/quote.dart';

import 'package:trump_machine/services.dart';

class FaveIcon extends StatefulWidget {
  final Quote quote;

  const FaveIcon({Key key, this.quote}) : super(key: key);

  _FaveIconState createState() => _FaveIconState();
}

class _FaveIconState extends State<FaveIcon> {
  bool fave = false;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    var service = Provider.of<Services>(context);
    fave ? icon = Icons.favorite : icon = Icons.favorite_border;

    return IconButton(
      onPressed: () {
        setState(() {
          if (fave) {
            setState(() {
              widget.quote.setFave = true;
              service.faveList.add(widget.quote);
            });
          } else {
            setState(() {
              service.faveList.remove(widget.quote);
            });
          }
        });
      },
      icon: Icon(
        icon,
        color: Colors.red[200],
      ),
    );
  }
}
