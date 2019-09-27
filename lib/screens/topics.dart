import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trump_machine/screens/search_results.dart';
import 'package:trump_machine/shared/bot_nav.dart';

import '../services.dart';

class TopicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var service = Provider.of<Services>(context);
    return Scaffold(
      appBar: TopBar(
        context: context,
        title: 'Topics',
      ),
      bottomNavigationBar: BotNav(),
      body: FutureBuilder(
        future: service.callApiTag(service.tagList),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.connectionState == ConnectionState.done &&
              service.tagList.isNotEmpty) {
            print(service.tagList.length);
            return GridView.extent(
                padding: EdgeInsets.all(16),
                maxCrossAxisExtent: 160,
                children: service.tagList.map((tag) {
                  return ChoiceChip(
                    selected: false,
                    onSelected: (val) async {
                      service.setSearchTerm = tag.toString();
                      await service.callApi(
                        service.api,
                        service.quoteList,
                      );
                      if (service.quoteList != null) {
                        await Navigator.pushNamed(context, '/results');
                      }
                    },
                    padding: EdgeInsets.all(8),
                    elevation: 3,
                    label: Text(tag),
                  );
                }).toList());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
