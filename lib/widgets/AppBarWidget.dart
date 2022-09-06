import 'package:flutter/material.dart';

class AppBarWidget {
  appBar(context, title, type) {
    Color color = type == 'main' ? Color(0xFF25584F) : Color(0xFFB73C23A);
    var iconButton = type == 'main'
        ? null
        : IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          );

    AppBar appBar = AppBar(
      backgroundColor: color,
      leading: iconButton,
      title: Text(title),
      centerTitle: true,
    );

    return appBar;
  }
}
