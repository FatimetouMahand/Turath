import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'patrimoine_page.dart';
import 'tourism_page.dart';
import 'splash_screen.dart';
import 'favorites_page.dart';
import 'culture_page.dart';
import 'l10n/locale_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => LocaleProvider(),
      child: const MyApp(),
    ),
  );
}

/// Tableau de traduction des textes de la page d'accueil.
const Map<String, Map<String, String>> mainStrings = {
  'welcome': {'ar': 'مرحباً', 'fr': 'Bienvenue'},
  'discover_mauritania': {
    'ar': 'اكتشف موريتانيا',
    'fr': 'Découvrir la Mauritanie',
  },
  'nav_home': {'ar': 'الرئيسية', 'fr': 'Accueil'},
  'nav_patrimoine': {'ar': 'التراث', 'fr': 'Patrimoine'},
  'nav_tourism': {'ar': 'السياحة', 'fr': 'Tourisme'},
  'nav_favorites': {'ar': 'المفضلة', 'fr': 'Favoris'},
  'nav_culture': {'ar': 'الثقافة', 'fr': 'Culture'},
  'search_hint': {'ar': 'ابحث عن الأماكن...', 'fr': 'Rechercher un lieu...'},
  'featured': {'ar': '✨ مميز', 'fr': '✨ Coup de cœur'},
  'hero_title': {
    'ar': 'رحلة عبر الصحراء\nالموريتانية',
    'fr': 'Un voyage à travers\nle désert mauritanien',
  },
  'hero_location': {'ar': 'شنقيط، موريتانيا', 'fr': 'Chinguetti, Mauritanie'},
  'discover': {'ar': 'اكتشف', 'fr': 'Découvrir'},
  'sections': {'ar': 'الأقسام', 'fr': 'Sections'},
  'see_all': {'ar': 'عرض الكل', 'fr': 'Voir tout'},
  'famous_places': {'ar': 'أماكن مشهورة', 'fr': 'Lieux célèbres'},
  'place_chinguetti': {'ar': 'شنقيط', 'fr': 'Chinguetti'},
  'place_ouadane': {'ar': 'وادان', 'fr': 'Ouadane'},
  'place_oualata': {'ar': 'ولاتة', 'fr': 'Oualata'},
  'place_tichitt': {'ar': 'تيشيت', 'fr': 'Tichitt'},
  'region_adrar': {'ar': 'ولاية آدرار', 'fr': 'Région de l’Adrar'},
  'region_hodh_chargui': {
    'ar': 'ولاية الحوض الشرقي',
    'fr': 'Région du Hodh Ech Chargui',
  },
  'region_tagant': {'ar': 'ولاية تكانت', 'fr': 'Région du Tagant'},
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LocaleProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Turath Mauritania",
      locale: locale.locale,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFFFF8F6),
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: locale.textDirection,
          child: child!,
        );
      },
      home: SplashScreen(),
    );
  }
}

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage>
    with TickerProviderStateMixin {
  int _currentIndex = 0;

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  // For staggered card animations
  late AnimationController _staggerController;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.15), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );

    _staggerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeController.forward();
    _slideController.forward();
    _staggerController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _staggerController.dispose();
    super.dispose();
  }

  void _onNavTap(int index) {
    if (index == _currentIndex) return;

    setState(() {
      _currentIndex = index;
    });

    if (index == 0) {
      _fadeController.reset();
      _slideController.reset();
      _staggerController.reset();
      _fadeController.forward();
      _slideController.forward();
      _staggerController.forward();
    }

    // Navigate to other pages
    if (index == 1) {
      Navigator.push(context, _createRoute(const PatrimoinePage())).then((_) {
        setState(() => _currentIndex = 0);
      });
    } else if (index == 2) {
      Navigator.push(context, _createRoute(const TourismPage())).then((_) {
        setState(() => _currentIndex = 0);
      });
    } else if (index == 3) {
      Navigator.push(context, _createRoute(const FavoritesPage())).then((_) {
        setState(() => _currentIndex = 0);
      });
    }
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;
        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
      transitionDuration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F6),
      extendBody: true,
      body: _buildHomeContent(context),
      bottomNavigationBar: _buildModernBottomNav(),
    );
  }

  // ─── MODERN BOTTOM NAV ──────────────────────────────────
  Widget _buildModernBottomNav() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF442A22).withValues(alpha: 0.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(
          color: const Color(0xFFF5DED7).withValues(alpha: 0.6),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(
                Icons.home_rounded,
                context.tr(mainStrings, 'nav_home'),
                0,
              ),
              _navItem(
                Icons.account_balance_rounded,
                context.tr(mainStrings, 'nav_patrimoine'),
                1,
              ),
              _navItem(
                Icons.explore_rounded,
                context.tr(mainStrings, 'nav_tourism'),
                2,
              ),
              _navItem(
                Icons.favorite_rounded,
                context.tr(mainStrings, 'nav_favorites'),
                3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    final isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () => _onNavTap(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 18 : 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: isSelected
              ? const LinearGradient(
                  colors: [Color(0xFF442A22), Color(0xFF5C3A30)],
                )
              : null,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFF442A22).withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : const Color(0xFF6B5B56),
              size: 22,
            ),
            if (isSelected) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // ─── HOME CONTENT ───────────────────────────────────────
  Widget _buildHomeContent(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Gradient App Bar
            SliverToBoxAdapter(child: _buildGradientHeader()),

            // Search bar
            SliverToBoxAdapter(child: _buildSearchBar()),

            // Hero banner
            SliverToBoxAdapter(child: _buildHeroBanner()),

            // Categories section
            SliverToBoxAdapter(child: _buildCategoriesSection(context)),

            // Famous places
            SliverToBoxAdapter(child: _buildFamousPlaces()),

            // Bottom padding for nav bar
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }

  // ─── GRADIENT HEADER ────────────────────────────────────
  Widget _buildGradientHeader() {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 15,
        left: 24,
        right: 24,
        bottom: 20,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFFF8F6), Color(0xFFFFF2ED)],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: Welcome text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFF5DED7),
                      ),
                      child: Row(
                        children: [
                          const Text("", style: TextStyle(fontSize: 14)),
                          const SizedBox(width: 4),
                          Text(
                            context.tr(mainStrings, 'welcome'),
                            style: const TextStyle(
                              color: Color(0xFF442A22),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  context.tr(mainStrings, 'discover_mauritania'),
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF442A22),
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Right: Language toggle + Avatar (stacked vertically to save width)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildLanguageToggle(),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFF5DED7),
                    width: 2.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF442A22).withValues(alpha: 0.12),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage("assets/images/sa7ra.jpeg"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─── LANGUAGE TOGGLE BUTTON ─────────────────────────────
  Widget _buildLanguageToggle() {
    final locale = context.watch<LocaleProvider>();
    return GestureDetector(
      onTap: () => context.read<LocaleProvider>().toggleLanguage(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFFF5DED7),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF442A22).withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.language_rounded,
              color: Color(0xFF442A22),
              size: 18,
            ),
            const SizedBox(width: 6),
            Text(
              locale.isArabic ? "FR" : "AR",
              style: const TextStyle(
                color: Color(0xFF442A22),
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── SEARCH BAR ─────────────────────────────────────────
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 5, 24, 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
          border: Border.all(color: const Color(0xFFF4ECEA)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF442A22).withValues(alpha: 0.06),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
      ),
    );
  }

  // ─── HERO BANNER ────────────────────────────────────────
  Widget _buildHeroBanner() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 28),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, _createRoute(const TourismPage()));
        },
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF442A22).withValues(alpha: 0.15),
                blurRadius: 25,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Background image
                Image.asset("assets/images/chinguetti.jpeg", fit: BoxFit.cover),

                // Gradient overlay
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.transparent,
                        const Color(0xFF442A22).withValues(alpha: 0.4),
                        const Color(0xFF442A22).withValues(alpha: 0.85),
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),

                // Content
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFF5DED7).withValues(alpha: 0.3),
                        ),
                        child: Text(
                          context.tr(mainStrings, 'featured'),
                          style: const TextStyle(
                            color: Color(0xFFF5DED7),
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        context.tr(mainStrings, 'hero_title'),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: const Color(
                              0xFFF5DED7,
                            ).withValues(alpha: 0.9),
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            context.tr(mainStrings, 'hero_location'),
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.8),
                              fontSize: 12,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: [Color(0xFFF5DED7), Color(0xFFE8C8B8)],
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  context.tr(mainStrings, 'discover'),
                                  style: const TextStyle(
                                    color: Color(0xFF442A22),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Color(0xFF442A22),
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ─── CATEGORIES ─────────────────────────────────────────
  Widget _buildCategoriesSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.tr(mainStrings, 'sections'),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF442A22),
                ),
              ),
              // Container(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(12),
              //     color: const Color(0xFFF5DED7),
              //   ),
              //   // child: Text(
              //   //   context.tr(mainStrings, 'see_all'),
              //   //   style: const TextStyle(
              //   //     color: Color(0xFF442A22),
              //   //     fontSize: 12,
              //   //     fontWeight: FontWeight.w500,
              //   //   ),
              //   // ),
              // ),
            ],
          ),
          const SizedBox(height: 18),

          // Categories grid
          Row(
            children: [
              Expanded(
                child: _buildStaggeredCategory(
                  icon: Icons.explore_rounded,
                  title: context.tr(mainStrings, 'nav_tourism'),
                  gradient: const [Color(0xFF442A22), Color(0xFF5C3A30)],
                  iconBgColor: const Color(0xFFF5DED7),
                  delay: 0,
                  onTap: () {
                    Navigator.push(context, _createRoute(const TourismPage()));
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStaggeredCategory(
                  icon: Icons.account_balance_rounded,
                  title: context.tr(mainStrings, 'nav_patrimoine'),
                  gradient: const [Color(0xFFF5DED7), Color(0xFFE8C8B8)],
                  iconBgColor: Colors.white,
                  textDark: true,
                  delay: 1,
                  onTap: () {
                    Navigator.push(
                      context,
                      _createRoute(const PatrimoinePage()),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildStaggeredCategory(
                  icon: Icons.favorite_rounded,
                  title: context.tr(mainStrings, 'nav_favorites'),
                  gradient: const [Color(0xFFF4ECEA), Color(0xFFE8DCD8)],
                  iconBgColor: Colors.white,
                  textDark: true,
                  delay: 2,
                  onTap: () {
                    Navigator.push(
                      context,
                      _createRoute(const FavoritesPage()),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStaggeredCategory(
                  icon: Icons.groups_rounded,
                  title: context.tr(mainStrings, 'nav_culture'),
                  gradient: const [Color(0xFF5C3A30), Color(0xFF442A22)],
                  iconBgColor: const Color(0xFFF5DED7),
                  delay: 3,
                  onTap: () {
                    Navigator.push(context, _createRoute(const CulturePage()));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStaggeredCategory({
    required IconData icon,
    required String title,
    required List<Color> gradient,
    required Color iconBgColor,
    required int delay,
    required VoidCallback onTap,
    bool textDark = false,
  }) {
    final animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _staggerController,
        curve: Interval(
          delay * 0.15,
          0.5 + delay * 0.15,
          curve: Curves.easeOutCubic,
        ),
      ),
    );

    final contentColor = textDark ? const Color(0xFF442A22) : Colors.white;

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - animation.value)),
          child: Opacity(opacity: animation.value, child: child),
        );
      },
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 105,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradient,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF442A22).withValues(alpha: 0.1),
                blurRadius: 15,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Decorative circle
              Positioned(
                top: -15,
                right: -15,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: textDark
                        ? const Color(0xFF442A22).withValues(alpha: 0.06)
                        : Colors.white.withValues(alpha: 0.1),
                  ),
                ),
              ),
              // Content
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: iconBgColor,
                      ),
                      child: Icon(
                        icon,
                        size: 28,
                        color: const Color(0xFF442A22),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: contentColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─── FAMOUS PLACES ──────────────────────────────────────
  Widget _buildFamousPlaces() {
    final places = [
      {
        "name": context.tr(mainStrings, 'place_chinguetti'),
        "image": "assets/images/chinguetti.jpeg",
        "location": context.tr(mainStrings, 'region_adrar'),
        "rating": "4.8",
      },
      {
        "name": context.tr(mainStrings, 'place_ouadane'),
        "image": "assets/images/Ouadane.jpeg",
        "location": context.tr(mainStrings, 'region_adrar'),
        "rating": "4.6",
      },
      {
        "name": context.tr(mainStrings, 'place_oualata'),
        "image": "assets/images/Oualata.jpeg",
        "location": context.tr(mainStrings, 'region_hodh_chargui'),
        "rating": "4.7",
      },
      {
        "name": context.tr(mainStrings, 'place_tichitt'),
        "image": "assets/images/Tichitt.jpeg",
        "location": context.tr(mainStrings, 'region_tagant'),
        "rating": "4.5",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.tr(mainStrings, 'famous_places'),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF442A22),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, _createRoute(const TourismPage()));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFFF5DED7),
                  ),
                  child: Text(
                    context.tr(mainStrings, 'see_all'),
                    style: const TextStyle(
                      color: Color(0xFF442A22),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            physics: const BouncingScrollPhysics(),
            itemCount: places.length,
            itemBuilder: (context, index) {
              final place = places[index];
              return _buildPlaceCard(
                name: place["name"]!,
                image: place["image"]!,
                location: place["location"]!,
                rating: place["rating"]!,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceCard({
    required String name,
    required String image,
    required String location,
    required String rating,
  }) {
    return Container(
      width: 175,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF442A22).withValues(alpha: 0.12),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Image
            Image.asset(image, fit: BoxFit.cover),

            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    const Color(0xFF442A22).withValues(alpha: 0.7),
                    const Color(0xFF442A22).withValues(alpha: 0.95),
                  ],
                  stops: const [0.0, 0.35, 0.7, 1.0],
                ),
              ),
            ),

            // Rating badge
            Positioned(
              top: 12,
              left: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withValues(alpha: 0.9),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF442A22).withValues(alpha: 0.1),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Color(0xFFFFB800),
                      size: 14,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      rating,
                      style: const TextStyle(
                        color: Color(0xFF442A22),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bookmark icon
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.9),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF442A22).withValues(alpha: 0.1),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.bookmark_border_rounded,
                  color: Color(0xFF442A22),
                  size: 16,
                ),
              ),
            ),

            // Bottom text
            Positioned(
              bottom: 16,
              left: 14,
              right: 14,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: const Color(0xFFF5DED7).withValues(alpha: 0.9),
                        size: 12,
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          location,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.7),
                            fontSize: 11,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
