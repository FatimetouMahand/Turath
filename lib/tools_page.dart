
import 'dart:async';
import 'package:flutter/material.dart';
import 'models/favorite_model.dart';
import 'widgets/favorite_button.dart';
import 'l10n/locale_provider.dart';

/// Tableau de traduction des textes de la page des outils.
const Map<String, Map<String, String>> toolsStrings = {
  'old_tools_title': {'ar': 'الأدوات الفنية القديمة', 'fr': 'Anciens outils traditionnels'},
  'kitchen_tools_title': {'ar': '🍽️ أدوات المطبخ', 'fr': '🍽️ Ustensiles de cuisine'},
  'kitchen_tools_desc': {
    'ar': 'الأدوات التقليدية في الطبخ مثل القدور الفخارية والملاعق الخشبية.',
    'fr': 'Les ustensiles traditionnels de cuisine comme les marmites en argile et les cuillères en bois.'
  },
  'wooden_spoons': {'ar': 'الملاعق الخشبية', 'fr': 'Les cuillères en bois'},
  'clay_pots': {'ar': 'القدور الفخارية', 'fr': 'Les marmites en argile'},
  'smoking_tools_title': {'ar': '🚬 أدوات التدخين', 'fr': '🚬 Outils de fumage'},
  'smoking_tools_desc': {
    'ar': 'الغليون والأدوات القديمة المستخدمة في التدخين التقليدي.',
    'fr': 'La pipe et les anciens outils utilisés pour le fumage traditionnel.'
  },
  'traditional_pipe': {'ar': 'الغليون التقليدي', 'fr': 'La pipe traditionnelle'},
  'smoking_tools': {'ar': 'أدوات التدخين', 'fr': 'Outils de fumage'},
  'travel_tools_title': {'ar': '🐪 أدوات السفر', 'fr': '🐪 Outils de voyage'},
  'travel_tools_desc': {
    'ar': 'وسائل السفر في الصحراء مثل الجمال والحقائب الجلدية.',
    'fr': 'Les moyens de transport dans le désert comme les chameaux et les sacs en cuir.'
  },
  'desert_journey': {'ar': 'الرحلة الصحراوية', 'fr': 'Le voyage à travers le désert'},
  'travel_bags': {'ar': 'حقائب السفر', 'fr': 'Les sacs de voyage'},
  'housing_tools_title': {'ar': '🏠 أدوات المسكن', 'fr': '🏠 Outils de l\'habitat'},
  'housing_tools_desc': {
    'ar': 'كان السكن الموريتاني قديماً عبارة عن خيمة واحدة (بيت الشعر)، '
        'يجتمع فيها جميع أفراد العائلة مع حاجياتهم الأساسية، رغم بساطتها وقلة أدواتها في ذلك الزمن.\n\n'
        'وكانت الحياة داخل الخيمة تعتمد على التنظيم البسيط للأغراض، '
        'حيث تُستعمل بعض الأدوات التقليدية للمساعدة في ترتيب وحفظ الحاجيات مثل السلال والحصائر والأكياس الجلدية.',
    'fr': 'Autrefois, l\'habitat mauritanien consistait en une seule tente (la tente de poils), '
        'où se réunissaient tous les membres de la famille avec leurs besoins essentiels, malgré sa simplicité et le peu d\'outils de cette époque.\n\n'
        'La vie à l\'intérieur de la tente reposait sur une organisation simple des objets, '
        'où certains outils traditionnels étaient utilisés pour aider à ranger et conserver les affaires comme les paniers, les nattes et les sacs en cuir.'
  },
  'traditional_tent': {'ar': 'الخيمة التقليدية', 'fr': 'La tente traditionnelle'},
  'housing_tools': {'ar': 'أدوات المسكن', 'fr': 'Outils de l\'habitat'},
  'tea_tools_title': {'ar': '🍵  أدوات الشاي ', 'fr': '🍵 Outils du thé'},
  'tea_tools_desc': {
    'ar': '،يُعتبر الشاي (أتاي) جزءاً لا يتجزأ من الحياة اليومية لكل موريتاني '
        '.وكان قديماً خاصاً بالرجال فقط، لكن مع مرور الوقت أصبح يشربه الجميع\n\n'
        ':توجد له مصطلحات تقليدية خاصة، منها\n'
        '.التعمار: وهي أول خطوة، وتتمثل في وضع براد يحتوي على الماء وأوراق الشاي على النار حتى الغليان\n\n'
        '.بعد ذلك يُنقل الشاي إلى براد آخر، ويُضاف إليه السكر ثم يُسكب في كؤوس صغيرة\n\n'
        '.كما توجد مرحلة تُسمى التلقيم، وتعني إضافة المزيد من أوراق الشاي بعد المرحلة الأولى',
    'fr': 'Le thé (Atay) est une partie intégrante de la vie quotidienne de chaque Mauritanien. '
        'Autrefois réservé aux hommes uniquement, il est désormais consommé par tout le monde.\n\n'
        'Il possède des termes traditionnels spécifiques, parmi lesquels :\n'
        'L\'« At\'amar » : c\'est la première étape, qui consiste à mettre une théière contenant de l\'eau et des feuilles de thé sur le feu jusqu\'à ébullition.\n\n'
        'Ensuite, le thé est transvasé dans une autre théière, du sucre y est ajouté, puis il est versé dans de petits verres.\n\n'
        'Il existe également une étape appelée « At-talqim », qui consiste à ajouter davantage de feuilles de thé après la première étape.'
  },
  'teapot': {'ar': 'البراد', 'fr': 'La théière'},
  'tea_session': {'ar': 'جلسة الشاي', 'fr': 'La séance de thé'},
  'atay': {'ar': 'إتاي', 'fr': 'Atay'},
  'drinking_tools_title': {'ar': ' أدوات الشرب (الشنين)', 'fr': 'Outils de boisson (Chnine)'},
  'drinking_tools_desc': {
    'ar': '،تُستعمل الكدحة قديماً في تقديم شراب الشنين التقليدي '
        '.وهو مشروب يُحضَّر من حليب الحيوانات مثل البقر والإبل والغنم\n\n'
        '.يتم تحضير الشنين عبر عملية الترويب والتخمير، مما يمنحه نكهة مميزة وقواماً خاصاً\n\n'
        '.ويُحضَّر باستعمال الشكوة، ثم يُقدَّم بواسطة الكدحة في الجلسات التقليدية',
    'fr': 'La « Kadha » était autrefois utilisée pour servir la boisson traditionnelle du Chnine, '
        'une boisson préparée à partir du lait d\'animaux comme les vaches, les chameaux et les moutons.\n\n'
        'Le Chnine est préparé par un processus de fermentation, ce qui lui donne une saveur et une texture particulières.\n\n'
        'Il est préparé à l\'aide de la « Chekoua », puis servi avec la « Kadha » lors des séances traditionnelles.'
  },
  'chnine': {'ar': 'الشنين', 'fr': 'Le Chnine'},
  'chekoua': {'ar': 'الشكوة', 'fr': 'La Chekoua'},
  'kadha': {'ar': 'الكدحة', 'fr': 'La Kadha'},
  'music_instruments_title': {'ar': ' آلات الغناء الموريتاني', 'fr': 'Instruments de musique mauritaniens'},
  'music_instruments_desc': {
    'ar': 'تُعتبر الآلات الموسيقية التقليدية جزءاً مهماً من التراث الموريتاني، '
        'وتُستعمل في الغناء والشعر والمناسبات الاجتماعية، '
        'ومن أبرزها الآردين والتيدينيت والطبل، التي تعكس هوية الثقافة البدوية.',
    'fr': 'Les instruments de musique traditionnels constituent une partie importante du patrimoine mauritanien, '
        'utilisés dans le chant, la poésie et les événements sociaux. '
        'Parmi les plus remarquables figurent l\'Ardine, le Tidinit et le tambour, qui reflètent l\'identité de la culture bédouine.'
  },
  'ardine': {'ar': 'الآردين', 'fr': 'L\'Ardine'},
  'tidinit': {'ar': 'التيدينيت', 'fr': 'Le Tidinit'},
  'drum': {'ar': 'الطبل', 'fr': 'Le tambour'},
  'neyvare': {'ar': 'النيفارة', 'fr': 'La Neyvara'},
};

