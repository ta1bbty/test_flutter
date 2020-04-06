import 'package:flutter/material.dart';

void main() {
  List<String> notes = [
    "fluttermaster.com",
    "Update Android Studio to 3.3",
    "Something long Something long Something long Something long Something long Something long",
  ];

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Simple Note ListView"),
      ),
      body: Container(
          color: Colors.white10,
          padding: EdgeInsets.all(16.0),
          child: HomePage(notes)),
    ),
  ));
}

class HomePage extends StatelessWidget {
  final List<String> notes;

  HomePage(this.notes);
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, pos) {
        return Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Card(
              elevation: 2.0,
              child: Row(
                // key: _cardKey,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(
                      // -------------------- This here ----------------------------------------------
                      // FixMe : This shouldn't be hardcoded, rather it should fill the height of it's parent element, in this case card
                      // https://medium.com/@diegoveloper/flutter-widget-size-and-position-b0a9ffed9407
                      height: 71,
                      color: Colors.green,
                      // -------------------- This here ----------------------------------------------
                    ),
                  ),
                  Flexible(
                    flex: 100,
                    child: ListTile(
                      // For center alignment from vertical and horizontal : https://stackoverflow.com/a/51546279
                      // Since using CircleAvatar does this but it decreases size of icon too : https://github.com/flutter/flutter/issues/16061
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.receipt),
                        ],
                      ),
                      title: Text(
                        notes[pos],
                      ),
                      subtitle: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(notes[pos].substring(0, 10)),
                          // What is the best way to optionally include a widget in a list of children
                          // https://github.com/flutter/flutter/issues/3783#issuecomment-506019822
                          if ((pos % 2) == 0)
                            Chip(
                              avatar: CircleAvatar(
                                backgroundColor: Colors.grey.shade800,
                                child: Icon(Icons.timer),
                              ),
                              label: Text('2FA'),
                            ),
                        ],
                      ),
                      trailing: Padding(
                        padding: EdgeInsets.all(10),
                        child: Wrap(
                            spacing: 10,
                            direction: Axis.vertical,
                            alignment: WrapAlignment.spaceEvenly,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.check,
                                  color: Colors.grey,
                                ),
                                onPressed: () {},
                              )
                            ]),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
