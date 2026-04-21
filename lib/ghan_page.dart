import 'package:flutter/material.dart';

class GhanPage extends StatelessWidget {
  const GhanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("لغن والأمثلة الموريتانية"),
        backgroundColor: const Color(0xFFFFF8F6),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/tarab.jpeg",
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [Colors.black54, Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

             
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/dimi.jpeg",
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [Colors.black45, Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/fan.jpeg",
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [Colors.black38, Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

               Text(
              "يُعتبر لِغَن القلب النابض للفن الموريتاني، وهو غناء تقليدي يعتمد أساسًا على الشعر الحساني، وتؤدّيه فئة إيگاون الذين حفظوا هذا الفن ونقلوه جيلًا بعد جيل.\n\n"
              "لغن ليس مجرد موسيقى، بل هو وسيلة للتعبير عن:\n\n"
              "الحب والحنين\n"
              "الفخر والبطولة\n"
              "الحزن والفراق\n"
              "الحكمة وتجارب الحياة\n\n"
              "ويمتاز لغن بنظام فني فريد يُسمّى الطبوع، حيث يحمل كل طبع إحساسًا ومعنى نفسيًا خاصًا، مما يجعل الغناء الموريتاني مدرسة فنية متكاملة، لها قواعدها وأصولها الخاصة.\n\n"
              " روّاد الفن الغنائي\n\n"
              "برز في تاريخ الغناء الموريتاني فنانون كبار، كان لهم دور أساسي في نشر لغن داخل البلاد وخارجها، ومنهم:\n\n"
              "ديمي منت آبه التي وصلت بصوتها الأصيل إلى العالمية، وحملت الفن الموريتاني إلى المسارح الدولية.\n"
              "سيداتي ولد آبه أحد أعمدة الغناء التقليدي وحفاظ الطبوع.\n"
              "خديجة منت انني التي مثّلت الغناء النسائي الأصيل وحافظت على نغمه الهادئ والعميق.\n\n"
              "هؤلاء الفنانون لم يكونوا مجرد مؤدّين، بل حراسًا للذاكرة الفنية.\n\n"
              "الشعر الموريتاني: ديوان المجتمع\n\n"
              "يحتل الشعر مكانة مركزية في الثقافة الموريتانية، سواء كان فصيحًا أو حسانيًا. وقد عبّر الشعراء عن الدين، الأخلاق، الوطن، والسياسة، كما وثّقوا حياة الناس في الصحراء.\n\n"
              "ومن أبرز الشعراء:\n\n"
              "محمد ولد الطلبة اليعقوبي، الذي عُرف بقوة اللغة وعمق المعنى.\n"
              "بداه ولد البصيري، شاعر الوطن والكرامة.\n"
              "المختار ولد بونه الجكني، الذي جمع بين العلم والشعر.\n\n"
              "وكان الشعر ولا يزال وسيلة للتعليم، للحكمة، ولحفظ التاريخ الشفهي.\n\n"
              "الأمثلة الحسانية: حكمة الأجداد\n\n"
              "تُعدّ الأمثال الحسانية جزءًا أساسيًا من التراث غير المادي، وهي خلاصة تجارب الأجيال، تُقال في مواقف الحياة اليومية لتوجيه السلوك وتقويم الأخلاق. تمتاز ببساطتها وعمق معناها، وتُظهر ذكاء المجتمع الموريتاني وفلسفته في الحياة.",
      
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  height: 1.6,
                  color: Color(0xFF442A22),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}