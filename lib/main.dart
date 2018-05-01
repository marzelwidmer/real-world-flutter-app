import 'package:flutter/material.dart';

void main() => runApp(new RealWorldApp());

class RealWorldApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RealWoldState();
  }
}

class RealWoldState extends State<RealWorldApp> {
  var _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Real World App Bar"),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.refresh),
                onPressed: () {
                  print("Reloading....");
                  setState(() {
                    _isLoading = false;              
                  });
                }),
          ],
        ),
        body: new Center(
          //child: new CircularProgressIndicator(),
          child: _isLoading ? new CircularProgressIndicator() : new Text("Finished Loading..."),
        ),
      ),
    );
  }
}
