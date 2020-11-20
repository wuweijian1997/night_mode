import 'package:flutter/material.dart';
import 'page_model.dart';
import 'night_mode_page.dart';
import 'shallow_night_mode_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PageModel> list = [
    PageModel(
      name: 'Night Mode',
      page: NightModePage()
    ),
   PageModel(
      name: 'Shallow Night',
      page: ShallowNightModePage()
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildList(),
        ),
      ),
    );
  }

  List<Widget> buildList() {
    List<Widget> widgets = [];
    list.forEach((element) {
      widgets.add(GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return element.page;
        }));
      },
        child: Card(
          elevation: 5,
          shadowColor: Colors.pink,
          color: Colors.blue,
          margin: EdgeInsets.all(5),
          child: SizedBox(
            height: 100,
            child: Center(
              child: Text(
                element.name,
                style: TextStyle(fontSize: 36, color: Colors.white),
              ),
            ),
          ),
        ),
      ));
    });
    return widgets;
  }
}
