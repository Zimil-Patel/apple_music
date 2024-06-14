import 'package:apple_music/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class BottomStuffs extends StatelessWidget {
  const BottomStuffs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          CupertinoIcons.quote_bubble,
          color:
          CupertinoColors.white.withOpacity(0.4),
        ),
        Icon(
          Icons.airplay_rounded,
          color:
          CupertinoColors.white.withOpacity(0.4),
        ),
        SizedBox(
          height: height * 0.05,
          width: height * 0.05,
          child: Stack(children: [
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                CupertinoIcons.shuffle,
                size: height * 0.016,
                color: CupertinoColors.white
                    .withOpacity(0.4),
              ),
            ),
            Center(
              child: Icon(
                CupertinoIcons.list_bullet,
                color: CupertinoColors.white
                    .withOpacity(0.4),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}