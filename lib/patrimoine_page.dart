import 'package:flutter/material.dart';
import 'cities_page.dart';
import 'poetry_page.dart';
import 'tools_page.dart';
import 'culture_page.dart';
import 'favorites_page.dart';
import 'l10n/locale_provider.dart';

/// Tableau de traduction des textes de la page Patrimoine.
const Map<String, Map<String, String>> patrimoineStrings = {
  'app_title': {'ar': 'تراثنا', 'fr': 'Notre patrimoine'},
  'discover_subtitle': {'ar': 'اكتشف التراث الموريتاني', 'fr': 'Découvrez le patrimoine mauritanien'},
  'card_historic_cities': {'ar': 'المدن التاريخية', 'fr': 'Villes historiques'},
  'card_proverbs': {'ar': 'لغن و الأمثلة الموريتانية', 'fr': 'Lagn et proverbes mauritaniens'},
  'card_traditional_tools': {'ar': 'أدوات تقليدية', 'fr': 'Outils traditionnels'},
  'card_traditions': {'ar': 'العادات والتقاليد', 'fr': 'Coutumes et traditions'},
  'hero_image_caption': {'ar': 'جمال الصحراء الموريتانية\nو تراثها', 'fr': 'La beauté du désert mauritanien\net de son patrimoine'},
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  PatrimoinePage(),
    );
  }
}

class PatrimoinePage extends StatelessWidget {
  const PatrimoinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8F6),
        elevation: 1,
        title: Text(
          context.tr(patrimoineStrings, 'app_title'),
          style: const TextStyle(
            color: Color(0xFF442A22),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
         
         
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [
              const SizedBox(height: 20),

              //  HERO
              Column(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Color(0xFFF5DED7),
                    child: Icon(Icons.castle,
                        color: Color(0xFF442A22), size: 30),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    context.tr(patrimoineStrings, 'app_title'),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF442A22),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.tr(patrimoineStrings, 'discover_subtitle'),
                    style: const TextStyle(color: Color(0xFF6B5B56)),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              //  GRID ( بدون const)
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1,

                children: [
                  CustomCard(
                      icon: Icons.fort,
                      titleKey: 'card_historic_cities'),
                  CustomCard(
                      icon: Icons.menu_book,
                      titleKey: 'card_proverbs'),
                  CustomCard(
                      icon: Icons.construction,
                      titleKey: 'card_traditional_tools'),
                  CustomCard(
                      icon: Icons.groups,
                      titleKey: 'card_traditions'),
                ],
              ),

              const SizedBox(height: 30),

              //  IMAGE
              ClipRRect(
  borderRadius: BorderRadius.circular(20),
  child: Stack(
    children: [

      ///  IMAGE
      Image.network(
        "https://lh3.googleusercontent.com/aida-public/AB6AXuD95W-4_wxe9Z9YqDGl5-GlQEMy5PUTFoZAQt_gEnvjObDhu7LufOgYlzOex-w-YBFvaq12SSd6AfuaJT3rMbl-jg_9wJSTwHSvUpCIi0t4jDSNP3BeWpA9mfafCsrBVKcJkTQ8BcAPAduWV8sUqSGOIRkVI2w5nDN44kih50qgvPbnTfCRhWok7aKXl-AC1eCozovHYwn_OxdBDXUo45a5luA64D5oD5c_XQ1VouCGzIe0bxGGn1UVfi8jyX5sZ1VrgUwpWdbg-FA",
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      ),

      Container(
        height: 200,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black54, Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),


      Positioned(
        bottom: 20,
        right: 20,
        left: 20,
        child: Text(
          context.tr(patrimoineStrings, 'hero_image_caption'),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20, // نفس الحجم تقريباً
            fontWeight: FontWeight.bold,
            height: 1.5,
          ),
        ),
      ),
    ],
  ),
),
            ],
          ),
        ),
      ),

    );
  }
}


class CustomCard extends StatelessWidget {
  final IconData icon;
  final String titleKey;

  const CustomCard({super.key, required this.icon, required this.titleKey});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (titleKey == "card_historic_cities") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CitiesPage(),
           ),
         );
       }

       if (titleKey == "card_proverbs") {
         Navigator.push(
           context,
           MaterialPageRoute(
             builder: (context) => const PoetryPage(),
           ),
         );
       }
      if (titleKey == "card_traditional_tools") {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const OldToolsPage(),
    ),
  );
}

    if (titleKey == "card_traditions") {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const CulturePage(),
    ),
  );
}
  },

      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF4ECEA),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(icon, color: Color(0xFF442A22)),
            ),
            const SizedBox(height: 10),
            Text(
              context.tr(patrimoineStrings, titleKey),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF442A22),
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ),
    );
  }
}