import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Supported app languages.
/// 'ar' = Arabe (par défaut, RTL) — 'fr' = Français (LTR)
class LocaleProvider extends ChangeNotifier {
  static const String _prefsKey = 'app_language';

  String _language = 'ar';

  String get language => _language;

  bool get isArabic => _language == 'ar';

  Locale get locale => Locale(_language);

  TextDirection get textDirection =>
      _language == 'ar' ? TextDirection.rtl : TextDirection.ltr;

  LocaleProvider() {
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_prefsKey);
    if (saved == 'fr' || saved == 'ar') {
      _language = saved!;
      notifyListeners();
    }
  }

  Future<void> setLanguage(String language) async {
    if (_language == language) return;
    _language = language;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, language);
  }

  Future<void> toggleLanguage() async {
    await setLanguage(_language == 'ar' ? 'fr' : 'ar');
  }
}

/// Helper extension to fetch a translated string from a per-page
/// translation table: `{'key': {'ar': '...', 'fr': '...'}}`.
extension Translate on BuildContext {
  String tr(Map<String, Map<String, String>> table, String key) {
    final lang = read<LocaleProvider>().language;
    return table[key]?[lang] ?? key;
  }
}
