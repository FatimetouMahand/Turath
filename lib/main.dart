import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'patrimoine_page.dart';
import 'tourism_page.dart';
import 'favorites_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Turath Mauritania',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF442A22),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        fontFamily: 'serif',
      ),
      home: const MainHomePage(),
    );
  }
}

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _buildBottomNavBar(context),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8F6),
        elevation: 1,
        centerTitle: false,
        title: const Text(
          "سافر إلى موريتانيا",
          style: TextStyle(
            color: Color(0xFF442A22),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Color(0xFF442A22)),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildHeroSection(context),
            _buildFooterSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF442A22),
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const PatrimoinePage()),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => TourismPage()),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const FavoritesPage()),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
        BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: "التراث"),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: "السياحة"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "المفضلة"),
      ],
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          height: screenHeight * 0.85,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF442A22),
            image: DecorationImage(
              image: AssetImage("assets/images/sa7ra.jpeg"),
              fit: BoxFit.cover,
              opacity: 0.4, // Rend l'image transparente
            ),
          ),
        ),

        Container(
          height: screenHeight * 0.85,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.4),
                const Color(0xFFFFF8F6), // Fondu fluide vers la section inférieure
              ],
              stops: const [0.0, 0.7, 1.0],
            ),
          ),
        ),

        Positioned(
          top: screenHeight * 0.15,
          left: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                ),
                child: const Text(
                  "موريتانيا — أرض الأصالة",
                  style: TextStyle(
                    color: Color(0xFFF5DED7),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "حيث تمتد الصحراء\nبلا نهاية",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              const Text(
                "وتحكي الرمال قصص الأجداد",
                style: TextStyle(
                  color: Color(0xFFF5DED7),
                  fontSize: 26,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              Text(
                "أرضٌ تجمع بين البحر والصحراء،\nوبين التاريخ والإنسان.",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 18,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    _buildGlassButton(
                      context: context,
                      title: "استكشف السياحة",
                      subtitle: "أماكن طبيعية ومدن جميلة",
                      icon: Icons.explore,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => TourismPage()),
                        );
                      },
                    ),
                    _buildGlassButton(
                      context: context,
                      title: "التراث الموريتاني",
                      subtitle: "تاريخ وثقافة الأجداد",
                      icon: Icons.account_balance,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const PatrimoinePage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGlassButton({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              onTap: onTap,
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 26),
              ),
              title: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ),
              trailing: const Icon(Icons.arrow_back_ios, color: Colors.white54, size: 18),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooterSection() {
    return Container(
      padding: const EdgeInsets.all(30),
      color: const Color(0xFFFFF8F6),
      child: const Text(
        "تُعد موريتانيا وجهة سياحية هادئة تجمع سحر الصحراء وعبق التاريخ.\nتأسر الزائر بثقافتها الأصيلة ومدنها العتيقة وطبيعتها البِكر.",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Color(0xFF442A22), height: 1.6),
      ),
    );
  }
}