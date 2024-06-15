import 'package:apple_music/pages/song%20page/song_page.dart';
import 'package:apple_music/utils/constant.dart';
import 'package:flutter/cupertino.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SearchBarDelegate(),
    );
  }
}

class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      height: 38,
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
  double get maxExtent => 38.0; // Adjust this as needed

  @override
  double get minExtent => 38.0; // Adjust this as needed

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
