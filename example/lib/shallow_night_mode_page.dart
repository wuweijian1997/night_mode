import 'package:flutter/material.dart';
import 'package:night_mode/night_mode.dart';

class ShallowNightModePage extends StatefulWidget {
  @override
  _ShallowNightModePageState createState() => _ShallowNightModePageState();
}

class _ShallowNightModePageState extends State<ShallowNightModePage> {
  bool alwaysOn = true;
  double radius = 100;
  LightDelegate delegate;

  @override
  void initState() {
    super.initState();
    delegate = DefaultLightDelegate(radius: radius);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NightMode(
            delegate: delegate,
            alwaysOn: alwaysOn,
            nightGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black54, Colors.black],
            ),
            child: Stack(
              children: [
                Image.asset(
                  './assets/rem.jpg',
                  fit: BoxFit.fitHeight,
                  height: double.infinity,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            right: 50,
            child: Column(
              children: [
                buildIcon(Icons.looks_one_outlined, 100),
                buildIcon(Icons.looks_two_outlined, 150),
                buildIcon(Icons.looks_3_outlined, 200),
                buildSwitch(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildIcon(IconData icons, double value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          radius = value;
          delegate = DefaultLightDelegate(radius: radius);
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipOval(
          child: Container(
            width: 50,
            height: 50,
            color: Colors.pink,
            alignment: Alignment.center,
            child: Text(
              '$value',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  buildSwitch() {
    return GestureDetector(
      onTap: () {
        setState(() {
          alwaysOn = !alwaysOn;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipOval(
          child: Container(
            width: 50,
            height: 50,
            color: Colors.pink,
            child: Icon(
              alwaysOn == true ? Icons.check : Icons.close,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
