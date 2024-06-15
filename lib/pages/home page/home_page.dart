import 'package:apple_music/pages/library%20page/components/library_cupertino_list.dart';
import 'package:apple_music/pages/library%20page/components/library_sliver_navigation_bar.dart';
import 'package:apple_music/providers/song_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _scrollOffset = 0.0;

  @override
  Widget build(BuildContext context) {

    SongProvider songProviderTrue = Provider.of<SongProvider>(context, listen: true);
    SongProvider songProviderFalse = Provider.of<SongProvider>(context, listen: false);

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
            LibrarySliverNavigationBar(scrollOffset: _scrollOffset, title: 'Home',),

            // Library List
            SliverPadding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context)
                      .padding
                      .bottom), // Add padding at the bottom
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return AspectRatio(aspectRatio: 0.8,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/subscription.png'),
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: CupertinoTheme.of(context).scaffoldBackgroundColor,
                      ),
                    ),);
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
