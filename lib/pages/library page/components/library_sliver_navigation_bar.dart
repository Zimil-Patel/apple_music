import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LibrarySliverNavigationBar extends StatelessWidget {
  const LibrarySliverNavigationBar({
    super.key,
    required double scrollOffset,
  }) : _scrollOffset = scrollOffset;

  final double _scrollOffset;

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(
      border: _scrollOffset > 50
          ? Border(
              bottom: BorderSide(
              color: CupertinoColors.systemGrey.withOpacity(0.2),
            ))
          : null,
      middle: const Text('Library'),
      alwaysShowMiddle: false,
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        child: const Text('Edit'),
      ),
      largeTitle: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Library'),
          Spacer(),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/bmw_eye.jpeg'),
            backgroundColor: Colors.white,
          ),
          SizedBox(width: 10),
        ],
      ),
      backgroundColor: _scrollOffset > 50
          ? null // Use the default color when scrolled
          : CupertinoTheme.of(context)
              .scaffoldBackgroundColor, // Use white color when not scrolled
    );
  }
}
