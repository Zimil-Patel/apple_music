import 'package:apple_music/pages/song%20page/components/custom_app_bar.dart';
import 'package:apple_music/pages/song%20page/components/search_box.dart';
import 'package:flutter/cupertino.dart';

double scrollOffset = 0.0;

class SongPage extends StatefulWidget {
  const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
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
            // SliverNavigationbar
            const CustomAppBar(),

            // CupertinoSearchTextField
            const SearchBox(),

            // Songs lists
            SliverPadding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context)
                      .padding
                      .bottom), // Add padding at the bottom
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return const CupertinoListTile(
                      title: Text(
                        'PlayLists',
                      ),
                    );
                  },
                  childCount: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}