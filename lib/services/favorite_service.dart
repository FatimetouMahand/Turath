import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projet_devmobil/models/favorite_model.dart';

class FavoriteService {
  static const String key = "favorites";

  static Future<List<FavoriteItem>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(key);

    if (data == null) return [];

    final List decoded = jsonDecode(data);
    return decoded.map((e) => FavoriteItem.fromJson(e)).toList();
  }

  static Future<void> saveFavorites(List<FavoriteItem> items) async {
    final prefs = await SharedPreferences.getInstance();
    final data = jsonEncode(items.map((e) => e.toJson()).toList());
    await prefs.setString(key, data);
  }

  static Future<void> toggleFavorite(FavoriteItem item) async {
    List<FavoriteItem> items = await getFavorites();

    final exists = items.any((e) => e.title == item.title);

    if (exists) {
      items.removeWhere((e) => e.title == item.title);
    } else {
      items.add(item);
    }

    await saveFavorites(items);
  }

  static Future<bool> isFavorite(String title) async {
    final items = await getFavorites();
    return items.any((e) => e.title == title);
  }
}