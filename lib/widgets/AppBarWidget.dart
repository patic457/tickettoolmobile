import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  final bool isActive;
  final Color? color;
  final String title;
  final IconButton? iconButton;
  final String type;

  const AppBarWidget({
    Key? key,
    this.isActive = true,
    this.color,
    required this.title,
    this.iconButton,
    required this.type,
  }) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppState();
}

class _AppState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    Color color = widget.type == 'main'
        ? const Color(0xFF25584F)
        : const Color(0xffb73c23a);
    var iconButton = widget.type == 'main'
        ? null
        : IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          );
    return PreferredSize(
      preferredSize: Size.fromWidth(MediaQuery.of(context).size.width),
      child: AppBar(
        backgroundColor: color,
        leading: iconButton,
        title: Text(widget.title),
        centerTitle: true,
      ),
    );
  }
}
