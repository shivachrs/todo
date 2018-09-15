import 'package:flutter/material.dart';
import 'package:just_do_it/ListType.dart';
import 'package:just_do_it/item.dart';

//void main() => runApp(new MyApp());
void main() {
  runApp(MyApp(
    items: List<item>.generate(
    1000,
        (i) => i % 6 == 0
        ? HeadingItem("Heading $i")
        : MessageItem("Sender $i", "Message body $i"),
  ),
  )
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Just do it !',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Just do it!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  item items=new item(true,"milk");
  List<ListType> itemdata = null;

  @override
  void initState() {
    itemdata.add(new ListType(items,"eatable"));
  }

  // _itemData.add(new ListType(new item(true,"milk"),"eatable"));//,"eatable"));
  void _onPressed() {
    showDialog(context: context, child:
    new AlertDialog(

      title: new Text("My Super title"),
      content: new Text("Hello World"),
    )
    );
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){_onPressed();},
        tooltip: 'Increment',
        child: new Icon(Icons.add),

      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


abstract class ListItem {}

// A ListItem that contains data to display a heading
class HeadingItem implements ListItem {
  final bool isChecked;
  final String itemName;
  HeadingItem(this.isChecked,this.itemName);
}


// A ListItem that contains data to display a message
//class MessageItem implements ListItem {
//  final String sender;
//  final String body;
//
//  MessageItem(this.sender, this.body);
//}