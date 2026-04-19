import 'package:flutter/material.dart';

class ToolsPage extends StatefulWidget {
  const ToolsPage({super.key});

  @override
  State<ToolsPage> createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  /// 🖼️ الصور + النص
  final List<Map<String, String>> items = [
    {"image": "assets/images/ardine.jpeg", "text": """آردين
آلة المرأة في الموسيقى الحسانية

التاريخ
كانت المرأة العازفة للأردين – من طبقة إيكاون – تتمتع بمكانة اعتبارية، لأنها تحمل “سر الإبداع” وذاكرة الشفاهيات

المكونات
قدح خشبي مجوف، عود طويل، عمود رأسي، أوتار، مفاتيح خشبية

دورها في الموسيقى الموريتانية
الأردين هي الآلة الوترية الأساسية في الغناء النسائي الموريتاني، تُستخدم في الأعراس والمناسبات وترافق التبرع والمديح والأغاني """},
    {"image": "assets/images/rahle.jpeg", "text": """ الراحلة
هي أداة مصنوعة من الخشب، كان يقوم الرجال بشدّها ووضعها فوق الحِمال ليتمكنوا من الجلوس عليها"""},
    {"image": "assets/images/lehrej.jpeg", "text": """لحْرَج
النسخة النسائية من الراحلة، وتستخدمها النساء للجلوس عليها، وتوضع أيضًا فوق الجمال """},
    {"image": "assets/images/iliwiche.jpeg", "text": """إِيليوِشْ
فِراش مصنوع من مختلف أنواع الجلد، كان يُستخدم قديمًا من أجل استقبال الكبار والمشايخ، وكان يستخدمه الرجال للصلاة أحيانًا.

أمّا ما فوقه فهو وسادتان يُطلق عليهما محليًا “اصْرامة" """},
    {"image": "assets/images/lehmar.jpeg", "text": """ لَحْمَار
مكان مصنوع من مجموعة عيدان من الخشب، تُوضَع عليه “الكَربة”، وتُصنَع  الكربة من جلد الماعز، وكانت تستخدم قديما ليُوضَع فيها الماء ليُحفَظ باردً"""},
    {"image": "assets/images/lafiye.jpeg", "text": """ لمْدكَّ و المَهْرازْ

هما اداتان تقليدياتان تستخدمان يدريا من اجل طحن الامور و تتم صناعتها من الخشب القوي .


اللّافِيّة
وعاء تقليدي لحفظ الطعام، يرافقه غطاؤه كما في الصورة، ويُسمّى “كَطايَة”"""},
    {"image": "assets/images/sevye.jpeg", "text": """ ارْحَ

هو ما كان يُستخدم قديمًا مكان الطواحين الكهربائية الآن، ويُستخدم غالبًا لطحن الحبوب مثل “الزرع”.
 
و ويتكوّن من عدة أدوات: غطاؤه يسمى “الصَّفْيَة” و الادات التي تستخدم للطحن و تسمى **“المَعْرَظ”**، وهو ما يُمسكونه ويطحنون به بحركات دائري"""},
   
    {"image": "assets/images/erehale.jpeg", "text": """ ⸻

أشَقَّب
وهو مكان وضع المتاع، يكون عادةً في جانب الخيمة"""},
    {"image": "assets/images/naifare.jpeg", "text": """ لنيفارة..
 آلة موسيقية فولكلورية تشبه المزمار، تُصنع من عصا يبلغ طولها نحو المتر، ويمسكها العازف بحرفية عالية، وينفخ فيها لتخرج نغمات ساحرة. النيفارة ليست مجرد أداة عزف، بل ذاكرة تختزن حنين الرعاة والمزارعين، وقد ارتبط صوتها بأنغام الصحراء وسهرات البدو الطويلة. في الليالي، كانت ترافق الرعاة في وحدتهم وتواسي مكابداتهم، كما حضرت في المناسبات الاجتماعية والسهرات المديحية. ويُعدّ عزف النيفارة فنًا متوارثًا عبر الأجيال.
وهي رمز للحنين لدى الموريتانيين."""},
  ];

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
          "أدوات تقليدية",
          style: TextStyle(
            color: Color(0xFF442A22),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Stack(
        children: [

          /// 🔥 PageView
          PageView.builder(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,

            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },

            itemBuilder: (context, index) {
              return Column(
                children: [

                  /// 🖼️ الصورة
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        items[index]["image"]!,
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  /// 📝 النص (يتمدد ويملأ الفراغ)
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(20),

                      decoration: BoxDecoration(
                        color: const Color(0xFFF4ECEA),
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: SingleChildScrollView(
                        child: Text(
                          items[index]["text"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            height: 1.8,
                            color: Color(0xFF6B5B56),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              );
            },
          ),

          /// ➜ التالي
          Positioned(
            right: 10,
            top: MediaQuery.of(context).size.height / 2 - 30,
            child: _arrowButton(
              icon: Icons.arrow_forward_ios,
              onTap: () {
                if (currentIndex < items.length - 1) {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ),

          /// ⬅ السابق
          Positioned(
            left: 10,
            top: MediaQuery.of(context).size.height / 2 - 30,
            child: _arrowButton(
              icon: Icons.arrow_back_ios,
              onTap: () {
                if (currentIndex > 0) {
                  _controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  /// 🔘 زر السهم
  Widget _arrowButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}