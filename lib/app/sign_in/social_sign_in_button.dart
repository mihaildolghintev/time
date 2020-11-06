import 'package:flutter/cupertino.dart';
import 'package:time/common_widgets/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    @required String assetName,
    @required String text,
    @required Color color,
    @required Color textColor,
    @required VoidCallback onPressed,
  })  : assert(text != null),
        super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(assetName),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(width: 20.0),
            ],
          ),
          color: color,
          onPressed: onPressed,
        );
}
