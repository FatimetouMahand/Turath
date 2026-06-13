// import 'package:flutter/material.dart';
// import 'package:projet_devmobil/models/favorite_model.dart';
// import 'package:projet_devmobil/services/favorite_service.dart';

// class FavoritesPage extends StatefulWidget {
//   const FavoritesPage({super.key});

//   @override
//   State<FavoritesPage> createState() => _FavoritesPageState();
// }

// class _FavoritesPageState extends State<FavoritesPage> {
//   List<FavoriteItem> items = [];

//   @override
//   void initState() {
//     super.initState();
//     load();
//   }

//   void load() async {
//     items = await FavoriteService.getFavorites();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("المفضلة")),
//       body: items.isEmpty
//           ? const Center(child: Text("لا توجد عناصر"))
//           : ListView.builder(
//               itemCount: items.length,
//               itemBuilder: (context, i) {
//                 final item = items[i];

//                 return Card(
//                   child: ListTile(
//                     leading: Image.asset(item.image, width: 60),
//                     title: Text(item.title),
//                     subtitle: Text(item.description),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projet_devmobil/models/favorite_model.dart';
import 'package:projet_devmobil/services/favorite_service.dart';
import 'l10n/locale_provider.dart';
import 'l10n/tourism_destination_translations.dart';

const Map<String, Map<String, String>> favoritesStrings = {
  'favorites_title': {'ar': 'المفضلة', 'fr': 'Favoris'},
  'item_deleted': {'ar': 'تم حذف العنصر', 'fr': 'Élément supprimé'},
  'no_items': {'ar': 'لا توجد عناصر ❤️', 'fr': 'Aucun élément ❤️'},
  'delete': {'ar': 'حذف', 'fr': 'Supprimer'},
};

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<FavoriteItem> items = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    items = await FavoriteService.getFavorites();
    if (!mounted) return;
    setState(() {});
  }

  Future<void> deleteItem(int index) async {
    items.removeAt(index);
    await FavoriteService.saveFavorites(items);

    if (!mounted) return;
    setState(() {});

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.tr(favoritesStrings, 'item_deleted')),
        backgroundColor: Colors.brown,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final language = context.watch<LocaleProvider>().language;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F6),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8F6),
        elevation: 0,
        title: Text(
          context.tr(favoritesStrings, 'favorites_title'),
          style: const TextStyle(
            color: Color(0xFF442A22),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: items.isEmpty
          ? Center(
              child: Text(
                context.tr(favoritesStrings, 'no_items'),
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final tourismText = tourismTextByFavorite(
                  item.tourismId,
                  item.image,
                  language,
                );
                final title = tourismText?.title ?? item.title;
                final description =
                    tourismText?.description ?? item.description;

                return Dismissible(
                  key: Key(item.tourismId ?? '${item.image}-${item.title}'),
                  direction: DismissDirection.endToStart,

                  onDismissed: (direction) {
                    deleteItem(index);
                  },

                  background: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.only(right: 20),
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      color: Colors.red.shade400,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          context.tr(favoritesStrings, 'delete'),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.delete, color: Colors.white, size: 28),
                      ],
                    ),
                  ),

                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),

                    child: Row(
                      children: [
                        /// 🖼️ IMAGE
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          child: Image.asset(
                            item.image,
                            width: 110,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                        ),

                        /// 📝 TEXT
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF442A22),
                                  ),
                                ),

                                const SizedBox(height: 6),

                                Text(
                                  description,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF6B5B56),
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
