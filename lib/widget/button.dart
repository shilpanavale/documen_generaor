import 'package:flutter/material.dart';

import '../utils/text_styles.dart';


class CommonButton extends StatelessWidget {
 final VoidCallback onPressed;
  final String label;
  final double width;
  final Color bg;



  const CommonButton(
      {Key? key,
      required this.onPressed,
      required this.label,
      required this.width,
      required this.bg,
    })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 45,
        width: width,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(99.0),
          boxShadow: [
            BoxShadow(
                color: bg.withOpacity(0.5), offset: const Offset(0, 10), blurRadius: 22.0)
          ],

        ),
        child: ElevatedButton(
         onPressed: onPressed,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(99.0),
              ),
            ),
            minimumSize: MaterialStateProperty.all(Size(width, 50)),
            backgroundColor:
            MaterialStateProperty.all(Colors.transparent),
            // elevation: MaterialStateProperty.all(3),
            shadowColor:
            MaterialStateProperty.all(Colors.transparent),
          ),

         child: Text(label,style: TextHelper.size16.copyWith(fontWeight: FontWeight.w700,color: Colors.white),),
    )
    );
  }

}

