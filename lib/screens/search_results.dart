import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:trump_machine/services.dart';
import 'package:trump_machine/widgets/fave_icon.dart';

import 'package:url_launcher/url_launcher.dart';

class SearchResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var service = Provider.of<Services>(context);
    return Scaffold(
      appBar: TopBar(title: '${service.quoteList.length.toString()} Results'),
      body: ListView.separated(
          separatorBuilder: (context, index) => Divider(
                thickness: 2,
              ),
          itemCount: service.quoteList.length,
          itemBuilder: (BuildContext context, int index) {
            var quoteText = service.quoteList[index].value;
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
                    text: quoteText,
                  ),
                ),
              ),
            );
          }),
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
