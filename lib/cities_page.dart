import 'package:flutter/material.dart';
import 'models/favorite_model.dart';
import 'widgets/favorite_button.dart';

class CitiesPage extends StatelessWidget {
  const CitiesPage({super.key});

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
          "المدن التاريخية",
          style: TextStyle(
            color: Color(0xFF6B5B56),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          _modernCityCard(
            image: "assets/images/chinguetti.jpeg",
            title: "شنقيط",
            description:
                "مدينة شنقيط تعتبر من أعرق المدن التاريخية في موريتانيا، تأسست منذ قرون طويلة في قلب الصحراء الكبرى. "
                "اشتهرت بأنها مركز علمي وديني مهم، حيث كانت تضم مكتبات كبيرة ومخطوطات نادرة. "
                "كما كانت محطة أساسية للحجاج والقوافل التجارية القادمة من إفريقيا نحو الحجاز.",
          ),

          _modernCityCard(
            image: "assets/images/Ouadane.jpeg",
            title: "وادان",
            description:
                "وادان مدينة صحراوية قديمة ازدهرت كمركز تجاري بين شمال وغرب إفريقيا. "
                "كانت ملتقى للقوافل التجارية ومركزًا لتبادل الذهب والملح والكتب العلمية. "
                "كما لعبت دورًا كبيرًا في نشر العلم والدين في المنطقة.",
          ),

          _modernCityCard(
            image: "assets/images/Tichitt.jpeg",
            title: "تيشيت",
            description:
                "تيشيت من أقدم المدن الموريتانية، تتميز بطابعها المعماري الفريد المبني من الطين. "
                "كانت مدينة علم وتجارة، واحتفظت بطابعها التقليدي عبر الزمن رغم الظروف الصحراوية القاسية.",
          ),

          _modernCityCard(
            image: "assets/images/Oualata.jpeg",
            title: "ولاتة",
            description:
                "ولاتة تُعد من أهم المدن العلمية القديمة، وكانت مركزًا كبيرًا للعلماء والفقهاء. "
                "اشتهرت برسوماتها الجدارية الجميلة وطرقها التجارية التي تربط الصحراء بالمدن الكبرى في إفريقيا.",
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  /// ⭐ MODERN PREMIUM CARD DESIGN
  Widget _modernCityCard({
    required String image,
    required String title,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// IMAGE HERO (CLEAN + MODERN OVERLAY)
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(28),
            ),
            child: Stack(
              children: [

                Image.asset(
                  image,
                  height: 210,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                /// SOFT DARK GRADIENT
                Container(
                  height: 210,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.55),
                      ],
                    ),
                  ),
                ),

                /// TITLE BADGE (MODERN GLASS STYLE)
                Positioned(
                  bottom: 15,
                  right: 15,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.18),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.25),
                      ),
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: FavoriteButton(
                    item: FavoriteItem(
                      image: image,
                      title: title,
                      description: description,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// CONTENT
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
            child: Text(
              description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Color(0xFF6B5B56),
                fontSize: 14,
                height: 1.6,
                letterSpacing: 0.2,
              ),
            ),
          ),

          /// SMALL DECORATIVE LINE (MODERN TOUCH)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    const Color(0xFFE9E1DF),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}