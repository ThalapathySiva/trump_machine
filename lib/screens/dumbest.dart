import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trump_machine/screens/search_results.dart';
import 'package:trump_machine/services.dart';
import 'package:trump_machine/shared/bot_nav.dart';
import 'package:trump_machine/widgets/result_tile.dart';

class DumbestEverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var service = Provider.of<Services>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        brightness: Brightness.dark,
        title: Text('My Favorite Trump Quotes'),
      ),
      bottomNavigationBar: BotNav(),
      body: service.faveList.length > 0
          ? ListView.builder(
              itemCount: service.faveList.length,
              itemBuilder: (BuildContext context, int index) {
                var quote = service.faveList[index];
                if (service.faveList.isNotEmpty) {
                  return ResultTile(
                    quote: quote,
                  );
                }
                return null;
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
