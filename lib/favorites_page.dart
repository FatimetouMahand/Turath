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
import 'package:projet_devmobil/models/favorite_model.dart';
import 'package:projet_devmobil/services/favorite_service.dart';

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

  void load() async {
    items = await FavoriteService.getFavorites();
    setState(() {});
  }

  void deleteItem(int index) async {
    final item = items[index];

    items.removeAt(index);
    await FavoriteService.saveFavorites(items);

    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("تم حذف العنصر"),
        backgroundColor: Colors.brown,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F6),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8F6),
        elevation: 0,
        title: const Text(
          "المفضلة",
          style: TextStyle(
            color: Color(0xFF442A22),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: items.isEmpty
          ? const Center(
              child: Text(
                "لا توجد عناصر ❤️",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return Dismissible(
                  key: Key(item.title),
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
                      children: const [
                        Text(
                          "حذف",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 28,
                        ),
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
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        )
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
                                  item.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF442A22),
                                  ),
                                ),

                                const SizedBox(height: 6),

                                Text(
                                  item.description,
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