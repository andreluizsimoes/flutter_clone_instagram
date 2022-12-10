import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/pages/home/home_page.dart';
import 'package:iconsax/iconsax.dart';

class MyBottomNavigationBar extends StatefulWidget
    implements PreferredSizeWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();

  @override
  Size get preferredSize => Size.fromHeight(kBottomNavigationBarHeight);
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int indice = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 5,
        iconSize: 30,
        selectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.video_play
                // Icons.play_circle_outline_outlined,
                ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 30,
              width: 30,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.cheatsheet.com/wp-content/uploads/2020/05/Evan-Peters-American-Horror-Story.jpg'),
              ),
            ),
            label: 'Pag2',
          ),
        ],
      ),
      body: IndexedStack(
        index: indice,
        children: [HomePage()],
      ),
    );
  }
}
