import 'package:flutter/material.dart';
import 'models/favorite_model.dart';
import 'widgets/favorite_button.dart';
import 'l10n/locale_provider.dart';

/// Tableau de traduction des textes de la page des villes historiques.
const Map<String, Map<String, String>> citiesStrings = {
  'page_title': {'ar': 'المدن التاريخية', 'fr': 'Villes historiques'},
  'chinguetti_title': {'ar': 'شنقيط', 'fr': 'Chinguetti'},
  'chinguetti_description': {
    'ar':
        'مدينة شنقيط تعتبر من أعرق المدن التاريخية في موريتانيا، تأسست منذ قرون طويلة في قلب الصحراء الكبرى. '
        'اشتهرت بأنها مركز علمي وديني مهم، حيث كانت تضم مكتبات كبيرة ومخطوطات نادرة. '
        'كما كانت محطة أساسية للحجاج والقوافل التجارية القادمة من إفريقيا نحو الحجاز.',
    'fr':
        'La ville de Chinguetti est l\'une des villes historiques les plus anciennes de Mauritanie, fondée il y a de nombreux siècles au cœur du grand désert. '
        'Elle était réputée pour être un important centre scientifique et religieux, abritant de grandes bibliothèques et des manuscrits rares. '
        'Elle était également une étape essentielle pour les pèlerins et les caravanes commerciales venant d\'Afrique vers le Hijaz.',
  },
  'ouadane_title': {'ar': 'وادان', 'fr': 'Ouadane'},
  'ouadane_description': {
    'ar':
        'وادان مدينة صحراوية قديمة ازدهرت كمركز تجاري بين شمال وغرب إفريقيا. '
        'كانت ملتقى للقوافل التجارية ومركزًا لتبادل الذهب والملح والكتب العلمية. '
        'كما لعبت دورًا كبيرًا في نشر العلم والدين في المنطقة.',
    'fr':
        'Ouadane est une ancienne ville désertique qui a prospéré en tant que centre commercial entre l\'Afrique du Nord et l\'Afrique de l\'Ouest. '
        'Elle était un point de rencontre pour les caravanes commerciales et un centre d\'échange d\'or, de sel et de livres scientifiques. '
        'Elle a également joué un grand rôle dans la diffusion de la science et de la religion dans la région.',
  },
  'tichitt_title': {'ar': 'تيشيت', 'fr': 'Tichitt'},
  'tichitt_description': {
    'ar':
        'تيشيت من أقدم المدن الموريتانية، تتميز بطابعها المعماري الفريد المبني من الطين. '
        'كانت مدينة علم وتجارة، واحتفظت بطابعها التقليدي عبر الزمن رغم الظروف الصحراوية القاسية.',
    'fr':
        'Tichitt est l\'une des plus anciennes villes mauritaniennes, caractérisée par son architecture unique construite en terre. '
        'C\'était une ville de science et de commerce, qui a conservé son caractère traditionnel à travers le temps malgré les conditions désertiques difficiles.',
  },
  'oualata_title': {'ar': 'ولاتة', 'fr': 'Oualata'},
  'oualata_description': {
    'ar':
        'ولاتة تُعد من أهم المدن العلمية القديمة، وكانت مركزًا كبيرًا للعلماء والفقهاء. '
        'اشتهرت برسوماتها الجدارية الجميلة وطرقها التجارية التي تربط الصحراء بالمدن الكبرى في إفريقيا.',
    'fr':
        'Oualata est considérée comme l\'une des plus importantes villes scientifiques anciennes, et était un grand centre pour les savants et les juristes. '
        'Elle était réputée pour ses belles peintures murales et ses routes commerciales reliant le désert aux grandes villes d\'Afrique.',
  },
};

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
        title: Text(
          context.tr(citiesStrings, 'page_title'),
          style: const TextStyle(
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
            context: context,
            image: "assets/images/chinguetti.jpeg",
            title: context.tr(citiesStrings, 'chinguetti_title'),
            description: context.tr(citiesStrings, 'chinguetti_description'),
          ),

          _modernCityCard(
            context: context,
            image: "assets/images/Ouadane.jpeg",
            title: context.tr(citiesStrings, 'ouadane_title'),
            description: context.tr(citiesStrings, 'ouadane_description'),
          ),

          _modernCityCard(
            context: context,
            image: "assets/images/Tichitt.jpeg",
            title: context.tr(citiesStrings, 'tichitt_title'),
            description: context.tr(citiesStrings, 'tichitt_description'),
          ),

          _modernCityCard(
            context: context,
            image: "assets/images/Oualata.jpeg",
            title: context.tr(citiesStrings, 'oualata_title'),
            description: context.tr(citiesStrings, 'oualata_description'),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  /// ⭐ MODERN PREMIUM CARD DESIGN
  Widget _modernCityCard({
    required BuildContext context,
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