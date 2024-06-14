import 'package:apple_music/providers/main_provider.dart';
import 'package:apple_music/pages/main%20page/main_page.dart';
import 'package:apple_music/providers/song_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MainProvider(),),
          ChangeNotifierProvider(create: (context) => SongProvider(),),
        ],
        child: const AppleMusic()),
  );
}


class AppleMusic extends StatelessWidget {
  const AppleMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      // Theme
      theme: CupertinoThemeData(
        brightness: MediaQuery.of(context).platformBrightness,
        primaryColor: const Color(0xfffe2c53),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Apple Music',

      // MainPage()
      home: MainPage(),
    );
  }
}


