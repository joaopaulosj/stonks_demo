import 'package:demo_stonks/app/app_dimens.dart';
import 'package:flutter/material.dart';

import '../../../../app_strings.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.black38,
      selectedItemColor: Colors.blueAccent,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 0.0,
      selectedLabelStyle: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
      ),
      items: [
        BottomNavigationBarItem(
          label: AppStrings.homeMenuHome,
          icon: Padding(
            padding: const EdgeInsets.only(
              bottom: kMarginSmall,
              top: 4.0,
            ),
            child: const Icon(Icons.home_outlined),
          ),
        ),
        BottomNavigationBarItem(
          label: AppStrings.homeMenuChats,
          icon: Padding(
            padding: const EdgeInsets.only(
              bottom: kMarginSmall,
              top: 4.0,
            ),
            child: const Icon(Icons.chat_outlined),
          ),
        ),
        BottomNavigationBarItem(
          label: AppStrings.homeMenuMentions,
          icon: Padding(
            padding: const EdgeInsets.only(bottom: kMarginSmall),
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 6.0, top: 4.0),
                  child: const Icon(Icons.alternate_email_outlined),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: ClipOval(
                    child: Container(
                      color: Colors.blueAccent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 1.0,
                          horizontal: 5.0,
                        ),
                        child: const Text(
                          '8',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: AppStrings.homeMenuBrowse,
          icon: Padding(
            padding: const EdgeInsets.only(
              bottom: kMarginSmall,
              top: 4.0,
            ),
            child: const Icon(Icons.search),
          ),
        ),
      ],
    );
  }
}
