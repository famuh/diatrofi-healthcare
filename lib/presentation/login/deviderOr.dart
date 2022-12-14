import 'package:diatfori/common/constant.dart';
import 'package:flutter/material.dart';

class DeviderOr extends StatelessWidget {
  const DeviderOr({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          const Expanded(
            child: Divider(
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "atau",
              style: Theme.of(context).textTheme.button?.copyWith(
                  color: kMatteBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            ),
          ),
          const Expanded(
            child: Divider(
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}