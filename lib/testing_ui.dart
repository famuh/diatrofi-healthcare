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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Auth Screen', style: kAuthScreen,),
            Text('Title Screen', style: kTitleScreen,),
            Text('article *', style: kSection,),
            Text('Body Text lorem ipsum', style: kBodyText,),
            const Divider(color: Colors.transparent,),
            Text('Item title Card', style: kItemTittleCard,),
            Text('Item body', style: kBodyText,),
      
            Container(
              width: 200,
              height: 100,
              color: kStrongGreen,
              child: const Center(
                child: Text(
                  'Strong Green'
                ),
              ),
            ),
            Container(
              width: 200,
              height: 100,
              color: kBrightGreen,
              child: const Center(
                child: Text(
                  'Bright Green'
                ),
              ),
            ),
            Container(
              width: 200,
              height: 100,
              color: kSoftGreen,
              child: const Center(
                child: Text(
                  'Soft Green'
                ),
              ),
            ),
            Container(
              width: 200,
              height: 100,
              color: kMatteBlack,
              child: const Center(
                child: Text(
                  'Matte Black'
                ),
              ),
            ),
            Container(
              width: 200,
              height: 100,
              color: kSoftGrey,
              child: const Center(
                child: Text(
                  'Soft Grey'
                ),
              ),
            ),
            Container(
              width: 200,
              height: 100,
              color: kStrongRed,
              child: const Center(
                child: Text(
                  'Strong Red'
                ),
              ),
            ),
            Container(
              width: 200,
              height: 100,
              color: kPink,
              child: const Center(
                child: Text(
                  'Pink'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}