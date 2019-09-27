import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../services.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key key,
    @required this.buttonNode,
    @required this.service,
    this.noMatches,
  }) : super(key: key);

  final FocusNode buttonNode;
  final Services service;
  final Function noMatches;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Container(
        child: FlatButton.icon(
          focusNode: buttonNode,
          padding: EdgeInsets.all(24),
          color: Colors.orange,
          label: Text(
            'Search',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          icon: Icon(
            FontAwesomeIcons.poop,
            color: Colors.brown,
          ),
          onPressed: () async {
            service.quoteList = [];
            await service.callApi(service.api, service.quoteList);
            if (service.quoteList.length > 0) {
              Navigator.pushNamed(context, '/results');
            } else {
              Scaffold.of(context).showSnackBar(SnackBar(
                duration: Duration(milliseconds: 300),
                elevation: 3,
                content: Text(
                  'No matches, try another subject',
                ),
              ));
            }
          },
        ),
      ),
    );
  }
}
