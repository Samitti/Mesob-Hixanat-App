import 'package:flutter/material.dart';

class TileCard extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color textColor;
  final Color backgroundColor;
  final double fontSizeBase;
  final double fontSizeActive;
  final VoidCallback onTap;

  const TileCard({
    Key? key,
    this.isActive = false,
    required this.title,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.white,
    this.fontSizeBase = 130,
    this.fontSizeActive = 180,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            color: Colors.grey,
          ),
        ],
      ),
      // child: Material(
      //   clipBehavior: Clip.hardEdge,
      //   borderRadius: BorderRadius.circular(15.0),
      //   type: MaterialType.transparency,
      //   child: InkWell(
      //     onTap: onTap,
      //     child: Container(
      //       alignment: Alignment.center,
      //       child: AnimatedDefaultTextStyle(
      //         style: isActive
      //             ? TextStyle(fontSize: fontSizeActive)
      //             : TextStyle(fontSize: fontSizeBase),
      //         duration: const Duration(milliseconds: 400),
      //         curve: Curves.bounceOut,
      //         child: Text(
      //           title,
      //           style: TextStyle(
      //             color: textColor,
      //             fontWeight: FontWeight.w700,
      //           ),
      //           softWrap: false,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
