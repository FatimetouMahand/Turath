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
                      "assets/images/Ouadane.jpeg",
                      "وادان",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _smallImage(
                      "assets/images/Tichitt.jpeg",
                      "تيشيت",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              /// 🟫 BIG IMAGE (ولاتة)
              _bigImage(
                "assets/images/Oualata.jpeg",
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
                      "الوصف",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF442A22),
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      "تُعد المدن التاريخية في موريتانيا من أهم مراكز الحضارة الإسلامية في غرب إفريقيا.",
                      style: TextStyle(
                        color: Color(0xFF6B5B56),
                        height: 1.6,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "شنقيط كانت مركزاً علمياً كبيراً، ووادان محطة للقوافل، وتيشيت مدينة تجارية، وولاتة معروفة بزخارفها المعمارية.",
                      style: TextStyle(
                        color: Color(0xFF6B5B56),
                        height: 1.6,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "هذه المدن تمثل تراثاً إنسانياً عظيماً وتعكس تاريخ الصحراء وثقافتها.",
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

  /// 🟫 BIG IMAGE (Style moderne)
  Widget _bigImage(String path, String title) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10), // Style moderne
      child: Stack(
        children: [
          Image.asset(
            path,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.2), // Filtre sombre moderne
            colorBlendMode: BlendMode.darken,
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

  /// 🟦 SMALL IMAGE (Style moderne)
  Widget _smallImage(String path, String title) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10), // Style moderne
      child: Stack(
        children: [
          Image.asset(
            path,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.2), // Filtre sombre moderne
            colorBlendMode: BlendMode.darken,
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