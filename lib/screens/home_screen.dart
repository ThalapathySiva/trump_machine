import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';

import 'package:trump_machine/shared/bot_nav.dart';
import 'package:trump_machine/widgets/search_button.dart';

import '../services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final searchController = TextEditingController();
  final searchNode = FocusNode();
  final buttonNode = FocusNode();

  Widget buildSearchInput(service) {
    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: Icon(FontAwesomeIcons.search),
          labelText: 'What does Trump say about....'),
      autofocus: true,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (value) {
        searchNode.unfocus();
        FocusScope.of(context).requestFocus(buttonNode);
      },
      controller: searchController,
      focusNode: searchNode,
      autocorrect: true,
      onChanged: (value) {
        service.setSearchTerm = value;
      },
    );
  }

  Widget title(context) {
    return Text(
      'Quotes',
      style: Theme.of(context).primaryTextTheme.headline.copyWith(
            color: Colors.white,
          ),
    );
  }

  Widget logo(context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Image.asset('images/logo.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var service = Provider.of<Services>(context);
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: BotNav(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        brightness: Brightness.dark,
        title: title(context),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              logo(context),
              Form(
                key: _formKey,
                child: Container(
                  width: width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildSearchInput(service),
                      SizedBox(height: 36),
                      SearchButton(buttonNode: buttonNode, service: service),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
