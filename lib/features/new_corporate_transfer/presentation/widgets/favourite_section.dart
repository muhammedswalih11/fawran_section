import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';
import '../data/lists.dart';
import 'favourite_avatar_tile.dart';

// class FavouriteSection extends StatelessWidget {
//   const FavouriteSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final screenWidth = mediaQuery.size.width;
//     final screenHeight = mediaQuery.size.height;

//     return Container(
//       padding: EdgeInsets.only(
//         top: screenHeight * 0.02,
//         bottom: screenHeight * 0.02,
//         left: screenWidth * 0.05,
//         right: screenWidth * 0.03,
//       ),
//       decoration: BoxDecoration(
//         color: Color(0xFFF1F8FF),
//         borderRadius: BorderRadius.circular(24),
//       ),
//       child: SizedBox(
//         height: screenHeight * 0.09,
//         child: ListView.separated(
//           scrollDirection: Axis.horizontal,
//           itemCount: favouriteList.length,
//           separatorBuilder: (_, __) => SizedBox(width: screenWidth * 0.03),
//           itemBuilder: (_, index) {
//             return FavouriteAvatarTile(item: favouriteList[index]);
//           },
//         ),
//       ),
//     );
//   }
// }

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: screenWidth * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
        color: DefaultColors.blue00,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...favouriteList.map((favourite) {
            final name = favourite.name;
            final avatarPath = favourite.avatar;
            final isCorporate = favourite.isCorporate;

            Widget avatar;

            if (avatarPath != null && avatarPath.isNotEmpty) {
              avatar = CircleAvatar(
                radius: screenWidth * 0.064,
                backgroundImage: AssetImage(avatarPath),
              );
            } else {
              // Show initials when no image provided
              final initials = name.isNotEmpty
                  ? name
                        .trim()
                        .split(' ')
                        .map((e) => e.isNotEmpty ? e[0] : '')
                        .take(2)
                        .join()
                  : '';
              avatar = CircleAvatar(
                backgroundColor: DefaultColors.white,
                radius: screenWidth * 0.064,
                child: CircleAvatar(
                  radius: screenWidth * 0.06,
                  backgroundColor: DefaultColors.blueLight1,
                  child: Text(
                    initials,
                    style: TextStyle(
                      color: DefaultColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
              );
            }

            return Padding(
              padding: EdgeInsets.all(screenWidth * 0.045),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      avatar,
                      if (isCorporate)
                        Positioned(
                          top: -6,
                          right: 1,
                          child: Container(
                            width: screenWidth * 0.12,
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.015,
                              vertical: screenWidth * 0.008,
                            ),
                            decoration: BoxDecoration(
                              color: DefaultColors.flatblue,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'CORP',
                                style: TextStyle(
                                  color: DefaultColors.white,
                                  fontSize: screenWidth * 0.022,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 4),
                  SizedBox(
                    width: 58,
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: DefaultColors.black,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
