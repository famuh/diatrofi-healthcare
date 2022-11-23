import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../common/constant.dart';

class KcalWidget extends StatelessWidget {
  double kcal;
  KcalWidget({super.key, required this.kcal});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const FaIcon(
          FontAwesomeIcons.fire,
          color: Colors.deepOrange,
          size: 20,
        ),
        const SizedBox(width: 5),
        Text(
          '$kcal kcal',
          style: kBodyText.copyWith(
              fontWeight: FontWeight.w600, color: kMatteBlack),
        )
      ],
    );
  }
}