
import 'dart:math';
import 'package:flutter/material.dart';
import 'models/favorite_model.dart';
import 'widgets/favorite_button.dart';
import 'l10n/locale_provider.dart';

const Map<String, Map<String, String>> cultureStrings = {
  'page_title': {
    'ar': 'العادات والتقاليد',
    'fr': 'Coutumes et traditions',
  },
  'tea_title': {
    'ar': 'الشاي',
    'fr': 'Le thé',
  },
  'tea_desc': {
    'ar':
        'الكرم وحفاوة الاستقبال: استقبال الضيف واجب، ويتم تقديم الشاي ثلاث مرات (المر، القوي، الخفيف).',
    'fr':
        "Générosité et hospitalité : accueillir l'invité est un devoir, et le thé est servi en trois fois (amer, fort, léger).",
  },
  'chnine_title': {
    'ar': 'الشنين',
    'fr': 'Le Chnine',
  },
  'chnine_desc': {
    'ar':
        'مشروب تقليدي منعش يُحضّر من اللبن، ويُعد جزءاً أساسياً من الحياة اليومية في البادية.',
    'fr':
        'Boisson traditionnelle rafraîchissante préparée à base de lait, élément essentiel de la vie quotidienne dans le désert.',
  },
  'tent_title': {
    'ar': 'الخيمة',
    'fr': 'La tente',
  },
  'tent_desc': {
    'ar':
        'الخيمة البيضاء هي مسكن البادية، ترمز للأصالة وتزين من الداخل بألوان جميلة.',
    'fr':
        "La tente blanche est l'habitat du désert, symbole d'authenticité, décorée à l'intérieur de belles couleurs.",
  },
  'wedding_title': {
    'ar': 'الزواج التقليدي',
    'fr': 'Le mariage traditionnel',
  },
  'wedding_desc': {
    'ar':
        'الترواغ، المهر، لباس العروس، والتقاليد الاجتماعية كلها تعكس عمق الثقافة الموريتانية.',
    'fr':
        "Le Trawagh, la dot, la tenue de la mariée et les traditions sociales reflètent la profondeur de la culture mauritanienne.",
  },
  'tichtar_title': {
    'ar': 'التيشطار',
    'fr': 'Le Tichtar',
  },
  'tichtar_desc': {
    'ar': 'طريقة تقليدية لحفظ اللحم عبر تجفيفه تحت الشمس بعد تقطيعه.',
    'fr':
        'Méthode traditionnelle de conservation de la viande en la séchant au soleil après découpe.',
  },
  'deraa_title': {
    'ar': 'الدراعة',
    'fr': 'La Deraa',
  },
  'deraa_desc': {
    'ar': 'زي الرجال التقليدي، غالباً بالأزرق أو الأبيض، مع اللثام المميز.',
    'fr':
        "Tenue traditionnelle des hommes, souvent bleue ou blanche, accompagnée du voile distinctif (Lithame).",
  },
  'malhfa_title': {
    'ar': 'الملحفة',
    'fr': 'La Melhfa',
  },
  'malhfa_desc': {
    'ar': 'الزي التقليدي للمرأة، رمز للأناقة والحشمة، بألوان زاهية متنوعة.',
    'fr':
        "Tenue traditionnelle des femmes, symbole d'élégance et de pudeur, aux couleurs vives et variées.",
  },
  'lblouh_title': {
    'ar': 'لبلوح',
    'fr': 'Le Leblouh',
  },
  'lblouh_desc': {
    'ar': 'تقليد قديم يُعرف بالتسمين، كان يعتبر رمزاً للجمال والثراء.',
    'fr':
        "Ancienne tradition connue sous le nom de gavage, considérée autrefois comme un symbole de beauté et de richesse.",
  },
};

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
      "titleKey": "tea_title",
      "descKey": "tea_desc",
    },
    {
      "image": "assets/images/chnine.jpeg",
      "titleKey": "chnine_title",
      "descKey": "chnine_desc",
    },
    {
      "image": "assets/images/5ayma.jpeg",
      "titleKey": "tent_title",
      "descKey": "tent_desc",
    },
    {
      "image": "assets/images/t3ras.jpeg",
      "titleKey": "wedding_title",
      "descKey": "wedding_desc",
    },
    {
      "image": "assets/images/tich6ar.jpeg",
      "titleKey": "tichtar_title",
      "descKey": "tichtar_desc",
    },
    {
      "image": "assets/images/dera3e.jpeg",
      "titleKey": "deraa_title",
      "descKey": "deraa_desc",
    },
    {
      "image": "assets/images/lmel7fe.jpeg",
      "titleKey": "malhfa_title",
      "descKey": "malhfa_desc",
    },
    {
      "image": "assets/images/lblou7.jpeg",
      "titleKey": "lblouh_title",
      "descKey": "lblouh_desc",
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
        title: Text(
          context.tr(cultureStrings, 'page_title'),
          style: const TextStyle(
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
                    title: context.tr(cultureStrings, item["titleKey"]!),
                    desc: context.tr(cultureStrings, item["descKey"]!),
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
          color: Colors.black.withValues(alpha: 0.08),
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
                    color: Colors.black.withValues(alpha: 0.15),
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
                  color: Colors.black.withValues(alpha: 0.2),
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