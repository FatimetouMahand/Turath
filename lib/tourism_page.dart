import 'package:flutter/material.dart';

class TourismPage extends StatelessWidget {
  const TourismPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f8fa),

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            expandedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('السياحة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFF8F0E9), Color(0xFFFFF8F6)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),

          // HERO
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    height: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 24,
                          offset: Offset(0, 12),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            "assets/images/tourism/Chinguetti1.jpeg",
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  const Color.fromRGBO(0, 0, 0, 0.55),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                          const Positioned(
                            bottom: 22,
                            right: 22,
                            left: 22,
                            child: Text(
                              "اكتشف موريتانيا",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Colors.black45,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // SEARCH
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: const Color(0xFFECE2DB)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x1A000000),
                          blurRadius: 18,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "ابحث عن وجهة سياحية...",
                        prefixIcon: const Icon(Icons.search, color: Color(0xFF6B5B56)),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  _sectionTitle("🏛️ المواقع التاريخية"),

                  _gallery([
                    "assets/images/tourism/Chinguetti1.jpeg",
                    "assets/images/tourism/Chinguetti2.jpeg",
                    "assets/images/tourism/Chinguetti3.jpeg",
                  ]),

                  _gallery([
                    "assets/images/tourism/Ouadane1.jpeg",
                    "assets/images/tourism/Ouadane2.jpeg",
                    "assets/images/tourism/Ouadane3.jpeg",
                    "assets/images/tourism/Ouadane4.jpeg",
                  ]),

                  const SizedBox(height: 20),

                  _sectionTitle("🪐 عين الصحراء"),

                  _gallery([
                    "assets/images/tourism/StructuredeRichat1.jpeg",
                    "assets/images/tourism/StructuredeRichat2.jpeg",
                    "assets/images/tourism/StructuredeRichat3.jpeg",
                  ]),

                  const SizedBox(height: 20),

                  _sectionTitle("🌴 الطبيعة"),

                  _gallery([
                    "assets/images/tourism/Terjit1.jpeg",
                    "assets/images/tourism/Terjit2.jpeg",
                    "assets/images/tourism/Terjit3.jpeg",
                    "assets/images/tourism/Terjit5.jpeg",
                  ]),

                  const SizedBox(height: 20),

                  _sectionTitle("🐦 حوض آركين"),

                  _gallery([
                    "assets/images/tourism/ParcnationalduBancdArguin1.jpeg",
                    "assets/images/tourism/ParcnationalduBancdArguin2.jpeg",
                    "assets/images/tourism/ParcnationalduBancdArguin3.jpeg",
                    "assets/images/tourism/ParcnationalduBancdArguin4.jpeg",
                  ]),

                  const SizedBox(height: 20),

                  _sectionTitle("🌊 نواذيبو"),

                  _gallery([
                    "assets/images/tourism/Nouadhibou1.jpeg",
                    "assets/images/tourism/Nouadhibou2.jpeg",
                    "assets/images/tourism/Nouadhibou3.jpeg",
                  ]),

                  const SizedBox(height: 20),

                  _sectionTitle("🏖️ شاطئ نواكشوط"),

                  _gallery([
                    "assets/images/tourism/PlagedeNouakchott1.jpeg",
                    "assets/images/tourism/PlagedeNouakchott2.jpeg",
                    "assets/images/tourism/PlagedeNouakchott3.jpeg",
                  ]),

                  const SizedBox(height: 20),

                  _sectionTitle("🏨 الفنادق"),

                  _gallery([
                    "assets/images/tourism/FasqHotelNouakchott1.jpeg",
                    "assets/images/tourism/FasqHotelNouakchott2.jpeg",
                    "assets/images/tourism/FasqHotelNouakchott3.jpeg",
                    "assets/images/tourism/FasqHotelNouakchott4.jpeg",
                  ]),

                  _gallery([
                    "assets/images/tourism/Monotel1.jpeg",
                    "assets/images/tourism/Monotel2.jpeg",
                    "assets/images/tourism/Monotel3.jpeg",
                    "assets/images/tourism/Monotel4.jpeg",
                  ]),

                  const SizedBox(height: 20),

                  _sectionTitle("☕ المطاعم"),

                  _gallery([
                    "assets/images/tourism/dipndip1.jpeg",
                  ]),

                  _gallery([
                    "assets/images/tourism/PAUL1.jpeg",
                  ]),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // SECTION TITLE
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF442A22),
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              backgroundColor: const Color(0xFFF5E3D7),
            ),
            child: const Text(
              'عرض الكل',
              style: TextStyle(
                color: Color(0xFF442A22),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // GALLERY
  Widget _gallery(List<String> images) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _showImageDialog(context, images[index]),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              margin: const EdgeInsets.only(right: 15),
              width: 300,
              child: Hero(
                tag: images[index],
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.center,
                            colors: [
                              Colors.black38,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 16,
                        left: 16,
                        child: CircleAvatar(
                          backgroundColor: Color(0xAAFFFFFF),
                          child: Icon(
                            Icons.open_in_full,
                            size: 18,
                            color: Color(0xFF442A22),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  void _showImageDialog(BuildContext context, String image) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        insetPadding: const EdgeInsets.all(12),
        backgroundColor: Colors.transparent,
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Hero(
            tag: image,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: InteractiveViewer(
                child: Image.asset(image, fit: BoxFit.contain),
              ),
            ),
          ),
        ),
      ),
    );
  }
}