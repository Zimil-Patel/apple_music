import 'package:apple_music/pages/album%20detail%20page/album_detail_page.dart';
import 'package:apple_music/providers/song_provider.dart';
import 'package:apple_music/utils/constant.dart';
import 'package:apple_music/utils/lists/song_list.dart';
import 'package:flutter/cupertino.dart';

class LibraryGridView extends StatelessWidget {
  const LibraryGridView({
    super.key,
    required this.songProviderFalse,
    required this.songProviderTrue,
  });

  final SongProvider songProviderFalse;
  final SongProvider songProviderTrue;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      itemCount: songList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) => CupertinoButton(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => AlbumDetailPage(
                providerTrue: songProviderTrue,
                providerFalse: songProviderFalse,
                albumIndex: index,
              ),
            ),
          );
        },
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Album image box
            AspectRatio(
              aspectRatio: 1,
              child: SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/album images/${songList.keys.toList()[index]}.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Album details (name)
            Padding(
              padding: const EdgeInsets.only(top: 6.0, left: 4, right: 10),
              child: Text(
                songList.keys.toList()[index],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: height * 0.014, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 4, right: 10),
              child: Text(
                'Album songs',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: height * 0.012,
                  fontWeight: FontWeight.w500,
                  color: CupertinoColors.systemGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
