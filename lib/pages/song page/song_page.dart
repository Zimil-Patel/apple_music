import 'package:apple_music/utils/constant.dart';
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
            CupertinoSliverNavigationBar(
              previousPageTitle: 'Library',
              largeTitle: Text('Songs'),
              border: null,
              backgroundColor:
                  CupertinoTheme.of(context).scaffoldBackgroundColor,
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SearchBarDelegate(),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context)
                      .padding
                      .bottom), // Add padding at the bottom
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return CupertinoListTile(
                      title: Text('Song $index'),
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

class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      height: 43,
      width: width,
      decoration: BoxDecoration(
        color: CupertinoTheme.of(context).scaffoldBackgroundColor,
        border: Border(
          bottom: BorderSide(
            color: CupertinoColors.systemGrey
                .withOpacity(scrollOffset >= 90 ? 0.1 : 0.0),
          ),
        ),
      ),
      child: const CupertinoSearchTextField(),
    );
  }

  @override
  double get maxExtent => 43.0; // Adjust this as needed

  @override
  double get minExtent => 43.0; // Adjust this as needed

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
