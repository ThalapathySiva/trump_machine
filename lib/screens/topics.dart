import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trump_machine/shared/bot_nav.dart';

import '../services.dart';

class TopicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var service = Provider.of<Services>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        brightness: Brightness.dark,
        title: Text(
          'Topics',
          style: Theme.of(context)
              .primaryTextTheme
              .title
              .copyWith(color: Colors.white),
        ),
      ),
      bottomNavigationBar: BotNav(),
      body: FutureBuilder(
        future: service.callApiTag(service.tagList),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.data != null) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: service.tagList
                    .map(
                      (f) => ChoiceChip(
                        selected: false,
                        onSelected: (val) async {
                          service.setSearchTerm = f.toString();
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
                        label: Text(f),
                      ),
                    )
                    .toList(),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
