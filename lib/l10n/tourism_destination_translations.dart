import '../models/destination_model.dart';

class TourismDestinationText {
  final String title;
  final String shortDescription;
  final String description;
  final String category;
  final String city;
  final String region;
  final List<String> tags;

  const TourismDestinationText({
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.category,
    required this.city,
    required this.region,
    required this.tags,
  });
}

const Map<String, Map<String, TourismDestinationText>>
tourismDestinationTexts = {
  'chinguetti': {
    'ar': TourismDestinationText(
      title: 'شنقيط',
      shortDescription: 'مدينة تاريخية عريقة',
      description:
          'مدينة تاريخية عريقة تشتهر بالعمارة التقليدية والمكتبات القديمة.',
      category: 'تاريخ',
      city: 'شنقيط',
      region: 'آدرار',
      tags: ['تاريخ', 'عمارة', 'ثقافة'],
    ),
    'fr': TourismDestinationText(
      title: 'Chinguetti',
      shortDescription: 'Ville historique ancienne',
      description:
          'Ville historique ancienne connue pour son architecture traditionnelle et ses bibliothèques anciennes.',
      category: 'Histoire',
      city: 'Chinguetti',
      region: 'Adrar',
      tags: ['Histoire', 'Architecture', 'Culture'],
    ),
  },
  'ouadane': {
    'ar': TourismDestinationText(
      title: 'وادان',
      shortDescription: 'واحة صحراوية قديمة',
      description: 'واحة صحراوية تاريخية محاطة بالتلال الرملية الذهبية.',
      category: 'تاريخ',
      city: 'وادان',
      region: 'آدرار',
      tags: ['تاريخ', 'صحراء', 'طبيعة'],
    ),
    'fr': TourismDestinationText(
      title: 'Ouadane',
      shortDescription: 'Ancienne oasis saharienne',
      description:
          'Oasis historique du désert entourée de dunes de sable doré.',
      category: 'Histoire',
      city: 'Ouadane',
      region: 'Adrar',
      tags: ['Histoire', 'Désert', 'Nature'],
    ),
  },
  'richat': {
    'ar': TourismDestinationText(
      title: 'عين الصحراء (ريشات)',
      shortDescription: 'تكوين جيولوجي فريد',
      description: 'تكوين جيولوجي فريد يشبه عينا ترصد السماء من الفضاء.',
      category: 'طبيعة',
      city: 'أرقيز',
      region: 'آدرار',
      tags: ['جيولوجيا', 'طبيعة', 'مغامرة'],
    ),
    'fr': TourismDestinationText(
      title: 'Structure de Richat',
      shortDescription: 'Formation géologique unique',
      description:
          'Formation géologique unique, visible depuis l’espace, souvent appelée l’œil du Sahara.',
      category: 'Nature',
      city: 'Arqiz',
      region: 'Adrar',
      tags: ['Géologie', 'Nature', 'Aventure'],
    ),
  },
  'terjit': {
    'ar': TourismDestinationText(
      title: 'واحة ترجيت',
      shortDescription: 'واحة طبيعية خضراء',
      description: 'واحة طبيعية خضراء مع ينابيع مياه معدنية دافئة.',
      category: 'طبيعة',
      city: 'أطار',
      region: 'آدرار',
      tags: ['واحة', 'مياه', 'استرخاء'],
    ),
    'fr': TourismDestinationText(
      title: 'Oasis de Terjit',
      shortDescription: 'Oasis naturelle verdoyante',
      description:
          'Oasis naturelle verdoyante avec des sources d’eau minérale chaude.',
      category: 'Nature',
      city: 'Atar',
      region: 'Adrar',
      tags: ['Oasis', 'Eau', 'Détente'],
    ),
  },
  'nouakchott_beach': {
    'ar': TourismDestinationText(
      title: 'شاطئ نواكشوط',
      shortDescription: 'شاطئ رملي جميل',
      description: 'شاطئ رملي جميل يقع على ساحل المحيط الأطلسي.',
      category: 'شاطئ',
      city: 'نواكشوط',
      region: 'نواكشوط',
      tags: ['شاطئ', 'بحر', 'استرخاء'],
    ),
    'fr': TourismDestinationText(
      title: 'Plage de Nouakchott',
      shortDescription: 'Belle plage de sable',
      description:
          'Belle plage de sable située sur la côte de l’océan Atlantique.',
      category: 'Plage',
      city: 'Nouakchott',
      region: 'Nouakchott',
      tags: ['Plage', 'Mer', 'Détente'],
    ),
  },
  'nouadhibou': {
    'ar': TourismDestinationText(
      title: 'نواذيبو',
      shortDescription: 'ميناء سياحي استراتيجي',
      description: 'ميناء سياحي استراتيجي مع منظر بحري خلاب.',
      category: 'شاطئ',
      city: 'نواذيبو',
      region: 'داخلة نواذيبو',
      tags: ['ميناء', 'بحر', 'رحلات'],
    ),
    'fr': TourismDestinationText(
      title: 'Nouadhibou',
      shortDescription: 'Port touristique stratégique',
      description:
          'Port touristique stratégique avec un beau paysage maritime.',
      category: 'Plage',
      city: 'Nouadhibou',
      region: 'Dakhlet Nouadhibou',
      tags: ['Port', 'Mer', 'Excursions'],
    ),
  },
  'fasq_hotel': {
    'ar': TourismDestinationText(
      title: 'فندق فاسق - نواكشوط',
      shortDescription: 'فندق فاخر بمعايير عالمية',
      description: 'فندق فاخر بمعايير عالمية وخدمات متميزة.',
      category: 'فنادق',
      city: 'نواكشوط',
      region: 'نواكشوط',
      tags: ['فندق', 'رفاهية', 'نواكشوط'],
    ),
    'fr': TourismDestinationText(
      title: 'Hôtel Fasq - Nouakchott',
      shortDescription: 'Hôtel luxueux aux standards internationaux',
      description:
          'Hôtel luxueux aux standards internationaux avec des services de qualité.',
      category: 'Hôtels',
      city: 'Nouakchott',
      region: 'Nouakchott',
      tags: ['Hôtel', 'Luxe', 'Nouakchott'],
    ),
  },
  'monotel': {
    'ar': TourismDestinationText(
      title: 'فندق مونوتيل',
      shortDescription: 'فندق عصري مع إطلالات',
      description: 'فندق عصري مع إطلالات بانورامية على العاصمة.',
      category: 'فنادق',
      city: 'نواكشوط',
      region: 'نواكشوط',
      tags: ['فندق', 'حديث', 'نواكشوط'],
    ),
    'fr': TourismDestinationText(
      title: 'Hôtel Monotel',
      shortDescription: 'Hôtel moderne avec vues panoramiques',
      description: 'Hôtel moderne avec des vues panoramiques sur la capitale.',
      category: 'Hôtels',
      city: 'Nouakchott',
      region: 'Nouakchott',
      tags: ['Hôtel', 'Moderne', 'Nouakchott'],
    ),
  },
  'dipndip': {
    'ar': TourismDestinationText(
      title: 'مطعم ديب أند ديب',
      shortDescription: 'مطعم فريد بتجربة حديثة',
      description: 'مطعم فريد يقدم تجربة طعام حديثة مع لمسات تقليدية.',
      category: 'مطاعم',
      city: 'نواكشوط',
      region: 'نواكشوط',
      tags: ['طعام', 'حديث', 'تقليدي'],
    ),
    'fr': TourismDestinationText(
      title: 'Restaurant Dip n Dip',
      shortDescription: 'Restaurant unique à l’expérience moderne',
      description:
          'Restaurant unique qui propose une expérience culinaire moderne avec des touches traditionnelles.',
      category: 'Restaurants',
      city: 'Nouakchott',
      region: 'Nouakchott',
      tags: ['Cuisine', 'Moderne', 'Traditionnel'],
    ),
  },
  'paul': {
    'ar': TourismDestinationText(
      title: 'مطعم بول',
      shortDescription: 'مطعم أوروبي راق',
      description: 'مطعم أوروبي راق يقدم أشهى الأطباق والمشروبات.',
      category: 'مطاعم',
      city: 'نواكشوط',
      region: 'نواكشوط',
      tags: ['طعام', 'أوروبي', 'راق'],
    ),
    'fr': TourismDestinationText(
      title: 'Restaurant Paul',
      shortDescription: 'Restaurant européen élégant',
      description:
          'Restaurant européen élégant proposant de délicieux plats et boissons.',
      category: 'Restaurants',
      city: 'Nouakchott',
      region: 'Nouakchott',
      tags: ['Cuisine', 'Européen', 'Élégant'],
    ),
  },
};

