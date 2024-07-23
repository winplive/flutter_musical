import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musical_app/page/calender_page.dart';
import 'package:musical_app/page/community_page.dart';
import 'package:musical_app/page/home_page.dart';
import 'package:musical_app/page/user_page.dart';
import 'package:musical_app/page/wishlist_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<IconData?> icon = ValueNotifier(Icons.notifications);

  void _onNavigationItemSelected(index) {
    pageIndex.value = index;
    icon.value = iconDatas[index];
  }

  final pages = const [
    HomePage(),
    CalenderPage(),
    WishlistPage(),
    CommunityPage(),
    UserPage(),
  ];

  final iconDatas = const [
    Icons.notifications,
    Icons.more_horiz,
    null,
    Icons.search,
    Icons.notifications,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        actions: [
          ValueListenableBuilder(
            valueListenable: icon,
            builder: (context, value, child) =>
                IconButton(onPressed: () {}, icon: Icon(icon.value)),
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: _onNavigationItemSelected,
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  __BottomNavigationBarState createState() => __BottomNavigationBarState();
}

class __BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Card(
      color: (brightness == Brightness.light) ? Colors.transparent : null,
      elevation: 0,
      margin: const EdgeInsets.all(0),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavigationBarItem(
                index: 0,
                icon: Icons.home_outlined,
                selectedIcon: Icons.home,
                isSelected: (selectedIndex == 0),
                onTap: handleItemSelected,
              ),
              _NavigationBarItem(
                index: 1,
                icon: Icons.event_available_outlined,
                selectedIcon: Icons.event_available,
                isSelected: (selectedIndex == 1),
                onTap: handleItemSelected,
              ),
              _NavigationBarItem(
                index: 2,
                icon: Icons.favorite_border,
                selectedIcon: Icons.favorite,
                isSelected: (selectedIndex == 2),
                onTap: handleItemSelected,
              ),
              _NavigationBarItem(
                index: 3,
                icon: Icons.chat_bubble_outline,
                selectedIcon: Icons.chat_bubble,
                isSelected: (selectedIndex == 3),
                onTap: handleItemSelected,
              ),
              _NavigationBarItem(
                index: 4,
                icon: Icons.person_outline,
                selectedIcon: Icons.person,
                isSelected: (selectedIndex == 4),
                onTap: handleItemSelected,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({
    Key? key,
    required this.index,
    required this.icon,
    required this.selectedIcon,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final IconData icon;
  final IconData selectedIcon;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? selectedIcon : icon,
              size: 34,
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
