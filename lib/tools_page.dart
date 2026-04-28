
import 'dart:async';
import 'package:flutter/material.dart';
import 'models/favorite_model.dart';
import 'widgets/favorite_button.dart';
class OldToolsPage extends StatelessWidget {
  const OldToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الأدوات الفنية القديمة"),
        backgroundColor: const Color(0xFFFFF8F6),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [

          buildCard(
            title: "🍽️ أدوات المطبخ",
            description:
                "الأدوات التقليدية في الطبخ مثل القدور الفخارية والملاعق الخشبية.",
            images: [
              ImageItem("assets/images/lgchayche.jpg", "الملاعق الخشبية"),
              ImageItem("assets/images/lvekhar.jpg", "القدور الفخارية"),
            ],
          ),

          buildCard(
            title: "🚬 أدوات التدخين",
            description:
                "الغليون والأدوات القديمة المستخدمة في التدخين التقليدي.",
            images: [
              ImageItem("assets/images/smoking2.jpg", "الغليون التقليدي"),
              ImageItem("assets/images/smmoking.jpeg", "أدوات التدخين"),
            ],
          ),

          buildCard(
            title: "🐪 أدوات السفر",
            description:
                "وسائل السفر في الصحراء مثل الجمال والحقائب الجلدية.",
            images: [
              ImageItem("assets/images/ra7le.png", "الرحلة الصحراوية"),
              ImageItem("assets/images/refade2.jpg", "حقائب السفر"),
            ],
          ),

          buildCard(
            title: "🏠 أدوات المسكن",
description:
    "كان السكن الموريتاني قديماً عبارة عن خيمة واحدة (بيت الشعر)، "
    "يجتمع فيها جميع أفراد العائلة مع حاجياتهم الأساسية، رغم بساطتها وقلة أدواتها في ذلك الزمن.\n\n"
    "وكانت الحياة داخل الخيمة تعتمد على التنظيم البسيط للأغراض، "
    "حيث تُستعمل بعض الأدوات التقليدية للمساعدة في ترتيب وحفظ الحاجيات مثل السلال والحصائر والأكياس الجلدية.",
            images: [
              ImageItem("assets/images/seken.jpg", "الخيمة التقليدية"),
              ImageItem("assets/images/seken2.jpg", "أدوات المسكن"),
              ImageItem("assets/images/refad.jpg", "أدوات المسكن"),
            ],
          ),
          
          buildCard(
  title: "🍵  أدوات الشاي ",
description:
    "،يُعتبر الشاي (أتاي) جزءاً لا يتجزأ من الحياة اليومية لكل موريتاني "
    ".وكان قديماً خاصاً بالرجال فقط، لكن مع مرور الوقت أصبح يشربه الجميع\n\n"
    ":توجد له مصطلحات تقليدية خاصة، منها\n"
    ".التعمار: وهي أول خطوة، وتتمثل في وضع براد يحتوي على الماء وأوراق الشاي على النار حتى الغليان\n\n"
    ".بعد ذلك يُنقل الشاي إلى براد آخر، ويُضاف إليه السكر ثم يُسكب في كؤوس صغيرة\n\n"
    ".كما توجد مرحلة تُسمى التلقيم، وتعني إضافة المزيد من أوراق الشاي بعد المرحلة الأولى",
  images: [
    ImageItem("assets/images/lberade.jpeg", "البراد"),
    ImageItem("assets/images/jma3e.jpg", "جلسة الشاي"),
    ImageItem("assets/images/etaye.jpg", "إتاي"),
  ],
),
          // CARD SHAY + SHNIN + SHAKWA
          buildCard(
            title: " أدوات الشرب (الشنين)",
  description:
      "،تُستعمل الكدحة قديماً في تقديم شراب الشنين التقليدي "
      ".وهو مشروب يُحضَّر من حليب الحيوانات مثل البقر والإبل والغنم\n\n"
      ".يتم تحضير الشنين عبر عملية الترويب والتخمير، مما يمنحه نكهة مميزة وقواماً خاصاً\n\n"
      ".ويُحضَّر باستعمال الشكوة، ثم يُقدَّم بواسطة الكدحة في الجلسات التقليدية",
            images: [
              ImageItem("assets/images/chenine.png", "الشنين"),
              ImageItem("assets/images/chikwa.png", "الشكوة"),
              ImageItem("assets/images/zrig1.jpeg", "الكدحة"),
            ],
          ),


buildCard(
  title: " آلات الغناء الموريتاني",
  description:
      "تُعتبر الآلات الموسيقية التقليدية جزءاً مهماً من التراث الموريتاني، "
      "وتُستعمل في الغناء والشعر والمناسبات الاجتماعية، "
      "ومن أبرزها الآردين والتيدينيت والطبل، التي تعكس هوية الثقافة البدوية.",
  images: [
    ImageItem("assets/images/garmie.png", "الآردين"),
    ImageItem("assets/images/erdine.jpg", "التيدينيت"),
    ImageItem("assets/images/tbale.jpg", "الطبل"),
    ImageItem("assets/images/neyvare.png", "النيفارة"),
  ],
),
        ],
      ),
    );
  }

  Widget buildCard({
    required String title,
    required String description,
    required List<ImageItem> images,
  }) {
    return AutoImageCard(
      title: title,
      description: description,
      images: images,
    );
  }
}

class ImageItem {
  final String image;
  final String title;

  ImageItem(this.image, this.title);
}

class AutoImageCard extends StatefulWidget {
  final String title;
  final String description;
  final List<ImageItem> images;

  const AutoImageCard({
    super.key,
    required this.title,
    required this.description,
    required this.images,
  });

  @override
  State<AutoImageCard> createState() => _AutoImageCardState();
}

class _AutoImageCardState extends State<AutoImageCard> {
  int currentIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        currentIndex =
            (currentIndex + 1) % widget.images.length;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

 @override
Widget build(BuildContext context) {
  final currentItem = widget.images[currentIndex];

  return Card(
    margin: const EdgeInsets.only(bottom: 18),
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// 🖼️ IMAGE + ❤️ (FIXED HERE)
          Stack(
            children: [

              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Image.asset(
                    currentItem.image,
                    key: ValueKey(currentItem.image),
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              /// ❤️ FAVORITE BUTTON
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(0, 255, 255, 255),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                      )
                    ],
                  ),
                  child: FavoriteButton(
                    item: FavoriteItem(
                      image: currentItem.image,
                      title: widget.title,
                      description: widget.description,
                    ),
                  ),
                ),
              ),

            ],
          ),

          const SizedBox(height: 8),

          // 🏷️ IMAGE TITLE
          Text(
            currentItem.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),

          const SizedBox(height: 10),

          // 🏷️ CARD TITLE
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          // 📝 DESCRIPTION
          Text(
            widget.description,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    ),
  );

}}