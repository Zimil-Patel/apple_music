import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LibrarySliverNavigationBar extends StatelessWidget {
  const LibrarySliverNavigationBar({
    super.key,
    required double scrollOffset, required this.title,
  }) : _scrollOffset = scrollOffset;

  final double _scrollOffset;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(

      middle: Text(title),
      alwaysShowMiddle: false,
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        child: const Text('Edit'),
      ),
      largeTitle: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(title),
          const Spacer(),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/bmw_eye.jpeg'),
            backgroundColor: Colors.white,
          ),
          const SizedBox(width: 10),
        ],
      ),
      border: null,
      backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor, // Use white color when not scrolled
    );
  }
}
