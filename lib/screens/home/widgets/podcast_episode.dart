import 'package:flutter/material.dart';
import 'package:spotifyui/utils/constants.dart';

class PodcastEpisodeCard extends StatelessWidget {
  const PodcastEpisodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 360,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF4E6478),
              Color(0xFF334D64),
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'The Black Dahlia Murder\nPt.2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          height: 1.15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Episode • Solved Murders: True Crime Mysteries',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white70, width: 1.5),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            const _ArtworkSection(),
            const SizedBox(height: 26),
            const Text(
              "Sep 2023 • 46 min • Elizabeth Short's gruesome murder is the LAPD's most infamous unsolved case. But there's one person who thinks he's cracked it — the alleged killer's own son. Today, we reopen the case against Geo...",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 13,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 22),
            Row(
              children: [
                Container(
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF172635),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.share_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Preview episode',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 24,
                ),
                const SizedBox(width: 16),
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: Color(0xFF162534),
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ArtworkSection extends StatelessWidget {
  const _ArtworkSection();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned.fill(
            child: Row(
              children: [
                Expanded(child: _WaveBars(reverse: true)),
                SizedBox(width: 124),
                Expanded(child: _WaveBars()),
              ],
            ),
          ),
          Center(
            child: Container(
              width: 116,
              height: 116,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.12),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 14,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Image.asset("$IMAGE_PATH/card_prw.png", fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}

class _WaveBars extends StatelessWidget {
  const _WaveBars({this.reverse = false});

  final bool reverse;

  @override
  Widget build(BuildContext context) {
    final bars = [4.0, 7.0, 11.0, 16.0, 22.0, 30.0, 22.0, 16.0, 11.0, 7.0, 4.0];
    final items = reverse ? bars.reversed.toList() : bars;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: items
          .map(
            (h) => Container(
          width: 3,
          height: h,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.25),
            borderRadius: BorderRadius.circular(99),
          ),
        ),
      )
          .toList(),
    );
  }
}
