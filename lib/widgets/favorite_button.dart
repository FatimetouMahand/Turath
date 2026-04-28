import 'package:flutter/material.dart';
import '../models/favorite_model.dart';
import '../services/favorite_service.dart';

class FavoriteButton extends StatefulWidget {
  final FavoriteItem item;

  const FavoriteButton({super.key, required this.item});

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
    isFav = await FavoriteService.isFavorite(widget.item.title);
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
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        child: Icon(
  isFav ? Icons.favorite : Icons.favorite_border,
  color: isFav ? Colors.white : Colors.white,
)
      ),
    );
  }
}