import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new RealWorldApp());

class RealWorldApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RealWoldState();
  }
}

class RealWoldState extends State<RealWorldApp> {
  var _isLoading = true;

  _fetchData() async {
    print("Attempting to fetch data from network.");
    final url = "https://api.letsbuildthatapp.com/youtube/home_feed";
    final response = await http.get(url);

    if(response.statusCode == 200){
      print(response.body);
    }
  }

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

                 _fetchData();

                }),
          ],
        ),
        body: new Center(
          //child: new CircularProgressIndicator(),
          child: _isLoading ? new CircularProgressIndicator() : 
            new Text("Finished Loading..."),
        ),
      ),
    );
  }
}
