import 'package:apple_music/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CupertinoNavigationBar albumDetailNavigationBar(BuildContext context) {
  return CupertinoNavigationBar(
    automaticallyImplyLeading: true,
    leading: CupertinoButton(
      padding: EdgeInsets.zero,
      child: const Icon(CupertinoIcons.back),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    trailing: SizedBox(
      height: height * 0.030,
      width: height * 0.030,
      child: CupertinoButton(
        color: CupertinoColors.systemGrey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(100),
        onPressed: () {},
        padding: EdgeInsets.zero,
        child: Icon(
          Icons.more_horiz,
          size: height * 0.020,
          color: CupertinoTheme.of(context).primaryColor,
        ),
      ),
    ),
  );
}
