import 'package:flutter/cupertino.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: Center(
      child: CupertinoButton(
        onPressed: (){},
        child: const Icon(CupertinoIcons.music_note_2),
      ),
    ));
  }
}
