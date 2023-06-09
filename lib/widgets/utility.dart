import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Utility {

  static void showToast({String? message}) {
    Fluttertoast.showToast(
        msg: message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0
    );
  }

  static Widget getButton(
      BuildContext context, String text, Function onClicked,
      {width,
        height,
        double leftPadding = 12.0,
        Widget? Image,
        double radius = 10.0,
        double? fontSize,
        double rightPadding = 12.0,
        double bottomPadding = 15.0,
        Color? borderColor}) {
    return Padding(
      padding: EdgeInsets.only(
          left: leftPadding, right: rightPadding, bottom: bottomPadding),
      child: Container(
        height: height ?? 57,
        width: width ?? Get.width / 1.5,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            alignment: Alignment.center,
            elevation: 0,
            backgroundColor: Color(0xff0432A3),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: BorderSide(
                  color: Color(0xff0432A3),
                )),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          ),
          onPressed: () {
            onClicked();
          },
          child: Text(text,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                  fontSize: fontSize ?? 18,
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}