import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// COLOR
const Color kPink = Color(0xFFEF6D6D);
const Color kStrongRed = Color(0xFFEF1D1D);

const Color kMatteBlack = Color(0xFF252525);
const Color kSoftGrey = Color(0xFFEFEFEF);

const Color kSoftGreen = Color.fromARGB(255, 192, 236, 171);
const Color kBrightGreen = Color(0xFF449C1B);
const Color kStrongGreen = Color(0xFF348756);
const Color kLineGreen = Color(0xFF00FF74);

const Color kFats = Color.fromARGB(255, 212, 132, 3);
const Color kCarbs = Color.fromARGB(255, 239, 108, 0);

//Login
class ThemeHelper{

  InputDecoration textInputDecoration([String hintText = ""]){
    return InputDecoration(
      icon: Icon(
                      Icons.person,
                      color: kMatteBlack,
                    ),
      hintText: hintText,
      fillColor: kSoftGreen,
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide(color: kSoftGreen)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide(color: kSoftGreen)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide(color: kSoftGreen)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(7), borderSide: BorderSide(color: kSoftGreen)),
    );
  }

  BoxDecoration inputBoxDecorationShaddow() {
    return BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
        
      )
    ]);
  }
  

  ButtonStyle buttonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      minimumSize: MaterialStateProperty.all(Size(50, 50)),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
    );
  }

  AlertDialog alartDialog(String title, String content, BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black38)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

}

class LoginFormStyle{

}

// text style
final TextStyle kAuthScreen = GoogleFonts.poppins(
  fontSize: 24,
  fontWeight: FontWeight.bold
);


final TextStyle kTitleScreen = 
GoogleFonts.poppins(
  fontSize: 22,
  fontWeight: FontWeight.w500
);

final TextStyle kSection = 
GoogleFonts.poppins(
  fontSize: 20,
  fontWeight: FontWeight.w500 // medium
);

final TextStyle kBodyText = 
GoogleFonts.poppins(
  fontSize: 12,
  color: Colors.black54
  // fontWeight: FontWeight.w400 // regular
);

final TextStyle kItemTittleCard = 
GoogleFonts.poppins(
  fontSize: 16,
  fontWeight: FontWeight.w600 //semibold
);

// logo
final TextStyle kDiatrofi = 
GoogleFonts.notoSerif(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.bold
);

// color scheme
const kColorScheme = ColorScheme(
  primary: kStrongGreen,
  primaryContainer: kStrongGreen,
  secondary: kSoftGreen,
  secondaryContainer: kSoftGreen,
  surface: kMatteBlack,
  background: kMatteBlack,
  error: Colors.red,
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.white,
  brightness: Brightness.light,
);
enum ResultState { loading, error, noData, hasData }