import 'package:diatfori/common/constant.dart';
import 'package:flutter/material.dart';

class TestingUI extends StatelessWidget {
  const TestingUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testing UI'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Text('Auth Screen', style: kAuthScreen,),
          Text('Title Screen', style: kTitleScreen,),
          Text('article *', style: kSection,),
          Text('Body Text lorem ipsum', style: kBodyText,),
          const Divider(color: Colors.transparent,),
          Text('Item title Card', style: kItemTittleCard,),
          Text('Item body', style: kBodyText,),
        ],
      ),
    );
  }
}