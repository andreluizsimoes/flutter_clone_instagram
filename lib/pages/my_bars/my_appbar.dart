import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Instagram',
        style: TextStyle(fontFamily: 'Billabong', fontSize: 40),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_box_outlined,
              size: 32,
            )),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_border,
            size: 32,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.maps_ugc_outlined,
            size: 32,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
