import 'package:flutter/material.dart';

class CalculateScreen extends StatefulWidget {
  static const ROUTE_NAME = '/cal';
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('calculate your intake'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_rounded)),
      ),
      body: 
      Container(
        width: mediaQuery.width,
        height: mediaQuery.height,
        color: Colors.black,
        child: Stack(
          children: [
            // 1
            Container(
              width: mediaQuery.width,
              height: mediaQuery.height/1.3,
              color: Colors.blueGrey,
            ),

            // 2
            Positioned(
              bottom: 0,
              child: Container(
                width: mediaQuery.width,
                height: mediaQuery.height/7,
                color: Colors.amber,
              ),
            )
          ],
        ),
      )
    );
  }
}