class OldToolsPage extends StatelessWidget {
  const OldToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr(toolsStrings, 'old_tools_title')),
        backgroundColor: const Color(0xFFFFF8F6),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [

          buildCard(
            context,
            title: context.tr(toolsStrings, 'kitchen_tools_title'),
            description: context.tr(toolsStrings, 'kitchen_tools_desc'),
            images: [
              ImageItem("assets/images/lgchayche.jpg", context.tr(toolsStrings, 'wooden_spoons')),
              ImageItem("assets/images/lvekhar.jpg", context.tr(toolsStrings, 'clay_pots')),
            ],
          ),

          buildCard(
            context,
            title: context.tr(toolsStrings, 'smoking_tools_title'),
            description: context.tr(toolsStrings, 'smoking_tools_desc'),
            images: [
              ImageItem("assets/images/smoking2.jpg", context.tr(toolsStrings, 'traditional_pipe')),
              ImageItem("assets/images/smmoking.jpeg", context.tr(toolsStrings, 'smoking_tools')),
            ],
          ),

          buildCard(
            context,
            title: context.tr(toolsStrings, 'travel_tools_title'),
            description: context.tr(toolsStrings, 'travel_tools_desc'),
            images: [
              ImageItem("assets/images/ra7le.png", context.tr(toolsStrings, 'desert_journey')),
              ImageItem("assets/images/refade2.jpg", context.tr(toolsStrings, 'travel_bags')),
            ],
          ),

          buildCard(
            context,
            title: context.tr(toolsStrings, 'housing_tools_title'),
            description: context.tr(toolsStrings, 'housing_tools_desc'),
            images: [
              ImageItem("assets/images/seken.jpg", context.tr(toolsStrings, 'traditional_tent')),
              ImageItem("assets/images/seken2.jpg", context.tr(toolsStrings, 'housing_tools')),
              ImageItem("assets/images/refad.jpg", context.tr(toolsStrings, 'housing_tools')),
            ],
          ),

          buildCard(
            context,
            title: context.tr(toolsStrings, 'tea_tools_title'),
            description: context.tr(toolsStrings, 'tea_tools_desc'),
            images: [
              ImageItem("assets/images/lberade.jpeg", context.tr(toolsStrings, 'teapot')),
              ImageItem("assets/images/jma3e.jpg", context.tr(toolsStrings, 'tea_session')),
              ImageItem("assets/images/etaye.jpg", context.tr(toolsStrings, 'atay')),
            ],
          ),
          // CARD SHAY + SHNIN + SHAKWA
          buildCard(
            context,
            title: context.tr(toolsStrings, 'drinking_tools_title'),
            description: context.tr(toolsStrings, 'drinking_tools_desc'),
            images: [
              ImageItem("assets/images/chenine.png", context.tr(toolsStrings, 'chnine')),
              ImageItem("assets/images/chikwa.png", context.tr(toolsStrings, 'chekoua')),
              ImageItem("assets/images/zrig1.jpeg", context.tr(toolsStrings, 'kadha')),
            ],
          ),


          buildCard(
            context,
            title: context.tr(toolsStrings, 'music_instruments_title'),
            description: context.tr(toolsStrings, 'music_instruments_desc'),
            images: [
              ImageItem("assets/images/garmie.png", context.tr(toolsStrings, 'ardine')),
              ImageItem("assets/images/erdine.jpg", context.tr(toolsStrings, 'tidinit')),
              ImageItem("assets/images/tbale.jpg", context.tr(toolsStrings, 'drum')),
              ImageItem("assets/images/neyvare.png", context.tr(toolsStrings, 'neyvare')),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCard(
    BuildContext context, {
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
