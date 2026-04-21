import 'package:flutter/material.dart';
import 'cities_page.dart';
import 'ghan_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8F6),
        elevation: 1,
        title: const Text(
          "تراثنا",
          style: TextStyle(
            color: Color(0xFF442A22),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        leading: const Icon(Icons.menu, color: Color(0xFF442A22)),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [
              const SizedBox(height: 20),

              // 🔥 HERO
              Column(
                children: const [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Color(0xFFF5DED7),
                    child: Icon(Icons.castle,
                        color: Color(0xFF442A22), size: 30),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "تراثنا",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF442A22),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "اكتشف التراث الموريتاني",
                    style: TextStyle(color: Color(0xFF6B5B56)),
                  ),
                ],
              ),


              const SizedBox(height: 30),

              // 🔲 GRID (❗ بدون const)
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
                      title: "المدن التاريخية"),
                  CustomCard(
                      icon: Icons.menu_book,
                      title: "لغن و الأمثلة الموريتانية"),
                  CustomCard(
                      icon: Icons.construction,
                      title: "أدوات تقليدية"),
                  CustomCard(
                      icon: Icons.groups,
                      title: "العادات والتقاليد"),
                ],
              ),

              const SizedBox(height: 30),

              // 🖼️ IMAGE
              ClipRRect(
  borderRadius: BorderRadius.circular(20),
  child: Stack(
    children: [

      /// 🖼️ IMAGE
      Image.network(
        "https://lh3.googleusercontent.com/aida-public/AB6AXuD95W-4_wxe9Z9YqDGl5-GlQEMy5PUTFoZAQt_gEnvjObDhu7LufOgYlzOex-w-YBFvaq12SSd6AfuaJT3rMbl-jg_9wJSTwHSvUpCIi0t4jDSNP3BeWpA9mfafCsrBVKcJkTQ8BcAPAduWV8sUqSGOIRkVI2w5nDN44kih50qgvPbnTfCRhWok7aKXl-AC1eCozovHYwn_OxdBDXUo45a5luA64D5oD5c_XQ1VouCGzIe0bxGGn1UVfi8jyX5sZ1VrgUwpWdbg-FA",
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      ),

      /// 🌫️ GRADIENT (باش يبان النص)
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

      /// ✨ TEXT فوق الصورة
      const Positioned(
        bottom: 20,
        right: 20,
        left: 20,
        child: Text(
          "جمال الصحراء الموريتانية\nو تراثها",
          textAlign: TextAlign.center,
          style: TextStyle(
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

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF442A22),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "الرئيسية"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "الفئات"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "المفضلة"),
        ],
      ),
    );
  }
}

// 🔲 CARD (✅ تم إصلاحه)
class CustomCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const CustomCard({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title == "المدن التاريخية") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CitiesPage(),
            ),
          );
        }

            if (title == "لغن و الأمثلة الموريتانية") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const GhanPage(),
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
              title,
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