import 'package:diatfori/common/constant.dart';
import 'package:diatfori/data/authentic/service.dart';
import 'package:diatfori/presentation/login/login.dart';
import 'package:diatfori/presentation/mainpage.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(text: "");
    TextEditingController passwordController = TextEditingController(text: "");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kSoftGrey,
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.05),
              Text(
                'DAFTAR',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: kMatteBlack,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              Image.asset(
                 'assets/images/bg.png',
                height: size.height * 0.35,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: kSoftGreen,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: TextField(
                  controller: emailController,
                  cursorColor: kSoftGreen,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.mail,
                      color: kSoftGreen,
                    ),
                    hintText: "Email",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: kSoftGreen,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  cursorColor: kSoftGreen,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: kSoftGreen,
                    ),
                    hintText: "Password",
                    border: InputBorder.none,
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
                    onPressed: () async {
                      final result = await AuthServices.signUp(
                          emailController.text, passwordController.text
                      );
                      if (result != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Akun anda telah terdaftar, silahkan masuk kembali.'),
                              duration: Duration(milliseconds: 4000),
                            )
                        );
                      } else if (emailController.text == ""
                          || passwordController.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Email/Password tidak boleh kosong.'),
                              duration: Duration(milliseconds: 4000),
                            )
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Format email salah, silahkan coba kembali.'),
                              duration: Duration(milliseconds: 4000),
                            )
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: kSoftGreen,
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
              SizedBox(height: size.height * 0.001),
              SizedBox(
                width: size.width * 0.75,
                height: size.height * 0.06,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: OutlinedButton(
                    onPressed: () async {
                      final result = await AuthServices.signUpWithGoogle();
                      if (result != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                           'assets/images/bg.png',
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 5),
                        Text('Sign Up dengan Akun Google',
                            style: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(color: Colors.black, fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Sudah punya Akun ? ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const LoginPage();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Masuk",
                      style: Theme.of(context).textTheme.button?.copyWith(
                          color: kStrongGreen ,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}