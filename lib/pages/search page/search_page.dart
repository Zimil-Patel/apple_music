import 'package:apple_music/pages/album%20detail%20page/components/play_shuffle_button_row.dart';
import 'package:apple_music/pages/library%20page/components/library_sliver_navigation_bar.dart';
import 'package:apple_music/pages/song%20page/components/custom_app_bar.dart';
import 'package:apple_music/pages/song%20page/components/search_box.dart';
import 'package:apple_music/utils/lists/music_categories.dart';
import 'package:apple_music/utils/lists/song_list.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/song_provider.dart';
import '../../utils/constant.dart';

double scrollOffsetOfSearchPage = 0.0;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    SongProvider providerTrue =
        Provider.of<SongProvider>(context, listen: true);
    SongProvider providerFalse =
        Provider.of<SongProvider>(context, listen: false);

    return CupertinoPageScaffold(
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollNotification) {
          setState(() {
            scrollOffsetOfSearchPage = scrollNotification.metrics.pixels;
          });
          return true;
        },
        child: CustomScrollView(
          slivers: [
            // Sliver Navigation bar
            LibrarySliverNavigationBar(
                scrollOffset: scrollOffsetOfSearchPage, title: 'Search'),

            // CupertinoSearchTextField
            const SearchBox(),

            // Songs lists
            SliverPadding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom +
                      58), // Add padding at the bottom
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Column(
                      children: [
                        GridView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          itemCount: musicCategories.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  childAspectRatio: 2
                                ),
                            itemBuilder: (context, index) {
                              return Container(
                                height: height * 0.6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    opacity: 0.5,
                                    image: NetworkImage(musicCategories[index]['img'])
                                  ),
                                  color: CupertinoTheme.of(context).scaffoldBackgroundColor,
                                ),
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(musicCategories[index]['type'], style: TextStyle(fontWeight: FontWeight.w600),),
                                ),
                              );
                            },)
                      ],
                    );
                  },
                  childCount: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
