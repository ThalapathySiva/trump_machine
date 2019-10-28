import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:trump_machine/services/services.dart';
import 'package:trump_machine/widgets/fave_icon.dart';

class TrumpCard extends StatelessWidget {
  TrumpCard({
    Key key,
    @required this.service,
    @required this.quoteText,
    this.index,
  }) : super(key: key);

  final Services service;
  final String quoteText;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Wrap(
              children: <Widget>[
                Icon(Icons.format_quote),
                Text(quoteText),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.format_quote))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FaveIcon(quote: service.quoteList[index]),
                IconButton(
                  tooltip: 'Share',
                  onPressed: () {
                    Share.share(quoteText);
                  },
                  icon: Icon(
                    FontAwesomeIcons.share,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
