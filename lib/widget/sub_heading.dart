import 'package:flutter/material.dart';

import '../common/constant.dart';

class SubHeading extends StatelessWidget {
  String title;
  Function() onTap;
  SubHeading({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kSection,
        ),
        InkWell(
          onTap: onTap,
          child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'See More',
                style: TextStyle(color: kBrightGreen),
              )),
        ),
      ],
    );
  }
  }
