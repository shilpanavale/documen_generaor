import 'package:flutter/material.dart';

import '../utils/app_colors.dart';


class DialogBuilder {
  DialogBuilder(this.context);

  final BuildContext context;

  void showLoadingIndicator([String? text]) {
    showDialog(
      context: context,
      //barrierDismissible: true,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async => true,
            child: AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              backgroundColor: Colors.white,
              content: LoadingIndicator(
                  text: text!
              ),
            )
        );
      },
    );
  }

  void hideOpenDialog() {
    Navigator.of(context).pop();
  }
}

class LoadingIndicator extends StatelessWidget{
  const LoadingIndicator({super.key, this.text = ''});

  final String text;

  @override
  Widget build(BuildContext context) {


    return Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.white,
        height: 55,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _getLoadingIndicator(),
              _getHeading(context),
              //_getText(displayedText)
            ]
        )
    );
  }

  Padding _getLoadingIndicator() {
    return   Padding(
        padding: const EdgeInsets.only(bottom: 1),
        child: SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(ColorsForApp.blackColor)
            )
        )
    );
  }

  Widget _getHeading(context) {
    return const Padding(
        padding: EdgeInsets.only(bottom: 4),
        child: Text(
          'Please wait …',
          style: TextStyle(
              color: Colors.black,
              fontSize: 16
          ),
          textAlign: TextAlign.center,
        )
    );
  }


}