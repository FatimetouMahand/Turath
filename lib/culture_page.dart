
import 'dart:math';
import 'package:flutter/material.dart';
import 'models/favorite_model.dart';
import 'widgets/favorite_button.dart';
class CulturePage extends StatefulWidget {
  const CulturePage({super.key});

  @override
  State<CulturePage> createState() => _CulturePageState();
}

class _CulturePageState extends State<CulturePage>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  final List<String> images = [
    "assets/images/lbadiye.jpeg",
    "assets/images/dera3e.jpeg",
    "assets/images/etay.jpeg",
    "assets/images/lekwer.jpeg",
    "assets/images/lmehdhre.jpeg",
    "assets/images/nile.jpeg",
  ];

  final List<Map<String, String>> traditions = [
    {
      "image": "assets/images/chay.jpeg",
      "title": "الشاي",
      "desc":
          "الكرم وحفاوة الاستقبال: استقبال الضيف واجب، ويتم تقديم الشاي ثلاث مرات (المر، القوي، الخفيف)."
    },
    {
      "image": "assets/images/chnine.jpeg",
      "title": "الشنين",
      "desc":
          "مشروب تقليدي منعش يُحضّر من اللبن، ويُعد جزءاً أساسياً من الحياة اليومية في البادية."
    },
    {
      "image": "assets/images/5ayma.jpeg",
      "title": "الخيمة",
      "desc":
          "الخيمة البيضاء هي مسكن البادية، ترمز للأصالة وتزين من الداخل بألوان جميلة."
    },
    {
      "image": "assets/images/t3ras.jpeg",
      "title": "الزواج التقليدي",
      "desc":
          "الترواغ، المهر، لباس العروس، والتقاليد الاجتماعية كلها تعكس عمق الثقافة الموريتانية."
    },
    {
      "image": "assets/images/tich6ar.jpeg",
      "title": "التيشطار",
      "desc":
          "طريقة تقليدية لحفظ اللحم عبر تجفيفه تحت الشمس بعد تقطيعه."
    },
    {
      "image": "assets/images/dera3e.jpeg",
      "title": "الدراعة",
      "desc":
          "زي الرجال التقليدي، غالباً بالأزرق أو الأبيض، مع اللثام المميز."
    },
    {
      "image": "assets/images/lmel7fe.jpeg",
      "title": "الملحفة",
      "desc":
          "الزي التقليدي للمرأة، رمز للأناقة والحشمة، بألوان زاهية متنوعة."
    },
    {
      "image": "assets/images/lblou7.jpeg",
      "title": "لبلوح",
      "desc":
          "تقليد قديم يُعرف بالتسمين، كان يعتبر رمزاً للجمال والثراء."
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 25),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F6),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8F6),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Color(0xFF442A22)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "العادات والتقاليد",
          style: TextStyle(
            color: Color(0xFF442A22),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      /// 🔥 FIX HERE (SCROLL ADDED)
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// 🌍 الكرة
            SizedBox(
              height: 500,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Stack(
                    children: _buildCircle(context),
                  );
                },
              ),
            ),

            /// 📝 SECTION MODERNE
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: const Color(0xFFF4ECEA),
                borderRadius: BorderRadius.circular(25),
              ),

              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(), // مهم جداً
                shrinkWrap: true, // مهم جداً
                itemCount: traditions.length,
                itemBuilder: (context, index) {
                  final item = traditions[index];

                  return _modernCard(
                    image: item["image"]!,
                    title: item["title"]!,
                    desc: item["desc"]!,
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
Widget _modernCard({
  required String image,
  required String title,
  required String desc,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 10,
        )
      ],
    ),

    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [

          /// 🔹 CONTENT
          Row(
            children: [

              ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(20),
                ),
                child: Image.asset(
                  image,
                  width: 90,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF442A22),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        desc,
                        style: const TextStyle(
                          color: Color(0xFF6B5B56),
                          height: 1.5,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          /// ❤️ FAVORITE BUTTON (FIXED VISIBILITY)
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(0, 255, 255, 255),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 6,
                  )
                ],
              ),
              child: FavoriteButton(
                item: FavoriteItem(
                  image: image,
                  title: title,
                  description: desc,
                ),
              ),
            ),
          ),

        ],
      ),
    ),
  );
}

  List<Widget> _buildCircle(BuildContext context) {
    final double radius = 150;
    final int count = images.length;

    final Size size = MediaQuery.of(context).size;
    final double centerX = size.width / 2;
    final double centerY = 260;

    return List.generate(count, (index) {
      final angle =
          (2 * pi * index / count) + (_controller.value * 2 * pi);

      final double x = radius * cos(angle);
      final double y = radius * sin(angle);

      return Positioned(
        left: centerX + x - 50,
        top: centerY + y - 120,
        child: Opacity(
          opacity: 0.9,
          child: Container(
            width: 100,
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 12,
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                images[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
    });
  }
}