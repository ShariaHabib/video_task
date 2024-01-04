import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String iconText;
  final String iconImage;

  const CustomIconButton(
      {Key? key, required this.iconText, required this.iconImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: OutlinedButton(
        onPressed: () {},
        style: ButtonStyle(
          iconColor: MaterialStateProperty.all(Colors.black),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(2),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconImage),
            Center(
              child: Text(
                iconText,
                style: TextStyle(fontSize: 11),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
