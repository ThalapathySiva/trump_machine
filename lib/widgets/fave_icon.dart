import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trump_machine/models/DBQuote.dart';
import 'package:trump_machine/services/database_service.dart';

class FaveIcon extends StatefulWidget {
  final DBQuote quote;

  const FaveIcon({Key key, this.quote}) : super(key: key);

  _FaveIconState createState() => _FaveIconState();
}

class _FaveIconState extends State<FaveIcon> {
  bool fave = false;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    fave ? icon = Icons.favorite : icon = Icons.favorite_border;

    return IconButton(
      onPressed: () {
        setState(() {
          if (fave) {
            setState(() {
              fave = false;
              DBQuoteProvider.db.newQuote(dBQuoteFromJson(widget.quote));
              print('removing ${widget.quote.value}');
            });
          } else {
            setState(() {
              fave = true;
              //remove

              print('adding ${widget.quote.value}');
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
