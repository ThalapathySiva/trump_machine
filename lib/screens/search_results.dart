import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:trump_machine/services/services.dart';

import 'package:trump_machine/widgets/fave_icon.dart';

import 'package:url_launcher/url_launcher.dart';

class SearchResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var service = Provider.of<Services>(context);
    return Scaffold(
      appBar: TopBar(title: '${service.quoteList.length.toString()} Results'),
      body: ListView.builder(
          itemCount: service.quoteList.length,
          itemBuilder: (BuildContext context, int index) {
            var quoteText = service.quoteList[index].value;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: TrumpCard(
                service: service,
                quoteText: quoteText,
                index: index,
              ),
            );
          }),
    );
  }
}

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
