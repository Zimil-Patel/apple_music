import 'package:flutter/cupertino.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(
      previousPageTitle: 'Library',
      largeTitle: const Text('Songs'),
      border: null,
      backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
    );
  }
}
