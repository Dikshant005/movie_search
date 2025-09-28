import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../domain/entities/media.dart';

class DetailsPage extends StatelessWidget {
  final Media media;

  const DetailsPage({required this.media, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: media.posterUrl ?? '',
                  width: 210,
                  height: 260,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Container(
                    width: 210,
                    height: 260,
                    color: Colors.grey[900],
                    child: const Icon(
                      Icons.broken_image,
                      color: Colors.white54,
                      size: 64,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              media.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _tag('16+'),
                _tag('1h 49m'),
                _tag('HD'),
                _tag('7.4'),
                _tag('CC'),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              '${media.releaseDate.substring(0, 4)} • ${media.genres?.join(" • ") ?? 'Action • Thriller • Crime'}',
              style: const TextStyle(color: Colors.white70, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                    size: 28,
                  ),
                  label: const Text(
                    "Play",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 36,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.list, color: Colors.white, size: 32),
                  tooltip: "Watchlist",
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.video_library,
                    color: Colors.white,
                    size: 32,
                  ),
                  tooltip: "Trailer",
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.download,
                    color: Colors.white,
                    size: 32,
                  ),
                  tooltip: "Download",
                ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  "Watchlist",
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
                Text(
                  "Trailer",
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
                Text(
                  "Download",
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                media.overview,
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ),
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Starring: Denzel Washington, Dakota Fanning, ...',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  static Widget _tag(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
