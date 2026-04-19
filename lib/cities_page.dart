import 'package:flutter/material.dart';

class CitiesPage extends StatelessWidget {
  const CitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F6),

      // 🔝 APP BAR
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8F6),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_forward, color: Color(0xFF442A22)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "المدن التاريخية",
          style: TextStyle(
             color: Color(0xFF6B5B56),
             height: 1.6,
          ),
        ),
        centerTitle: true,
      ),

      // ✅ SCROLL FIXED
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              

              /// 🟫 BIG IMAGE (شنقيط)
              _bigImage(
                "assets/images/chinguetti.jpeg",
                "شنقيط",
              ),

              const SizedBox(height: 16),

              /// 🟦 SMALL IMAGES
              Row(
                children: [
                  Expanded(
                    child: _smallImage(
                      "assets/images/ouadane.jpeg",
                      "وادان",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _smallImage(
                      "assets/images/tichitt.jpeg",
                      "تيشيت",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              /// 🟫 BIG IMAGE (ولاتة)
              _bigImage(
                "assets/images/oualata.jpeg",
                "ولاتة",
              ),

              const SizedBox(height: 30),

              /// 📄 DESCRIPTION
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4ECEA),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "📜 المدن التاريخية الموريتانية",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF442A22),
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      "تُعد المدن التاريخية الأربع في موريتانيا، وهي شنقيط ووادان وتيشيت وولاتة، من أهم الشواهد على عراقة الحضارة الإسلامية في الصحراء الكبرى، وقد صُنّفت ضمن التراث العالمي لما لعبته من دور علمي وتجاري وثقافي عبر القرون.",
                      style: TextStyle(
                        color: Color(0xFF6B5B56),
                        height: 1.6,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "شنقيط تُعتبر من أقدم هذه المدن، حيث يعود تاريخها إلى القرن الثامن الميلادي تقريبًا، وكانت مركزًا علميًا ودينيًا مهمًا، وارتبط اسمها بالعلماء والمخطوطات، حتى أصبحت رمزًا للثقافة الإسلامية في المنطقة . أما وادان فقد ازدهرت في القرن السادس الهجري، وكانت محطة رئيسية للقوافل التجارية في الصحراء، ومركزًا للعلم والتبادل الثقافي بين شمال إفريقيا وغربها",
                      
                      style: TextStyle(
                        color: Color(0xFF6B5B56),
                        height: 1.6,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      ". أما ولاتة فقد تأسست سنة 1224م، وكانت منارة علمية وثقافية كبرى، وموطنًا للعلماء، كما شكلت محطة مهمة في طرق القوافل الصحراوية، واشتهرت بازدهارها العلمي والديني .بينما تُعد تيشيت من أقدم المدن عمرانًا، إذ يرجع تأسيسها إلى القرن الثاني عشر الميلادي تقريبًا، وقد عرفت بدورها التجاري والعلمي، وكانت من المدن التي حافظت على طابعها المعماري الصحراوي عبر الزمن",
                      style: TextStyle(
                        color: Color(0xFF6B5B56),
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔘 FILTER
  Widget _filter(String text, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        color: active ? const Color(0xFF442A22) : const Color(0xFFE9E1DF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: active ? Colors.white : Colors.black54,
        ),
      ),
    );
  }

  /// 🟫 BIG IMAGE
  Widget _bigImage(String path, String title) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        children: [
          Image.asset(
            path,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Container(
            height: 250,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black45, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

          Positioned(
            bottom: 16,
            right: 16,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// 🟦 SMALL IMAGE
  Widget _smallImage(String path, String title) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Stack(
        children: [
          Image.asset(
            path,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Container(
            height: 150,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black45, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

          Positioned(
            bottom: 10,
            right: 10,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}