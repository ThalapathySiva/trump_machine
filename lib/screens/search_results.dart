import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trump_machine/models/quote.dart';
import 'package:trump_machine/services.dart';
import 'package:trump_machine/widgets/result_tile.dart';

class SearchResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var service = Provider.of<Services>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        brightness: Brightness.dark,
        automaticallyImplyLeading: true,
        title: Text(
          'Results',
          style: Theme.of(context)
              .primaryTextTheme
              .headline
              .copyWith(color: Colors.white),
        ),
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) => Divider(
                thickness: 2,
              ),
          itemCount: service.quoteList.length,
          itemBuilder: (BuildContext context, int index) {
            Quote quote = service.quoteList[index];
            return ResultTile(quote: quote);
          }),
    );
  }
}
