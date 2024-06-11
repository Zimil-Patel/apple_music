import 'package:apple_music/providers/main_provider.dart';
import 'package:apple_music/utils/constant.dart';
import 'package:apple_music/utils/lists/bottom_tab_bar_itmes.dart';
import 'package:apple_music/utils/lists/tab_bar_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    MainProvider mainProviderTrue =
        Provider.of<MainProvider>(context, listen: true);
    MainProvider mainProviderFalse =
        Provider.of<MainProvider>(context, listen: false);

    return CupertinoTabScaffold(
      // Bottom Tab bar items
      tabBar: CupertinoTabBar(
        // onTap index change
        onTap: (value) => mainProviderFalse.setTabIndex = value,

        // Items
        items: const <BottomNavigationBarItem>[
          ...bottomTabBarItems,
        ],

        height: height / 14,
      ),

      // Tab screen
      tabBuilder: (context, index) {
        return HeroControllerScope(
          controller: HeroController(),
          child: CupertinoTabView(
              builder: (context) => tabScreenList[mainProviderTrue.tabIndex]),
        );
      },
    );
  }
}
