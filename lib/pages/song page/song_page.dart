import 'package:apple_music/pages/album%20detail%20page/components/play_shuffle_button_row.dart';
import 'package:apple_music/pages/song%20page/components/custom_app_bar.dart';
import 'package:apple_music/pages/song%20page/components/search_box.dart';
import 'package:apple_music/utils/lists/song_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/song_provider.dart';
import '../../utils/constant.dart';

double scrollOffset = 0.0;

class SongPage extends StatefulWidget {
  const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
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
            scrollOffset = scrollNotification.metrics.pixels;
          });
          return true;
        },
        child: CustomScrollView(
          slivers: [
            // Sliver Navigation bar
            const CustomAppBar(),

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
                        //play and shuffle playlist button
                        PlayShuffleButtonRow(
                            providerFalse: providerFalse,
                            songList: songList['ABCD 2']),

                        // Songs list
                        CupertinoListSection(
                            margin: EdgeInsets.zero,
                            decoration: const BoxDecoration(),
                            topMargin: 10,
                            dividerMargin: 0,
                            backgroundColor: Colors.transparent,
                            children: [
                              ...List.generate(
                                  20,
                                  (index) => CupertinoListTile(
                                        leading: Container(
                                          decoration: BoxDecoration(
                                            color: CupertinoColors.systemGrey,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                      'assets/album images/ABCD 2.png')
                                                  as ImageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        title: Text('A Thosusand Years'),
                                        subtitle: Text('Album - ABCD 2'),
                                        trailing: Row(
                                          children: [
                                            SizedBox(
                                              height: height * 0.016,
                                              width: height * 0.016,
                                              child: CupertinoButton(
                                                padding: EdgeInsets.zero,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: CupertinoColors
                                                    .systemGrey
                                                    .withOpacity(0.2),
                                                child: Icon(
                                                  CupertinoIcons.down_arrow,
                                                  size: height * 0.010,
                                                  color: CupertinoColors
                                                      .systemGrey,
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                            CupertinoButton(
                                              padding: EdgeInsets.zero,
                                              child: Icon(
                                                Icons.more_horiz_rounded,
                                                size: height * 0.019,
                                                color:
                                                    CupertinoColors.systemGrey,
                                              ),
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                        leadingSize: height * 0.048,
                                      )),
                            ]),
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
