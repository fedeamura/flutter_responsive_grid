import 'package:flutter/material.dart';
import 'package:flutter_responsive_grid/flutter_responsive_grid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Example(),
    );
  }
}

class Example extends StatefulWidget {
  Example({Key key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Responsive Grid Example"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            ResponsiveGrid(
              spacing: 16,
              runSpacing: 16,
              children: [
                ResponsiveGridItem(
                  lg: 12,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.blue,
                    child: Center(child: Text("LG 12")),
                  ),
                ),
                ResponsiveGridItem(
                  xs: 6,
                  sm: 3,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.orange,
                    child: Center(child: Text("XS 6\nSM 3")),
                  ),
                ),
                ResponsiveGridItem(
                  xs: 6,
                  sm: 3,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.green,
                    child: Center(child: Text("XS 6\nSM 3")),
                  ),
                ),
                ResponsiveGridItem(
                  xs: 6,
                  sm: 2,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.purple,
                    child: Center(child: Text("XS 6\nSM 2")),
                  ),
                ),
                ResponsiveGridItem(
                  xs: 6,
                  sm: 2,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.yellow,
                    child: Center(child: Text("XS 6\nSM 2")),
                  ),
                ),
                ResponsiveGridItem(
                  xs: 6,
                  sm: 2,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.grey,
                    child: Center(child: Text("XS 6\nSM 2")),
                  ),
                ),
                ResponsiveGridItem(
                  xs: 6,
                  sm: 2,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.red,
                    child: Center(child: Text("XS 6\nSM 2")),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}