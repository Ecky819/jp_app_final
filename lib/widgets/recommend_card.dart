import 'package:flutter/material.dart';

class RecommendCard extends StatelessWidget {
  final String assetImage;
  final String title;
  final String subtitle;
  final String price;
  final int likes;
  final VoidCallback onItemTap;

  const RecommendCard({
    super.key,
    required this.assetImage,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.likes,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTap,
      child: Container(
        width: 190,
        height: 260,
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [-0.2, 0.61, 1.0],
            colors: [Color(0x00FFFFFF), Color(0xFF908CF5), Color(0xFF8C5BEA)],
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0x80FFFFFF), width: 1),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1AFFFFFF),
              blurRadius: 24,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                assetImage,
                cacheWidth: 155,
                cacheHeight: 155,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'SF Pro Text',
                fontStyle: FontStyle.normal,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontFamily: 'SF Pro Text',
                fontStyle: FontStyle.normal,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 22),
            Row(
              children: [
                Image.asset('assets/icons/currency.png', width: 15, height: 15),
                Text(
                  price,
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontStyle: FontStyle.normal,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.favorite_border,
                  color: Colors.white70,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  likes.toString(),
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontStyle: FontStyle.normal,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
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
