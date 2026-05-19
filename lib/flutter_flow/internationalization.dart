import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
    String? hiText = '',
  }) =>
      [enText, arText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Main
  {
    'bfv4s7jo': {
      'en': 'Operations Hub',
      'ar': '',
      'hi': '',
    },
    'dess6j2u': {
      'en': 'Main Warehouse',
      'ar': '',
      'hi': '',
    },
    '485551ah': {
      'en': 'Search...',
      'ar': '',
      'hi': '',
    },
    'v36nhibv': {
      'en': 'Option 1',
      'ar': '',
      'hi': '',
    },
    'oek8r82a': {
      'en': 'Option 2',
      'ar': '',
      'hi': '',
    },
    'fu9aivwj': {
      'en': 'Option 3',
      'ar': '',
      'hi': '',
    },
    'y87k8f59': {
      'en': 'Active Shipments',
      'ar': '',
      'hi': '',
    },
    'ryc54lh6': {
      'en': '24',
      'ar': '',
      'hi': '',
    },
    '92m5m170': {
      'en': 'in progress',
      'ar': '',
      'hi': '',
    },
    'rp7artn0': {
      'en': 'Temperature Alerts',
      'ar': '',
      'hi': '',
    },
    'gfersv1q': {
      'en': '2',
      'ar': '',
      'hi': '',
    },
    'rtzjgjwx': {
      'en': 'Requires Attention',
      'ar': '',
      'hi': '',
    },
    'y8uh4shk': {
      'en': 'Devices Connected',
      'ar': '',
      'hi': '',
    },
    'o6kc7zd2': {
      'en': '18',
      'ar': '',
      'hi': '',
    },
    'j2yzqr3s': {
      'en': 'All Online',
      'ar': '',
      'hi': '',
    },
    'eyt4t0el': {
      'en': 'Quick Actions',
      'ar': '',
      'hi': '',
    },
    'j1fnog0k': {
      'en': 'Status Update',
      'ar': 'تحديث الحالة',
      'hi': 'स्थिति अपडेट',
    },
    'adhgizyq': {
      'en': 'Inbound ',
      'ar': 'وارد',
      'hi': 'भीतर का',
    },
    'a2ljnrdl': {
      'en': 'Outbound ',
      'ar': 'الصادر',
      'hi': 'आउटबाउंड',
    },
    'nd0wbiii': {
      'en': 'Pack & Unpack',
      'ar': 'التعبئة وفك التعبئة',
      'hi': 'पैक और अनपैक',
    },
    'w4vxk7v1': {
      'en': 'Distributor Operations',
      'ar': 'إيقاف التشغيل',
      'hi': 'विमुद्रीकरण',
    },
  },
  // StatusUpdate
  {
    'yxawa3vr': {
      'en': 'Sample',
      'ar': 'عينة',
      'hi': 'नमूना',
    },
    'tit54kkt': {
      'en': 'Update sample status',
      'ar': 'تحديث حالة العينة',
      'hi': 'नमूना स्थिति अपडेट करें',
    },
    'me39jogw': {
      'en': 'Lost',
      'ar': 'ضائع',
      'hi': 'खो गया',
    },
    'he1rfd63': {
      'en': 'Report lost items',
      'ar': 'الإبلاغ عن العناصر المفقودة',
      'hi': 'खोई हुई वस्तुओं की रिपोर्ट करें',
    },
    '00cistop': {
      'en': 'Stolen',
      'ar': 'مسروقة',
      'hi': 'चुराया हुआ',
    },
    '4jgmzgg2': {
      'en': 'Report stolen items',
      'ar': 'الإبلاغ عن العناصر المسروقة',
      'hi': 'चोरी की वस्तुओं की रिपोर्ट करें',
    },
    'vkp2zlfj': {
      'en': 'Damaged',
      'ar': 'متضرر',
      'hi': 'क्षतिग्रस्त',
    },
    'qkax7sui': {
      'en': 'Report damaged items',
      'ar': 'الإبلاغ عن العناصر التالفة',
      'hi': 'क्षतिग्रस्त वस्तुओं की रिपोर्ट करें',
    },
    'mwcwwf24': {
      'en': 'Destruction',
      'ar': 'متضرر',
      'hi': 'क्षतिग्रस्त',
    },
    '34kzap8n': {
      'en': 'Report destroyed products.',
      'ar': 'الإبلاغ عن العناصر التالفة',
      'hi': 'क्षतिग्रस्त वस्तुओं की रिपोर्ट करें',
    },
    '5qks3f37': {
      'en': 'Status Update',
      'ar': 'إيقاف التشغيل',
      'hi': 'विमुद्रीकरण',
    },
  },
  // InboundMovement
  {
    'therwdmk': {
      'en': 'Receiving',
      'ar': 'استلام',
      'hi': 'प्राप्त',
    },
    '3kqcpbfo': {
      'en': 'Receive shipments from \nMAH or other distributors',
      'ar': 'استلام الشحنات من MAH أو الموزعين الآخرين',
      'hi': 'MAH या अन्य वितरकों से शिपमेंट प्राप्त करें',
    },
    'deeqyzqd': {
      'en': 'Return Receiving',
      'ar': 'عودة الاستلام',
      'hi': 'वापसी प्राप्ति',
    },
    '2um5iolq': {
      'en': 'Process and receive returned\n products from customers',
      'ar': 'معالجة واستلام المنتجات المرتجعة من العملاء',
      'hi': 'ग्राहकों से लौटाए गए उत्पादों को संसाधित करना और प्राप्त करना',
    },
    'vwtt27b1': {
      'en': 'Inbound Movement',
      'ar': '',
      'hi': '',
    },
    'jd7wlxnv': {
      'en': '',
      'ar': '',
      'hi': '',
    },
  },
  // OutboundMovement
  {
    '8j0347h6': {
      'en': 'Orders',
      'ar': 'طلبات',
      'hi': 'आदेश',
    },
    'so8n0t8t': {
      'en': 'Send shipments to customers ',
      'ar': 'إرسال الشحنات إلى الموزعين أو الموزعين الآخرين',
      'hi': 'डिस्पेंसर या अन्य वितरकों को शिपमेंट भेजें',
    },
    'nvyfes9c': {
      'en': 'Shipping',
      'ar': 'شحن',
      'hi': 'शिपिंग',
    },
    'cnmmn3h8': {
      'en': 'Send shipments to customers ',
      'ar': 'إرسال الشحنات إلى الموزعين أو الموزعين الآخرين',
      'hi': 'डिस्पेंसर या अन्य वितरकों को शिपमेंट भेजें',
    },
    'tgwxkmeb': {
      'en': 'Return Shipping',
      'ar': 'إعادة الشحن',
      'hi': 'वापसी शिपिंग',
    },
    'hef5xplp': {
      'en': 'Return products back to MAH \nor supplier',
      'ar': 'إرجاع المنتجات إلى صاحب حق الملكية أو المورد',
      'hi': 'उत्पादों को MAH या आपूर्तिकर्ता को वापस लौटाएँ',
    },
    'j1u0dx3m': {
      'en': 'Outbound Movement',
      'ar': '',
      'hi': '',
    },
    'd708tg0a': {
      'en': 'ooo',
      'ar': 'أوو',
      'hi': 'ओओओ',
    },
  },
  // PackAndRepack
  {
    'jcl7m6mo': {
      'en': 'Pack',
      'ar': 'علية',
      'hi': 'सामान बाँधना',
    },
    '92lcbhna': {
      'en': 'Group items into a new SSCC',
      'ar': 'تجميع العناصر في SSCC جديد',
      'hi': 'आइटमों को एक नए SSCC में समूहित करें',
    },
    'esypf7v6': {
      'en': 'Unpack',
      'ar': 'فك الحزمة',
      'hi': 'खोलना',
    },
    'hf8jdwec': {
      'en': 'Remove items from an SSCC',
      'ar': 'إزالة العناصر من SSCC',
      'hi': 'SSCC से आइटम हटाएँ',
    },
    'rc8egr35': {
      'en': 'Unpack All',
      'ar': 'فك كل شيء',
      'hi': 'सभी को अनपैक करें',
    },
    'jm3u0bsc': {
      'en': 'Disassemble the entire SSCC',
      'ar': 'تفكيك SSCC بأكمله',
      'hi': 'संपूर्ण एसएससीसी को अलग करें',
    },
    '9ndqj7tm': {
      'en': 'Pack & Repack',
      'ar': '',
      'hi': '',
    },
  },
  // UnpackAll
  {
    'v5cr596z': {
      'en': 'Scan or Enter SSCC',
      'ar': 'مسح أو إدخال SSCC',
      'hi': 'SSCC स्कैन करें या दर्ज करें',
    },
    'lez93474': {
      'en': 'Enter SSCC manually',
      'ar': 'أدخل SSCC يدويًا',
      'hi': 'SSCC को मैन्युअल रूप से दर्ज करें',
    },
    'a3uhrh4u': {
      'en': 'Scan SSCC',
      'ar': 'مسح SSCC',
      'hi': 'एसएससीसी स्कैन करें',
    },
    'fllxlbte': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'hi': 'रद्द करना',
    },
    'u9rytyey': {
      'en': 'SSCC: ',
      'ar': 'إس إس سي سي:',
      'hi': 'एसएससीसी:',
    },
    'o8sbtdep': {
      'en': 'Unpack All',
      'ar': 'فك كل شيء',
      'hi': 'सभी को अनपैक करें',
    },
    's04wfewf': {
      'en': 'Disassemble all items in this SSCC',
      'ar': 'تفكيك جميع العناصر الموجودة في هذا SSCC',
      'hi': 'इस एसएससीसी में सभी वस्तुओं को अलग करें',
    },
    'mg4gk7q4': {
      'en': 'Confirm Unpack All',
      'ar': 'تأكيد فك كل شيء',
      'hi': 'सभी अनपैक की पुष्टि करें',
    },
    '0jhqafl2': {
      'en': 'UnPack All',
      'ar': '',
      'hi': '',
    },
  },
  // PackagesList
  {
    'uukv59ly': {
      'en': 'Packages List',
      'ar': '',
      'hi': '',
    },
  },
  // PackageOperation
  {
    'yu0f6bmp': {
      'en': 'Pack Process',
      'ar': '',
      'hi': '',
    },
  },
  // CasePacking
  {
    'h5mfme4l': {
      'en': 'Home',
      'ar': 'بيت',
      'hi': 'घर',
    },
  },
  // ReceivePage
  {
    '6f75ego2': {
      'en': 'Scan SSCC',
      'ar': 'مسح الشحنة',
      'hi': 'शिपमेंट स्कैन करें',
    },
    'py4acxlu': {
      'en': 'Cancel',
      'ar': '',
      'hi': '',
    },
    'np2bh3pb': {
      'en': 'Products',
      'ar': 'منتجات',
      'hi': 'उत्पादों',
    },
    'pz6lm8qe': {
      'en': 'Confirm Receive',
      'ar': 'تأكيد الاستلام',
      'hi': 'प्राप्ति की पुष्टि करें',
    },
    'iem8iuzh': {
      'en': 'Return Receive',
      'ar': 'تأكيد الاستلام',
      'hi': 'प्राप्ति की पुष्टि करें',
    },
    'inu0b5h5': {
      'en': 'Shipment Receive ',
      'ar': '',
      'hi': '',
    },
  },
  // Decommission
  {
    'cweqv774': {
      'en': 'Scan Items',
      'ar': 'مسح العناصر',
      'hi': 'आइटम स्कैन करें',
    },
    'rs183xie': {
      'en': 'Scan or enter Serial/SSCC',
      'ar': 'امسح ضوئيًا أو أدخل الرقم التسلسلي/SSCC',
      'hi': 'स्कैन करें या सीरियल/SSCC दर्ज करें',
    },
    'h4h88lf5': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'hi': 'रद्द करना',
    },
    'f3xctpx5': {
      'en': 'Scanned Items',
      'ar': 'العناصر الممسوحة ضوئيًا',
      'hi': 'स्कैन की गई वस्तुएँ',
    },
    'wqfgb2al': {
      'en': 'Confirm Decommission',
      'ar': 'تأكيد إيقاف التشغيل',
      'hi': 'डीकमीशन की पुष्टि करें',
    },
  },
  // OrdersList
  {
    'parl21z3': {
      'en': 'Order List',
      'ar': '',
      'hi': '',
    },
  },
  // OrderDetails
  {
    'x6t89l97': {
      'en': 'Order #:',
      'ar': 'طلب #:',
      'hi': 'आदेश #:',
    },
    'avzjbz8h': {
      'en': 'Customer:',
      'ar': 'عميل:',
      'hi': 'ग्राहक:',
    },
    'faol2lwx': {
      'en': 'Destination GLN:',
      'ar': 'الوجهة GLN:',
      'hi': 'गंतव्य जीएलएन:',
    },
    '9ofmr6g1': {
      'en': 'Date:',
      'ar': 'تاريخ:',
      'hi': 'तारीख:',
    },
    'x0ojgjap': {
      'en': '2025-09-04',
      'ar': '2025-09-03T21:00:00Z',
      'hi': '2025-09-03T21:00:00Z',
    },
    'eqrvdf86': {
      'en': 'Order SSCC:',
      'ar': 'طلب SSCC:',
      'hi': 'एसएससीसी का आदेश:',
    },
    'zfgk1rrz': {
      'en': 'Products in Order',
      'ar': 'المنتجات بالترتيب',
      'hi': 'क्रम में उत्पाद',
    },
  },
  // ProductDetails
  {
    'hm9wo4ix': {
      'en': 'Scanned Codes',
      'ar': 'الرموز الممسوحة ضوئيًا',
      'hi': 'स्कैन किए गए कोड',
    },
    'fec4gw24': {
      'en': 'Confirm',
      'ar': 'يتأكد',
      'hi': 'पुष्टि करना',
    },
    '7keun6vr': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'hi': 'रद्द करना',
    },
    'eb5ppw2s': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'hi': 'रद्द करना',
    },
  },
  // Shipping
  {
    '4uexpybx': {
      'en': 'Select and Scan SSCC To Validate ',
      'ar': 'حدد وامسح SSCC للتحقق',
      'hi': 'सत्यापन के लिए SSCC का चयन करें और स्कैन करें',
    },
    'x7zyp85l': {
      'en': 'Select Order',
      'ar': 'حدد الطلب',
      'hi': 'आदेश चुनें',
    },
    'uxxqlwj0': {
      'en': 'Search',
      'ar': 'يبحث',
      'hi': 'खोज',
    },
    '2164bcoo': {
      'en': 'Order #12345 - Pharmacy A',
      'ar': 'الطلب رقم 12345 - الصيدلية أ',
      'hi': 'आदेश #12345 - फार्मेसी A',
    },
    '5qy03shy': {
      'en': 'Order #12346 - Pharmacy B',
      'ar': 'الطلب رقم 12346 - صيدلية ب',
      'hi': 'आदेश #12346 - फ़ार्मेसी B',
    },
    '6d9ap30f': {
      'en': 'Order #12347 - Pharmacy C',
      'ar': 'الطلب رقم 12347 - صيدلية ج',
      'hi': 'आदेश #12347 - फार्मेसी C',
    },
    'be9j5myc': {
      'en': 'Order #:',
      'ar': 'طلب #:',
      'hi': 'आदेश #:',
    },
    'xzadtsdm': {
      'en': 'Customer:',
      'ar': 'عميل:',
      'hi': 'ग्राहक:',
    },
    '81810qca': {
      'en': 'Destination GLN:',
      'ar': 'الوجهة GLN:',
      'hi': 'गंतव्य जीएलएन:',
    },
    'q2bx63nz': {
      'en': 'Date:',
      'ar': 'تاريخ:',
      'hi': 'तारीख:',
    },
    'ob4j9cq1': {
      'en': '2025-09-04',
      'ar': '2025-09-03T21:00:00Z',
      'hi': '2025-09-03T21:00:00Z',
    },
    'uzf7pu17': {
      'en': 'Order SSCC:',
      'ar': 'طلب SSCC:',
      'hi': 'एसएससीसी का आदेश:',
    },
    'q64hzvjl': {
      'en': 'Products in Order',
      'ar': 'المنتجات بالترتيب',
      'hi': 'क्रम में उत्पाद',
    },
    'ifm652gj': {
      'en': 'Confirm Shipping',
      'ar': 'تأكيد الشحن',
      'hi': 'शिपिंग की पुष्टि करें',
    },
    '7bnjiup6': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'hi': 'रद्द करना',
    },
    '9r34yklr': {
      'en': 'Confirm Shipping',
      'ar': '',
      'hi': '',
    },
  },
  // SampleDecommission
  {
    'tcklpsdr': {
      'en': 'Scan Items',
      'ar': 'مسح العناصر',
      'hi': 'आइटम स्कैन करें',
    },
    'htchxdh3': {
      'en': 'Scan or enter Serial/SSCC',
      'ar': 'امسح ضوئيًا أو أدخل الرقم التسلسلي/SSCC',
      'hi': 'स्कैन करें या सीरियल/SSCC दर्ज करें',
    },
    'nrg78dy1': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'hi': 'रद्द करना',
    },
    'm7744z82': {
      'en': 'Select Reason',
      'ar': 'حدد السبب',
      'hi': 'कारण चुनें',
    },
    'y5gy94y7': {
      'en': 'Choose Reason',
      'ar': 'اختر السبب',
      'hi': 'कारण चुनें',
    },
    'n72oiock': {
      'en': 'Sample for Doctors',
      'ar': 'عينة للأطباء',
      'hi': 'डॉक्टरों के लिए नमूना',
    },
    '7cki0c63': {
      'en': 'Packaging Review',
      'ar': 'مراجعة التعبئة والتغليف',
      'hi': 'पैकेजिंग समीक्षा',
    },
    'pqzegnzs': {
      'en': 'Laboratory Sample',
      'ar': 'عينة مختبرية',
      'hi': 'प्रयोगशाला नमूना',
    },
    'axgvfmor': {
      'en': 'Criminal Investigation',
      'ar': 'التحقيق الجنائي',
      'hi': 'आपराधिक जांच',
    },
    '2deldfxq': {
      'en': 'Prequalification',
      'ar': 'التأهيل المسبق',
      'hi': 'पूर्व अर्हता',
    },
    'ge7udvgs': {
      'en': 'Retention for future testing',
      'ar': 'الاحتفاظ بها للاختبار في المستقبل',
      'hi': 'भविष्य के परीक्षण के लिए प्रतिधारण',
    },
    '24w2j7ub': {
      'en': 'Consumer Report',
      'ar': 'تقرير المستهلك',
      'hi': 'उपभोक्ता रिपोर्ट',
    },
    'txnwi9p7': {
      'en': ' Product Documentation',
      'ar': 'وثائق المنتج',
      'hi': 'उत्पाद दस्तावेज़ीकरण',
    },
    'h58uc1go': {
      'en': 'PMS Sampling',
      'ar': 'أخذ عينات من PMS',
      'hi': 'पीएमएस नमूनाकरण',
    },
    '5nukxh23': {
      'en': ' Suspect Activity',
      'ar': 'نشاط مشتبه به',
      'hi': 'संदिग्ध गतिविधि',
    },
    '4p73ydhj': {
      'en': ' Storing Condition',
      'ar': 'حالة التخزين',
      'hi': 'भंडारण की स्थिति',
    },
    'inbdn836': {
      'en': 'Scanned Items',
      'ar': 'العناصر الممسوحة ضوئيًا',
      'hi': 'स्कैन की गई वस्तुएँ',
    },
    'z3c0g4t5': {
      'en': 'Confirm Decommission',
      'ar': 'تأكيد إيقاف التشغيل',
      'hi': 'डीकमीशन की पुष्टि करें',
    },
  },
  // DamagedDecommission
  {
    'bp8peuxd': {
      'en': 'Scan Items',
      'ar': 'مسح العناصر',
      'hi': 'आइटम स्कैन करें',
    },
    'y7zgrwxh': {
      'en': 'Scan or enter Serial/SSCC',
      'ar': 'امسح ضوئيًا أو أدخل الرقم التسلسلي/SSCC',
      'hi': 'स्कैन करें या सीरियल/SSCC दर्ज करें',
    },
    '2mncwvuj': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'hi': 'रद्द करना',
    },
    'srh2u3yg': {
      'en': 'Select Reason',
      'ar': 'حدد السبب',
      'hi': 'कारण चुनें',
    },
    'l5glqqwp': {
      'en': 'Choose Reason',
      'ar': 'اختر السبب',
      'hi': 'कारण चुनें',
    },
    'al87z6c1': {
      'en': 'Broken',
      'ar': 'مكسور',
      'hi': 'टूटा हुआ',
    },
    '6akzx73g': {
      'en': 'Unfolded',
      'ar': 'مكشوفة',
      'hi': 'सामने आया',
    },
    'wyma91l3': {
      'en': 'Torn',
      'ar': 'ممزق',
      'hi': 'फटा हुआ',
    },
    'cs44nr7j': {
      'en': '2D Matrix not readable ',
      'ar': 'مصفوفة ثنائية الأبعاد غير قابلة للقراءة',
      'hi': '2D मैट्रिक्स पठनीय नहीं है',
    },
    'seq7zh8w': {
      'en': 'Smashed',
      'ar': 'محطم',
      'hi': 'तोड़ी',
    },
    'shlwul9n': {
      'en': 'Damage due To liquid spill ',
      'ar': 'الأضرار الناجمة عن انسكاب السوائل',
      'hi': 'तरल पदार्थ के रिसाव के कारण क्षति',
    },
    'ti3jboe4': {
      'en': 'Other',
      'ar': 'آخر',
      'hi': 'अन्य',
    },
    'fcr735ur': {
      'en': 'Scanned Items',
      'ar': 'العناصر الممسوحة ضوئيًا',
      'hi': 'स्कैन की गई वस्तुएँ',
    },
    'zsrlf346': {
      'en': 'Confirm Decommission',
      'ar': 'تأكيد إيقاف التشغيل',
      'hi': 'डीकमीशन की पुष्टि करें',
    },
  },
  // Unpack
  {
    's8llgy9z': {
      'en': 'Scan or enter Serial/SSCC',
      'ar': 'امسح ضوئيًا أو أدخل الرقم التسلسلي/SSCC',
      'hi': 'स्कैन करें या सीरियल/SSCC दर्ज करें',
    },
    'g4ou29ap': {
      'en': 'Cancel',
      'ar': '',
      'hi': '',
    },
    'mzp9dvp8': {
      'en': 'Scanned Items',
      'ar': 'العناصر الممسوحة ضوئيًا',
      'hi': 'स्कैन की गई वस्तुएँ',
    },
    '2kx0bgfp': {
      'en': 'Unpack',
      'ar': 'تأكيد فك كل شيء',
      'hi': 'सभी अनपैक की पुष्टि करें',
    },
    'r2vbbwln': {
      'en': 'UnPack',
      'ar': '',
      'hi': '',
    },
  },
  // ReturnShipping
  {
    '15bhrale': {
      'en': 'Scan Shipment',
      'ar': 'مسح الشحنة',
      'hi': 'शिपमेंट स्कैन करें',
    },
    '1j7unozs': {
      'en': 'Scan or enter SSCC',
      'ar': 'امسح أو أدخل SSCC',
      'hi': 'SSCC स्कैन करें या दर्ज करें',
    },
    '5zlki9yx': {
      'en': 'Cancel',
      'ar': '',
      'hi': '',
    },
    'j792rer1': {
      'en': 'Select Reason',
      'ar': 'حدد السبب',
      'hi': 'कारण चुनें',
    },
    'nw4p9uit': {
      'en': 'Choose Reason',
      'ar': 'اختر السبب',
      'hi': 'कारण चुनें',
    },
    'i7xhir0s': {
      'en': 'Sample for Doctors',
      'ar': 'عينة للأطباء',
      'hi': 'डॉक्टरों के लिए नमूना',
    },
    'u7kkrgih': {
      'en': 'Packaging Review',
      'ar': 'مراجعة التعبئة والتغليف',
      'hi': 'पैकेजिंग समीक्षा',
    },
    'xhsaa2xi': {
      'en': 'Laboratory Sample',
      'ar': 'عينة مختبرية',
      'hi': 'प्रयोगशाला नमूना',
    },
    '7wgju90t': {
      'en': 'Criminal Investigation',
      'ar': 'التحقيق الجنائي',
      'hi': 'आपराधिक जांच',
    },
    'jynth320': {
      'en': 'Prequalification',
      'ar': 'التأهيل المسبق',
      'hi': 'पूर्व अर्हता',
    },
    '6dbbs0tl': {
      'en': 'Retention for future testing',
      'ar': 'الاحتفاظ بها للاختبار في المستقبل',
      'hi': 'भविष्य के परीक्षण के लिए प्रतिधारण',
    },
    '0jhw1xhf': {
      'en': 'Consumer Report',
      'ar': 'تقرير المستهلك',
      'hi': 'उपभोक्ता रिपोर्ट',
    },
    '8kojr2tk': {
      'en': ' Product Documentation',
      'ar': 'وثائق المنتج',
      'hi': 'उत्पाद दस्तावेज़ीकरण',
    },
    'uekhburr': {
      'en': 'PMS Sampling',
      'ar': 'أخذ عينات من PMS',
      'hi': 'पीएमएस नमूनाकरण',
    },
    'dor36wx0': {
      'en': ' Suspect Activity',
      'ar': 'نشاط مشتبه به',
      'hi': 'संदिग्ध गतिविधि',
    },
    'fp9d94nu': {
      'en': ' Storing Condition',
      'ar': 'حالة التخزين',
      'hi': 'भंडारण की स्थिति',
    },
    '2v2rcs9k': {
      'en': 'Products',
      'ar': 'منتجات',
      'hi': 'उत्पादों',
    },
    'bdhb9dy8': {
      'en': 'Confirm Return',
      'ar': 'تأكيد الإرجاع',
      'hi': 'वापसी की पुष्टि करें',
    },
    'kdcruz8i': {
      'en': 'Return Shipping ',
      'ar': '',
      'hi': '',
    },
  },
  // DestructionDecommission
  {
    '6qsvtyxl': {
      'en': 'Scan Items',
      'ar': 'مسح العناصر',
      'hi': 'आइटम स्कैन करें',
    },
    'aomrkk2l': {
      'en': 'Scan or enter Serial/SSCC',
      'ar': 'امسح ضوئيًا أو أدخل الرقم التسلسلي/SSCC',
      'hi': 'स्कैन करें या सीरियल/SSCC दर्ज करें',
    },
    'hvp8ijby': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'hi': 'रद्द करना',
    },
    'cfd8hosk': {
      'en': 'Select Reason',
      'ar': 'حدد السبب',
      'hi': 'कारण चुनें',
    },
    '7dzsauxg': {
      'en': 'Choose Reason',
      'ar': 'اختر السبب',
      'hi': 'कारण चुनें',
    },
    'yewhe2sy': {
      'en': 'Item expired ',
      'ar': 'مكسور',
      'hi': 'टूटा हुआ',
    },
    'vucpz3cw': {
      'en': 'Improper storage',
      'ar': '',
      'hi': '',
    },
    'zgmq2ylr': {
      'en': 'Exceeded environmental conditions',
      'ar': '',
      'hi': '',
    },
    'e63kek0z': {
      'en': 'Contaminated',
      'ar': '',
      'hi': '',
    },
    '64gkftie': {
      'en': 'Scanned Items',
      'ar': 'العناصر الممسوحة ضوئيًا',
      'hi': 'स्कैन की गई वस्तुएँ',
    },
    'cvdh5tp5': {
      'en': 'Confirm Decommission',
      'ar': 'تأكيد إيقاف التشغيل',
      'hi': 'डीकमीशन की पुष्टि करें',
    },
  },
  // Login
  {
    'cwgrlcow': {
      'en': 'GXP',
      'ar': '',
      'hi': '',
    },
    'aed3ew27': {
      'en': 'Trace',
      'ar': '',
      'hi': '',
    },
    'dax4ap08': {
      'en': 'TRACE EVERY STEP, ENSURE EVERY DOSE',
      'ar': '',
      'hi': '',
    },
    'skbmfv17': {
      'en': 'Select User',
      'ar': '',
      'hi': '',
    },
    'l7790hcr': {
      'en': 'Search...',
      'ar': '',
      'hi': '',
    },
    'mnlcnmr3': {
      'en': 'Option 1',
      'ar': '',
      'hi': '',
    },
    'zf41hc5w': {
      'en': 'Option 2',
      'ar': '',
      'hi': '',
    },
    'o7ar315a': {
      'en': 'Option 3',
      'ar': '',
      'hi': '',
    },
    's7vmzsto': {
      'en': 'Password',
      'ar': '',
      'hi': '',
    },
    'onvc2u90': {
      'en': 'LOGIN',
      'ar': '',
      'hi': '',
    },
    '30avdo41': {
      'en': 'Failed To Connect to the Server',
      'ar': '',
      'hi': '',
    },
    '10rp25nn': {
      'en': 'Version 1.0.0',
      'ar': '',
      'hi': '',
    },
    '7enhpsre': {
      'en': 'Home',
      'ar': '',
      'hi': '',
    },
  },
  // Queries
  {
    '51v4bfvg': {
      'en': 'Queries',
      'ar': 'بيت',
      'hi': 'घर',
    },
  },
  // reports
  {
    'u4i7gbe9': {
      'en': 'Reports',
      'ar': 'بيت',
      'hi': 'घर',
    },
  },
  // Exceptions
  {
    'gp28ilaq': {
      'en': 'Home',
      'ar': 'بيت',
      'hi': 'घर',
    },
  },
  // Header
  {
    'y2fj0r07': {
      'en': 'Distributor Operations',
      'ar': 'عمليات الموزع',
      'hi': 'वितरक संचालन',
    },
  },
  // SideBar
  {
    'gdc4scx7': {
      'en': 'Distributor App',
      'ar': 'تطبيق الموزع',
      'hi': 'वितरक ऐप',
    },
    'y9b5syfj': {
      'en': 'Status Update',
      'ar': 'تحديث الحالة',
      'hi': 'स्थिति अपडेट',
    },
    '5ebo7ba5': {
      'en': 'Sample',
      'ar': 'عينة',
      'hi': 'नमूना',
    },
    'e8j5yq0t': {
      'en': 'Lost',
      'ar': 'ضائع',
      'hi': 'खो गया',
    },
    'n93y6m0n': {
      'en': 'Stolen',
      'ar': 'مسروقة',
      'hi': 'चुराया हुआ',
    },
    'zdqriqox': {
      'en': 'Damaged',
      'ar': 'متضرر',
      'hi': 'क्षतिग्रस्त',
    },
    'go3zc5ot': {
      'en': 'Decommission',
      'ar': 'إيقاف التشغيل',
      'hi': 'विमुद्रीकरण',
    },
    'sp1lhhkm': {
      'en': 'Inbound Movement',
      'ar': 'الحركة الواردة',
      'hi': 'आवक आंदोलन',
    },
    'i9ta0on7': {
      'en': 'Receiving',
      'ar': 'استلام',
      'hi': 'प्राप्त',
    },
    'llghcwof': {
      'en': 'Return Receiving',
      'ar': 'عودة الاستلام',
      'hi': 'वापसी प्राप्ति',
    },
    'ytk5bijc': {
      'en': 'Outbound Movement',
      'ar': 'الحركة الصادرة',
      'hi': 'आउटबाउंड मूवमेंट',
    },
    'f1lktt40': {
      'en': 'Shipping',
      'ar': 'شحن',
      'hi': 'शिपिंग',
    },
    'yk0c3q57': {
      'en': 'Return Shipping',
      'ar': 'إعادة الشحن',
      'hi': 'वापसी शिपिंग',
    },
    'ry6gpuuo': {
      'en': 'Pack & Repack',
      'ar': 'التعبئة وإعادة التعبئة',
      'hi': 'पैक और पुनः पैक करें',
    },
    'nli6heos': {
      'en': 'Pack',
      'ar': 'علية',
      'hi': 'सामान बाँधना',
    },
    'l7i8745y': {
      'en': 'Unpack',
      'ar': 'فك الحزمة',
      'hi': 'खोलना',
    },
    'eh0fm5s2': {
      'en': 'Unpack All',
      'ar': 'فك كل شيء',
      'hi': 'सभी को अनपैक करें',
    },
    'itblsk1j': {
      'en': 'Queries',
      'ar': 'الاستعلامات',
      'hi': 'प्रश्नों',
    },
    'c9s2rkdm': {
      'en': 'SSCC/GTIN Lookup',
      'ar': 'البحث في SSCC/GTIN',
      'hi': 'एसएससीसी/जीटीआईएन लुकअप',
    },
    '4k9ksn1n': {
      'en': 'Shipment Tracking',
      'ar': 'تتبع الشحنات',
      'hi': 'शिपमेंट ट्रैकिंग',
    },
    '1tewcn6q': {
      'en': 'Operational Reports',
      'ar': 'التقارير التشغيلية',
      'hi': 'परिचालन रिपोर्ट',
    },
    'eu4nx2nz': {
      'en': 'Shipment Report',
      'ar': 'تقرير الشحنة',
      'hi': 'शिपमेंट रिपोर्ट',
    },
    'ks1t86no': {
      'en': 'Product Report',
      'ar': 'تقرير المنتج',
      'hi': 'उत्पाद रिपोर्ट',
    },
    '2y2goipf': {
      'en': 'Dashboard Summary',
      'ar': 'ملخص لوحة المعلومات',
      'hi': 'डैशबोर्ड सारांश',
    },
    '0kesgtkv': {
      'en': 'Exceptions',
      'ar': 'الاستثناءات',
      'hi': 'अपवाद',
    },
    'mw81ms4q': {
      'en': '3',
      'ar': '3',
      'hi': '3',
    },
    'bvgybthp': {
      'en': 'Missing Products',
      'ar': 'المنتجات المفقودة',
      'hi': 'गुम उत्पाद',
    },
    'v0a20uje': {
      'en': 'Wrong SSCC',
      'ar': 'SSCC خاطئ',
      'hi': 'गलत एसएससीसी',
    },
    'nxed1t5e': {
      'en': 'API Error',
      'ar': 'خطأ API',
      'hi': 'API त्रुटि',
    },
  },
  // BottomBar
  {
    'dsk0rvi3': {
      'en': 'Dashboard',
      'ar': 'بيت',
      'hi': 'घर',
    },
    'fo1p95nn': {
      'en': 'Reports',
      'ar': 'التقارير',
      'hi': 'रिपोर्टों',
    },
    'qw18vub2': {
      'en': 'Queries',
      'ar': 'إعدادات',
      'hi': 'सेटिंग्स',
    },
    '1j1sn8q1': {
      'en': 'Exceptions',
      'ar': 'إعدادات',
      'hi': 'सेटिंग्स',
    },
  },
  // SerialCard
  {
    '0p8piq7w': {
      'en': '📦',
      'ar': '📦',
      'hi': '📦',
    },
  },
  // PackageCard
  {
    'r06f9t6a': {
      'en': 'Update',
      'ar': 'تحديث',
      'hi': 'अद्यतन',
    },
    '1q7tvq0k': {
      'en': 'Items: ',
      'ar': 'أغراض:',
      'hi': 'सामान:',
    },
  },
  // addnewsscc
  {
    'czyu5w8a': {
      'en': 'Box',
      'ar': 'صندوق',
      'hi': 'डिब्बा',
    },
    'fj14cb74': {
      'en': 'Pallet',
      'ar': 'منصة نقالة',
      'hi': 'चटाई',
    },
  },
  // ProductDataComponent
  {
    'fwtta0m1': {
      'en': 'Items 24',
      'ar': 'الدفعة B2024001 | تاريخ الانتهاء 15/12/2024 | الرقم التسلسلي 24',
      'hi': 'बैच B2024001 | समाप्ति 15/12/2024 | सीरियल 24',
    },
  },
  // EmptyListViewDisplay
  {
    'zomk0l7m': {
      'en': 'There are no items to display here',
      'ar': 'لا يوجد عناصر لعرضها هنا',
      'hi': 'यहां प्रदर्शित करने के लिए कोई आइटम नहीं है',
    },
  },
  // OrderCard
  {
    'ppyhkklf': {
      'en': 'Permit: ',
      'ar': 'يسمح:',
      'hi': 'आज्ञा देना:',
    },
  },
  // ProductDetailsCard
  {
    '8wnu9fxc': {
      'en': 'Paracetamol 500mg Tablets',
      'ar': 'أقراص باراسيتامول ٥٠٠ مجم',
      'hi': 'पैरासिटामोल 500 मिलीग्राम टैबलेट',
    },
    '6ptvtq11': {
      'en': 'Registered',
      'ar': 'مسجل',
      'hi': 'दर्ज कराई',
    },
  },
  // cancelation
  {
    'ii5lqwhx': {
      'en': '⚠️',
      'ar': '',
      'hi': '',
    },
    'v6jawm31': {
      'en': 'Warning',
      'ar': '',
      'hi': '',
    },
    'j2myiha6': {
      'en':
          'Are you sure you want to cancel this shipment? This action cannot be undone.',
      'ar': '',
      'hi': '',
    },
    'zydsx5lb': {
      'en': 'Cancel',
      'ar': '',
      'hi': '',
    },
    '3nrcfo1s': {
      'en': 'Confirm',
      'ar': '',
      'hi': '',
    },
  },
  // TextField
  {
    'xo2v14b4': {
      'en': 'Scan or enter SSCC',
      'ar': '',
      'hi': '',
    },
  },
  // Miscellaneous
  {
    'eaaqka7i': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    '9pfum8sw': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    '4qf6jyuk': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    '0dv0atha': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    '983qjb6z': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    'z3m93p6u': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    'o6tlwwpz': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    'm1ucpw5r': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    'i7futo90': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    'gmw7s9i2': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    'yi8j1xur': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    'dmcu49l7': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    '6z17wuas': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    'haky1f06': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    'n17deahl': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    'gd9wklc9': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    '0s1gs5j8': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    '6lt68wv0': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    'ho1wvw84': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    '32qmy5zd': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    '0z73gn8m': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    '2c1kcivg': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    'atz78xjb': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    '5ly54fed': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    'tyt10mas': {
      'en': '',
      'ar': '',
      'hi': '',
    },
    'wh056bf8': {
      'en': '',
      'ar': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
