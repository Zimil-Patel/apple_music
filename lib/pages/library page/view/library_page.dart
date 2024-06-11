import 'package:flutter/cupertino.dart';
import 'package:apple_music/pages/song%20page/song_page.dart';
import 'package:flutter/material.dart';

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
            CupertinoSliverNavigationBar(
              border: _scrollOffset > 50
                  ? Border(
                      bottom: BorderSide(
                      color: CupertinoColors.systemGrey.withOpacity(0.2),
                    ))
                  : null,
              middle: const Text('Library'),
              alwaysShowMiddle: false,
              trailing: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: const Text('Edit'),
              ),
              largeTitle: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Library'),
                  Spacer(),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/bmw_eye.jpeg'),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 10),
                ],
              ),
              backgroundColor: _scrollOffset > 0
                  ? null // Use the default color when scrolled
                  : CupertinoTheme.of(context)
                      .scaffoldBackgroundColor, // Use white color when not scrolled
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
                      title: CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => const SongPage(),
                                ));
                          },
                          child: Text('Song $index')),
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
