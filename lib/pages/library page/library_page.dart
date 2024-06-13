import 'package:apple_music/pages/library%20page/components/library_cupertino_list.dart';
import 'package:apple_music/pages/library%20page/components/library_sliver_navigation_bar.dart';
import 'package:flutter/cupertino.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  double _scrollOffset = 0.0;

  @override
  Widget build(BuildContext context) {
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
            LibrarySliverNavigationBar(scrollOffset: _scrollOffset),

            // Library List
            SliverPadding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context)
                      .padding
                      .bottom), // Add padding at the bottom
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return const LibraryCupertinoList();
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
