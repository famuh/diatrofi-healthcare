import 'package:diatfori/common/constant.dart';
import 'package:diatfori/presentation/login/login.dart';
import 'package:diatfori/presentation/login/register.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: kSoftGrey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.09),
            Text(
              'Welcome',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: kMatteBlack, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset(
              'assets/images/bg.png',
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.09),
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna . . .',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: size.height * 0.04),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.8,
              height: size.height * 0.07,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginPage();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: kStrongGreen,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                  ),
                  child: Text(
                    'Masuk',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.8,
              height: size.height * 0.07,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const RegisterPage();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: kMatteBlack,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                  ),
                  child: Text('Daftar',
                      style: Theme.of(context)
                          .textTheme
                          .button
                          ?.copyWith(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
