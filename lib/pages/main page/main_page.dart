import 'package:apple_music/providers/main_provider.dart';
import 'package:apple_music/providers/song_provider.dart';
import 'package:apple_music/utils/constant.dart';
import 'package:apple_music/utils/lists/bottom_tab_bar_itmes.dart';
import 'package:apple_music/utils/lists/tab_bar_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'components/audio_player_indicator.dart'; // Import the AudioPlayerIndicator

class MainPage extends StatelessWidget {

  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    MainProvider mainProviderTrue = Provider.of<MainProvider>(context, listen: true);
    MainProvider mainProviderFalse = Provider.of<MainProvider>(context, listen: false);

    return CupertinoPageScaffold(
      child: Stack(
        children: [
          CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              currentIndex: mainProviderTrue.tabIndex,
              onTap: (value) => mainProviderFalse.setTabIndex = value,
              items: const <BottomNavigationBarItem>[
                ...bottomTabBarItems,
              ],
              height: height / 14,
            ),
            tabBuilder: (context, index) {
              return HeroControllerScope(
                controller: HeroController(),
                child: CupertinoTabView(
                  builder: (context) => tabScreenList[mainProviderTrue.tabIndex],
                ),
              );
            },
          ),
          Visibility(
            visible: Provider.of<SongProvider>(context).isSongIndicatorVisible,
            child: Positioned(
              bottom: height / 14, // Position it above the tab bar
              left: 0,
              right: 0,
              child: AudioPlayerIndicator(navigationContext: context,), // The audio player indicator widget
            ),
          ),
        ],
      ),
    );
  }
}
