import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trump_machine/services/database_service.dart';

import 'package:trump_machine/services/services.dart';
import 'package:trump_machine/shared/bot_nav.dart';
import 'package:trump_machine/widgets/top_bar.dart';

class DumbestEverScreen extends StatefulWidget {
  @override
  _DumbestEverScreenState createState() => _DumbestEverScreenState();
}

class _DumbestEverScreenState extends State<DumbestEverScreen> {
  @override
  void initState() {
    //GET FAVE LIST
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var service = Provider.of<Services>(context);
    return Scaffold(
      appBar: TopBar(
        title: 'Dumbest Quotes Ever',
      ),
      bottomNavigationBar: BotNav(),
      body: service.faveList.length > 0
          ? ListView.builder(
              itemCount: service.faveList.length,
              itemBuilder: (BuildContext context, int index) {
                if (service.faveList != null) {
                  return Dismissible(
                    background: Container(
                      color: Colors.red,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Delete Quote',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headline
                                .copyWith(color: Colors.white),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            FontAwesomeIcons.trash,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    key: Key(service.faveList[index]),
                    direction: DismissDirection.horizontal,
                    onDismissed: (direction) {
                      service.faveList.remove(service.faveList[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListTile(
                          title: Text(service.faveList[index]),
                          leading: Icon(
                            FontAwesomeIcons.poo,
                            color: Colors.brown,
                          )),
                    ),
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
