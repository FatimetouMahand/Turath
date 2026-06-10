class Destination {
  final String id;
  final String title;
  final String shortDescription;
  final String description;
  final String image;
  final List<String> gallery;
  final String category;
  final double rating;
  final int visits;
  final List<String> tags;
  final String city;
  final String region;
  final double latitude;
  final double longitude;
  final bool isPopular;
  final bool isDestinationOfMonth;

  Destination({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.image,
    required this.gallery,
    required this.category,
    required this.rating,
    required this.visits,
    required this.tags,
    required this.city,
    required this.region,
    required this.latitude,
    required this.longitude,
    this.isPopular = false,
    this.isDestinationOfMonth = false,
  });
}

final List<Destination> historicalSites = [
  Destination(
    id: 'chinguetti',
    title: 'شنقيط',
    shortDescription: 'مدينة تاريخية عريقة',
    description: 'مدينة تاريخية عريقة تشتهر بالعمارة التقليدية والمكتبات القديمة',
    image: 'assets/images/tourism/Chinguetti1.jpeg',
    gallery: ['assets/images/tourism/Chinguetti1.jpeg'],
    category: 'تاريخ',
    rating: 4.8,
    visits: 5230,
    tags: ['تاريخ', 'عمارة', 'ثقافة'],
    city: 'شنقيط',
    region: 'أدرار',
    latitude: 20.9619,
    longitude: -12.7519,
    isPopular: true,
    isDestinationOfMonth: true,
  ),
  Destination(
    id: 'ouadane',
    title: 'واودان',
    shortDescription: 'واحة صحراوية قديمة',
    description: 'واحة صحراوية تاريخية محاطة بالتلال الرملية الذهبية',
    image: 'assets/images/tourism/Ouadane1.jpeg',
    gallery: ['assets/images/tourism/Ouadane1.jpeg'],
    category: 'تاريخ',
    rating: 4.6,
    visits: 3890,
    tags: ['تاريخ', 'صحراء', 'طبيعة'],
    city: 'واودان',
    region: 'أدرار',
    latitude: 20.8083,
    longitude: -13.1517,
    isPopular: true,
  ),
];

final List<Destination> naturalWonders = [
  Destination(
    id: 'richat',
    title: 'عين الصحراء (ريتشات)',
    shortDescription: 'تكوين جيولوجي فريد',
    description: 'تكوين جيولوجي فريد يشبه عينا ترصدان السماء من الفضاء',
    image: 'assets/images/tourism/StructuredeRichat1.jpeg',
    gallery: ['assets/images/tourism/StructuredeRichat1.jpeg'],
    category: 'طبيعة',
    rating: 4.9,
    visits: 6120,
    tags: ['جيولوجيا', 'طبيعة', 'مغامرة'],
    city: 'أرقيز',
    region: 'أدرار',
    latitude: 21.2552,
    longitude: -11.3638,
    isPopular: true,
  ),
  Destination(
    id: 'terjit',
    title: 'واحة تجريت',
    shortDescription: 'واحة طبيعية خضراء',
    description: 'واحة طبيعية خضراء مع ينابيع مياه معدنية دافئة',
    image: 'assets/images/tourism/Terjit1.jpeg',
    gallery: ['assets/images/tourism/Terjit1.jpeg'],
    category: 'طبيعة',
    rating: 4.7,
    visits: 4560,
    tags: ['واحة', 'مياه', 'استرخاء'],
    city: 'عطار',
    region: 'أدرار',
    latitude: 20.5069,
    longitude: -13.1472,
  ),
];

final List<Destination> beaches = [
  Destination(
    id: 'nouakchott_beach',
    title: 'شاطئ نواكشوط',
    shortDescription: 'شاطئ رملي جميل',
    description: 'شاطئ رملي جميل يقع على ساحل المحيط الأطلسي',
    image: 'assets/images/tourism/PlagedeNouakchott1.jpeg',
    gallery: ['assets/images/tourism/PlagedeNouakchott1.jpeg'],
    category: 'شاطئ',
    rating: 4.4,
    visits: 7890,
    tags: ['شاطئ', 'بحر', 'استرخاء'],
    city: 'نواكشوط',
    region: 'نواكشوط',
    latitude: 18.0735,
    longitude: -15.9582,
  ),
  Destination(
    id: 'nouadhibou',
    title: 'نواذيبو',
    shortDescription: 'ميناء سياحي استراتيجي',
    description: 'ميناء سياحي استراتيجي مع منظر بحري خلاب',
    image: 'assets/images/tourism/Nouadhibou1.jpeg',
    gallery: ['assets/images/tourism/Nouadhibou1.jpeg'],
    category: 'شاطئ',
    rating: 4.5,
    visits: 5670,
    tags: ['ميناء', 'بحر', 'رحلات'],
    city: 'نواذيبو',
    region: 'ولاية داخلت نواادييبو',
    latitude: 20.9148,
    longitude: -17.0361,
    isPopular: true,
  ),
];

final List<Destination> hotels = [
  Destination(
    id: 'fasq_hotel',
    title: 'فندق فاسق - نواكشوط',
    shortDescription: 'فندق فاخر بمعايير عالمية',
    description: 'فندق فاخر بمعايير عالمية وخدمات متميزة',
    image: 'assets/images/tourism/FasqHotelNouakchott1.jpeg',
    gallery: ['assets/images/tourism/FasqHotelNouakchott1.jpeg'],
    category: 'فنادق',
    rating: 4.7,
    visits: 3450,
    tags: ['فندق', 'رفاهية', 'نواكشوط'],
    city: 'نواكشوط',
    region: 'نواكشوط',
    latitude: 18.0735,
    longitude: -15.9545,
  ),
  Destination(
    id: 'monotel',
    title: 'فندق مونوتيل',
    shortDescription: 'فندق عصري مع إطلالات',
    description: 'فندق عصري مع إطلالات بانورامية على العاصمة',
    image: 'assets/images/tourism/Monotel1.jpeg',
    gallery: ['assets/images/tourism/Monotel1.jpeg'],
    category: 'فنادق',
    rating: 4.6,
    visits: 2890,
    tags: ['فندق', 'حديث', 'نواكشوط'],
    city: 'نواكشوط',
    region: 'نواكشوط',
    latitude: 18.0745,
    longitude: -15.9560,
  ),
];

final List<Destination> restaurants = [
  Destination(
    id: 'dipndip',
    title: 'مطعم ديب أند ديب',
    shortDescription: 'مطعم فريد بتجربة حديثة',
    description: 'مطعم فريد يقدم تجربة طعام حديثة مع لمسات تقليدية',
    image: 'assets/images/tourism/dipndip1.jpeg',
    gallery: ['assets/images/tourism/dipndip1.jpeg'],
    category: 'مطاعم',
    rating: 4.5,
    visits: 2340,
    tags: ['طعام', 'حديث', 'تقليدي'],
    city: 'نواكشوط',
    region: 'نواكشوط',
    latitude: 18.0750,
    longitude: -15.9500,
  ),
  Destination(
    id: 'paul',
    title: 'مطعم بول',
    shortDescription: 'مطعم أوروبي راقي',
    description: 'مطعم أوروبي راقي يقدم أشهى الأطباق والمشروبات',
    image: 'assets/images/tourism/PAUL1.jpeg',
    gallery: ['assets/images/tourism/PAUL1.jpeg'],
    category: 'مطاعم',
    rating: 4.4,
    visits: 1980,
    tags: ['طعام', 'أوروبي', 'راقي'],
    city: 'نواكشوط',
    region: 'نواكشوط',
    latitude: 18.0740,
    longitude: -15.9480,
  ),
];
