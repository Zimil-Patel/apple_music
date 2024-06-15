import 'package:apple_music/pages/library%20page/components/library_cupertino_list.dart';
import 'package:apple_music/pages/library%20page/components/library_sliver_navigation_bar.dart';
import 'package:apple_music/providers/song_provider.dart';
import 'package:apple_music/utils/constant.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  double _scrollOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    SongProvider songProviderTrue =
        Provider.of<SongProvider>(context, listen: true);
    SongProvider songProviderFalse =
        Provider.of<SongProvider>(context, listen: false);

    return CupertinoPageScaffold(
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollNotification) {
          setState(() {
            _scrollOffset = scrollNotification.metrics.pixels;
          });
          return true;
        },
        child: CustomScrollView(
          slivers: [
            // Sliver Navigation bar
            LibrarySliverNavigationBar(
              scrollOffset: _scrollOffset,
              title: 'Radio',
            ),

            // Library List
            SliverPadding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context)
                      .padding
                      .bottom), // Add padding at the bottom
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      height: height * 0.3,
                      width: width,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              songProviderTrue.radioModelList[index].thumbnail),
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color:
                            CupertinoTheme.of(context).scaffoldBackgroundColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BlurryContainer(
                            height: height * 0.1,
                            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                            color: CupertinoColors.systemFill.withOpacity(0.8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        songProviderTrue
                                            .radioModelList[index].time,
                                        style: TextStyle(
                                          color: CupertinoTheme.of(context)
                                              .barBackgroundColor
                                              .withOpacity(0.8),
                                        ),
                                      ),
                                      Text(
                                        songProviderTrue
                                            .radioModelList[index].title,
                                        style: const TextStyle(
                                          color: CupertinoColors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),

                                      Text(
                                        songProviderTrue
                                            .radioModelList[index].description,
                                        style: TextStyle(
                                          color: CupertinoTheme.of(context)
                                              .barBackgroundColor
                                              .withOpacity(0.8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: CircleAvatar(
                                    backgroundColor: CupertinoColors.systemGrey
                                        .withOpacity(1),
                                    child: Icon(
                                      CupertinoIcons.play_arrow_solid,
                                      size: height * 0.02,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: songProviderTrue.radioModelList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
