import 'package:flutter/material.dart';
import '../models/favorite_model.dart';
import '../services/favorite_service.dart';

class FavoriteButton extends StatefulWidget {
  final FavoriteItem item;
  final Color iconColor;
  final Color activeColor;
  final Color backgroundColor;

  const FavoriteButton({
    super.key,
    required this.item,
    this.iconColor = Colors.white,
    this.activeColor = Colors.white,
    this.backgroundColor = const Color.fromARGB(0, 255, 255, 255),
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    check();
  }

  void check() async {
    isFav = await FavoriteService.isFavoriteItem(widget.item);
    if (!mounted) return;
    setState(() {});
  }

  void toggle() async {
    await FavoriteService.toggleFavorite(widget.item);
    check();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggle,
      child: CircleAvatar(
        backgroundColor: widget.backgroundColor,
        child: Icon(
          isFav ? Icons.favorite : Icons.favorite_border,
          color: isFav ? widget.activeColor : widget.iconColor,
        ),
      ),
    );
  }
}
