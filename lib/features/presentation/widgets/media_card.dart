import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/media.dart';

class MediaCard extends StatelessWidget {
  final Media media;
  final VoidCallback onTap;
  const MediaCard({required this.media, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: media.posterUrl != null
                  ? CachedNetworkImage(
                      imageUrl: media.posterUrl!,
                      fit: BoxFit.cover,
                      placeholder: (_, __) =>
                          const ColoredBox(color: Colors.black12),
                      errorWidget: (_, __, ___) => const Icon(Icons.broken_image),
                    )
                  : const ColoredBox(
                      color: Colors.black12,
                      child: Icon(Icons.movie, size: 64),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    media.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 14, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(media.voteAverage.toStringAsFixed(1)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}