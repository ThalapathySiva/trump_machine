import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:trump_machine/models/quote.dart';

import 'package:trump_machine/services.dart';
import 'package:trump_machine/widgets/fave_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultTile extends StatelessWidget {
  final Quote quote;

  const ResultTile({Key key, this.quote}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var service = Provider.of<Services>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(FontAwesomeIcons.poop),
          color: Theme.of(context).iconTheme.color,
        ),
        initiallyExpanded: false,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FaveIcon(),
              IconButton(
                tooltip: 'Share',
                onPressed: () {
                  Share.share(quote.value);
                },
                icon: Icon(
                  FontAwesomeIcons.share,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Linkify(
            onOpen: (link) async {
              if (await canLaunch(link.url)) {
                await launch(link.url);
              } else {
                throw 'Could not launch $link';
              }
            },
            style: Theme.of(context).primaryTextTheme.body1,
            humanize: true,
            text: quote.value,
          ),
        ),
      ),
    );
  }
}
