import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:trump_machine/services/services.dart';
import 'package:trump_machine/shared/bot_nav.dart';

import 'package:trump_machine/widgets/fave_icon.dart';
import 'package:trump_machine/widgets/top_bar.dart';
import 'package:trump_machine/widgets/trump_card.dart';

import 'package:url_launcher/url_launcher.dart';

class SearchResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var service = Provider.of<Services>(context);
    return Scaffold(
      appBar: TopBar(title: '${service.quoteList.length.toString()} Results'),
      bottomNavigationBar: BotNav(),
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