const Map<String, String> tourismDestinationIdsByImage = {
  'assets/images/tourism/Chinguetti1.jpeg': 'chinguetti',
  'assets/images/tourism/Ouadane1.jpeg': 'ouadane',
  'assets/images/tourism/StructuredeRichat1.jpeg': 'richat',
  'assets/images/tourism/Terjit1.jpeg': 'terjit',
  'assets/images/tourism/PlagedeNouakchott1.jpeg': 'nouakchott_beach',
  'assets/images/tourism/Nouadhibou1.jpeg': 'nouadhibou',
  'assets/images/tourism/FasqHotelNouakchott1.jpeg': 'fasq_hotel',
  'assets/images/tourism/Monotel1.jpeg': 'monotel',
  'assets/images/tourism/dipndip1.jpeg': 'dipndip',
  'assets/images/tourism/PAUL1.jpeg': 'paul',
};

TourismDestinationText tourismText(Destination destination, String language) {
  final text = tourismDestinationTexts[destination.id]?[language];
  if (text != null) return text;

  return TourismDestinationText(
    title: destination.title,
    shortDescription: destination.shortDescription,
    description: destination.description,
    category: destination.category,
    city: destination.city,
    region: destination.region,
    tags: destination.tags,
  );
}

TourismDestinationText? tourismTextByFavorite(
  String? tourismId,
  String image,
  String language,
) {
  final id = tourismId ?? tourismDestinationIdsByImage[image];
  if (id == null) return null;
  return tourismDestinationTexts[id]?[language];
}
