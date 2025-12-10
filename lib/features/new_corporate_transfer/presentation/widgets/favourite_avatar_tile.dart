import 'package:flutter/material.dart';
import '../data/models.dart';

class FavouriteAvatarTile extends StatelessWidget {
  final FavouriteItem item;

  const FavouriteAvatarTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // ---- AVATAR ----
    Widget avatar;
    if (item.avatar != null && item.avatar!.isNotEmpty) {
      avatar = CircleAvatar(
        radius: screenWidth * 0.08,
        backgroundImage: AssetImage(item.avatar!),
      );
    } else {
      final initials = item.name.isNotEmpty
          ? item.name.trim().split(" ").map((e) => e[0]).take(2).join()
          : "";

      avatar = CircleAvatar(
        radius: screenWidth * 0.08,
        backgroundColor: const Color(0xFFEAF1F9),
        child: Text(
          initials,
          style: TextStyle(
            color: Colors.blueGrey.shade700,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.05,
          ),
        ),
      );
    }

    return SizedBox(
      width: screenWidth * 0.22,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              avatar,

              // ---- CORPORATE BADGE ----
              if (item.isCorporate)
                Positioned(
                  top: -10,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.025,
                      vertical: screenWidth * 0.010,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF007BFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "CORP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.030,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          SizedBox(height: screenWidth * 0.02),

          // ---- NAME ----
          Text(
            item.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xFF001A72),
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
