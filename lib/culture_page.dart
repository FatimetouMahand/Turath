import 'dart:math';
import 'package:flutter/material.dart';

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

      body: Column(
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

          /// 📝 النص داخل كادر + scroll
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),

              child: Container(
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: const Color(0xFFF4ECEA),
                  borderRadius: BorderRadius.circular(25),
                ),

                child: const SingleChildScrollView(
                  child: Text(
                    """✨ تتميَّزُ موريتانيا بعاداتٍ وتقاليدَ أصيلةٍ تعكسُ عمقَ المجتمعِ الصحراويِّ وتمسُّكَهُ بهويَّتِهِ. 
ومن أبرزِ مظاهرِ هذه الهويَّةِ الزيُّ التقليديُّ ، حيثُ يرتدي الرجالُ الدِّراعةَ الفضفاضةَ، بينما تتزيَّنُ النساءُ بـالمَلْحَفَةِ بألوانِها المتعدِّدة 🌸، إلى جانبِ أزياءٍ خاصَّةٍ بباقي الأعراقِ تعكسُ تنوُّعَ المجتمعِ الموريتانيِّ في إطارٍ من الانسجامِ والتكامل. وفي البادية، تنتشرُ عادةُ لبسِ النِّيلةِ التي تُعَدُّ جزءًا من التقاليدِ الجماليَّةِ والثقافيَّةِ.

 ومن العاداتِ الاجتماعيَّةِ التي تعكسُ قيمَ الحياءِ والاحترامِ، عادةُ حياءِ العروسِ، حيثُ كانت تُغطِّي وجهَها في بدايةِ حياتِها الزوجيَّةِ تعبيرًا عن الوقارِ والتقاليدِ المتوارثة.

ومن العاداتِ اليوميَّةِ الراسخةِ شربُ الشاي (أتاي)، الذي لا يُعَدُّ مجرَّدَ مشروبٍ، بل طقسًا اجتماعيًّا يجمعُ الناسَ ويرمزُ إلى الكرمِ وحُسنِ الضيافةِ، إذ يُقدَّمُ للضيوفِ في كلِّ وقتٍ، ويُعَدُّ فرصةً للتلاقي وتبادلِ الأحاديث.

📖 كما لعبتِ المحاظرُ دورًا أساسيًّا في حياةِ المجتمعِ قديمًا، حيثُ كانت مركزًا لتعليمِ الرجالِ القرآنَ والعلومَ الشرعيَّةَ، وأسهمت في تكوينِ الأجيالِ علميًّا وأخلاقيًّا، فكانت من أهمِّ ركائزِ المجتمعِ التقليديِّ.

🌍 وهكذا، تجتمعُ هذه العاداتُ لتُشكِّلَ صورةَ مجتمعٍ محافظٍ يعتزُّ بتقاليدِهِ ويورِّثُها عبرَ الأجيالِ، مع حرصِهِ على الحفاظِ على أصالتِهِ في وجهِ التغيُّراتِ الحديثة.""",

                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.8,
                      color: Color(0xFF6B5B56),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔥 توزيع دائري
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