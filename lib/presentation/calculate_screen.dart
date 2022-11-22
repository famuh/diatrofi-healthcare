import 'package:diatfori/widget/food_item_widget.dart';
import 'package:diatfori/widget/sub_heading.dart';
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
          title: const Text('Calculate Your Intake'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
        ),
        body: Container(
          width: mediaQuery.width,
          height: mediaQuery.height,
          child: Stack(
            children: [
              // 1
              Container(
                width: mediaQuery.width,
                height: mediaQuery.height / 1.3,
                // color: Colors.blueGrey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 15,
                  ),
                  child: ListView(
                    children: [
                      SubHeading(
                          title: 'foods',
                          onTap: (() => print('ke halaman more'))),
                      Container(
                        height: 160,
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              width: 300,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              color: Colors.green,
                            ),
                            Container(
                              width: 300,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              color: Colors.green,
                            ),
                            Container(
                              width: 300,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ),
                     
                      SubHeading(
                          title: 'foods',
                          onTap: (() => print('ke halaman more'))),
                      Container(
                        height: 160,
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              width: 300,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              color: Colors.green,
                            ),
                            Container(
                              width: 300,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              color: Colors.green,
                            ),
                            Container(
                              width: 300,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ),
                     
                      SubHeading(
                          title: 'foods',
                          onTap: (() => print('ke halaman more'))),
                      Container(
                        height: 160,
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              width: 300,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              color: Colors.green,
                            ),
                            Container(
                              width: 300,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              color: Colors.green,
                            ),
                            Container(
                              width: 300,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ),
                     
                    ],
                  ),
                ),
              ),

              // 2
              Positioned(
                bottom: 0,
                child: Container(
                  width: mediaQuery.width,
                  height: mediaQuery.height / 7,
                  color: Colors.amber,
                ),
              )
            ],
          ),
        ));
  }
}
