import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title, this.leading});

  final Text? title;
  final Widget? leading;
  final double leadingWidth = 80.0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: leading,
      leadingWidth: leadingWidth,
      title: title,
      actions: [
        Container(
          padding: const EdgeInsets.only(right: 25),
          child: const Icon(
            Icons.more_vert,
            color: Colors.black,
            size: 35,
            
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); 
}
