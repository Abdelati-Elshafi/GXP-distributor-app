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
    'tavcl2ws': {
      'en': 'Queries',
      'ar': 'الاستعلامات',
      'hi': 'प्रश्नों',
    },
    'ezouona4': {
      'en': 'Reports',
      'ar': 'التقارير',
      'hi': 'रिपोर्टों',
    },
    'agf53u7j': {
      'en': 'Exceptions',
      'ar': 'الاستثناءات',
      'hi': 'अपवाद',
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
      'en': 'Receive shipments from MAH or other distributors',
      'ar': 'استلام الشحنات من MAH أو الموزعين الآخرين',
      'hi': 'MAH या अन्य वितरकों से शिपमेंट प्राप्त करें',
    },
    'deeqyzqd': {
      'en': 'Return Receiving',
      'ar': 'عودة الاستلام',
      'hi': 'वापसी प्राप्ति',
    },
    '2um5iolq': {
      'en': 'Process and receive returned products from customers',
      'ar': 'معالجة واستلام المنتجات المرتجعة من العملاء',
      'hi': 'ग्राहकों से लौटाए गए उत्पादों को संसाधित करना और प्राप्त करना',
    },
    'zzfxnkha': {
      'en': 'Inbound Movement',
      'ar': 'إيقاف التشغيل',
      'hi': 'विमुद्रीकरण',
    },
  },
  // OutboundMovement
  {
    'wgy69j1z': {
      'en': 'Outbound Movement',
      'ar': 'إيقاف التشغيل',
      'hi': 'विमुद्रीकरण',
    },
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
      'en': 'Return products back to MAH or supplier',
      'ar': 'إرجاع المنتجات إلى صاحب حق الملكية أو المورد',
      'hi': 'उत्पादों को MAH या आपूर्तिकर्ता को वापस लौटाएँ',
    },
    'd708tg0a': {
      'en': 'ooo',
      'ar': 'أوو',
      'hi': 'ओओओ',
    },
  },
  // PackAndRepack
  {
    'v1poeccg': {
      'en': 'Pack & Repack',
      'ar': 'إيقاف التشغيل',
      'hi': 'विमुद्रीकरण',
    },
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
  },
  // UnpackAll
  {
    '9ct8u92u': {
      'en': 'Scan or Enter SSCC',
      'ar': 'مسح أو إدخال SSCC',
      'hi': 'SSCC स्कैन करें या दर्ज करें',
    },
    'etcoyqr5': {
      'en': 'Enter SSCC manually',
      'ar': 'أدخل SSCC يدويًا',
      'hi': 'SSCC को मैन्युअल रूप से दर्ज करें',
    },
    'zmams5a9': {
      'en': 'Scan SSCC',
      'ar': 'مسح SSCC',
      'hi': 'एसएससीसी स्कैन करें',
    },
    '2mncwvuj': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'hi': 'रद्द करना',
    },
    '167vy5hd': {
      'en': 'SSCC: ',
      'ar': 'إس إس سي سي:',
      'hi': 'एसएससीसी:',
    },
    'pfijzhtd': {
      'en': 'Unpack All',
      'ar': 'فك كل شيء',
      'hi': 'सभी को अनपैक करें',
    },
    'qrcaug38': {
      'en': 'Disassemble all items in this SSCC',
      'ar': 'تفكيك جميع العناصر الموجودة في هذا SSCC',
      'hi': 'इस एसएससीसी में सभी वस्तुओं को अलग करें',
    },
    'yevmcrib': {
      'en': 'Confirm Unpack All',
      'ar': 'تأكيد فك كل شيء',
      'hi': 'सभी अनपैक की पुष्टि करें',
    },
    'lm0jm9xb': {
      'en': 'UnPack All',
      'ar': 'فك كل شيء',
      'hi': 'सभी को अनपैक करें',
    },
  },
  // PackagesList
  {
    'us27zzgv': {
      'en': 'Packages List',
      'ar': 'قائمة الحزم',
      'hi': 'पैकेज सूची',
    },
  },
  // PackageOperation
  {
    'cvze84kn': {
      'en': 'Packages',
      'ar': 'الحزم',
      'hi': 'संकुल',
    },
    'jqtjsmmg': {
      'en': 'Products',
      'ar': 'منتجات',
      'hi': 'उत्पादों',
    },
    '7vciuy37': {
      'en': 'Pack Process',
      'ar': 'عملية التعبئة',
      'hi': 'पैक प्रक्रिया',
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
    'mhnrjs0a': {
      'en': 'Scan SSCC',
      'ar': 'مسح الشحنة',
      'hi': 'शिपमेंट स्कैन करें',
    },
    'gk1vzmxu': {
      'en': 'Scan or enter SSCC',
      'ar': 'امسح أو أدخل SSCC',
      'hi': 'SSCC स्कैन करें या दर्ज करें',
    },
    '5zlki9yx': {
      'en': 'Cancel',
      'ar': '',
      'hi': '',
    },
    '4ql1vfju': {
      'en': 'Products',
      'ar': 'منتجات',
      'hi': 'उत्पादों',
    },
    'd039g9fa': {
      'en': 'Confirm Receive',
      'ar': 'تأكيد الاستلام',
      'hi': 'प्राप्ति की पुष्टि करें',
    },
    'ypzok3iv': {
      'en': 'Return Receive',
      'ar': 'تأكيد الاستلام',
      'hi': 'प्राप्ति की पुष्टि करें',
    },
    '7sb240w9': {
      'en': 'Shipment Receive ',
      'ar': 'إيقاف التشغيل',
      'hi': 'विमुद्रीकरण',
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
    'gnbycq9y': {
      'en': 'Decommission',
      'ar': 'إيقاف التشغيل',
      'hi': 'विमुद्रीकरण',
    },
  },
  // OrdersList
  {
    'yacs3hj4': {
      'en': 'Order List',
      'ar': 'قائمة الطلبات',
      'hi': 'आदेश सूची',
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
    'xz7tf9yr': {
      'en': '1234567890000',
      'ar': '1234567890000',
      'hi': '1234567890000',
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
    'rx0oel0r': {
      'en': '987654321012345678',
      'ar': '987654321012345678',
      'hi': '987654321012345678',
    },
    'zfgk1rrz': {
      'en': 'Products in Order',
      'ar': 'المنتجات بالترتيب',
      'hi': 'क्रम में उत्पाद',
    },
  },
  // ProductDetails
  {
    '8h4ekkxq': {
      'en': 'Batch: BC2024001',
      'ar': 'الدفعة: BC2024001',
      'hi': 'बैच: BC2024001',
    },
    '7wzbet3q': {
      'en': 'Expiry: 12/2024',
      'ar': 'تاريخ الانتهاء: 12/2024',
      'hi': 'समाप्ति: 12/2024',
    },
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
  },
  // Shipping
  {
    '6tx3l06n': {
      'en': 'Select and Scan SSCC To Validate ',
      'ar': 'حدد وامسح SSCC للتحقق',
      'hi': 'सत्यापन के लिए SSCC का चयन करें और स्कैन करें',
    },
    'j1r929rp': {
      'en': 'Select Order',
      'ar': 'حدد الطلب',
      'hi': 'आदेश चुनें',
    },
    'wauyg0lw': {
      'en': 'Search',
      'ar': 'يبحث',
      'hi': 'खोज',
    },
    'lc4nabc8': {
      'en': 'Order #12345 - Pharmacy A',
      'ar': 'الطلب رقم 12345 - الصيدلية أ',
      'hi': 'आदेश #12345 - फार्मेसी A',
    },
    '052atzb3': {
      'en': 'Order #12346 - Pharmacy B',
      'ar': 'الطلب رقم 12346 - صيدلية ب',
      'hi': 'आदेश #12346 - फ़ार्मेसी B',
    },
    '5htonf8p': {
      'en': 'Order #12347 - Pharmacy C',
      'ar': 'الطلب رقم 12347 - صيدلية ج',
      'hi': 'आदेश #12347 - फार्मेसी C',
    },
    's6hxfbt9': {
      'en': 'Scan or enter SSCC',
      'ar': 'امسح أو أدخل SSCC',
      'hi': 'SSCC स्कैन करें या दर्ज करें',
    },
    'uejt2in0': {
      'en': 'Order #:',
      'ar': 'طلب #:',
      'hi': 'आदेश #:',
    },
    'hyh1pnwi': {
      'en': '12345',
      'ar': '12345',
      'hi': '12345',
    },
    '7sgkgvav': {
      'en': 'Customer:',
      'ar': 'عميل:',
      'hi': 'ग्राहक:',
    },
    'rn3ppj0t': {
      'en': 'Pharmacy A',
      'ar': 'صيدلية أ',
      'hi': 'फार्मेसी ए',
    },
    'u8uupmq5': {
      'en': 'Destination GLN:',
      'ar': 'الوجهة GLN:',
      'hi': 'गंतव्य जीएलएन:',
    },
    'rb60gtrf': {
      'en': '1234567890000',
      'ar': '1234567890000',
      'hi': '1234567890000',
    },
    'we9n0rv9': {
      'en': 'Date:',
      'ar': 'تاريخ:',
      'hi': 'तारीख:',
    },
    'r3124txy': {
      'en': '2025-09-04',
      'ar': '2025-09-03T21:00:00Z',
      'hi': '2025-09-03T21:00:00Z',
    },
    'hjc6nog3': {
      'en': 'Order SSCC:',
      'ar': 'طلب SSCC:',
      'hi': 'एसएससीसी का आदेश:',
    },
    'qfhluzq4': {
      'en': '987654321012345678',
      'ar': '987654321012345678',
      'hi': '987654321012345678',
    },
    'anagf2hl': {
      'en': 'Products in Order',
      'ar': 'المنتجات بالترتيب',
      'hi': 'क्रम में उत्पाद',
    },
    'ov3w59t0': {
      'en': 'Confirm Shipping',
      'ar': 'تأكيد الشحن',
      'hi': 'शिपिंग की पुष्टि करें',
    },
    'g1uru79y': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'hi': 'रद्द करना',
    },
    '9koi8ylo': {
      'en': 'Confirm Shipping',
      'ar': 'تأكيد الشحن',
      'hi': 'शिपिंग की पुष्टि करें',
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
    '7yjvze18': {
      'en': 'Confirm Decommission',
      'ar': 'تأكيد إيقاف التشغيل',
      'hi': 'डीकमीशन की पुष्टि करें',
    },
    'd18pmrwb': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'hi': 'रद्द करना',
    },
    'o43vwrn2': {
      'en': 'Decommission',
      'ar': 'إيقاف التشغيل',
      'hi': 'विमुद्रीकरण',
    },
  },
  // DamagedDecommission
  {
    'avv8zg8q': {
      'en': 'Decommissionn',
      'ar': 'إيقاف التشغيل',
      'hi': 'विमुद्रीकरण',
    },
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
    'eb5ppw2s': {
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
    'c88yndw2': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'hi': 'रद्द करना',
    },
  },
  // Unpack
  {
    'uqyc29jn': {
      'en': 'UnPack',
      'ar': 'فك العبوة',
      'hi': 'खोल देना',
    },
    '4qoka76q': {
      'en': 'Scanned Items',
      'ar': 'العناصر الممسوحة ضوئيًا',
      'hi': 'स्कैन की गई वस्तुएँ',
    },
    's8llgy9z': {
      'en': 'Scan or enter Serial/SSCC',
      'ar': 'امسح ضوئيًا أو أدخل الرقم التسلسلي/SSCC',
      'hi': 'स्कैन करें या सीरियल/SSCC दर्ज करें',
    },
    'mzp9dvp8': {
      'en': 'Scanned Items',
      'ar': 'العناصر الممسوحة ضوئيًا',
      'hi': 'स्कैन की गई वस्तुएँ',
    },
    '2kx0bgfp': {
      'en': 'Confirm Unpack All',
      'ar': 'تأكيد فك كل شيء',
      'hi': 'सभी अनपैक की पुष्टि करें',
    },
  },
  // ReturnShipping
  {
    'drb52lv4': {
      'en': 'Return Shipping ',
      'ar': 'إعادة الشحن',
      'hi': 'वापसी शिपिंग',
    },
    '60ght6ot': {
      'en': 'Scan Shipment',
      'ar': 'مسح الشحنة',
      'hi': 'शिपमेंट स्कैन करें',
    },
    'z549ukbk': {
      'en': 'Scan or enter SSCC',
      'ar': 'امسح أو أدخل SSCC',
      'hi': 'SSCC स्कैन करें या दर्ज करें',
    },
    'fmml5i3u': {
      'en': 'SSCC: ',
      'ar': 'إس إس سي سي:',
      'hi': 'एसएससीसी:',
    },
    'pyyqmf0y': {
      'en': 'Cases: ',
      'ar': 'حالات:',
      'hi': 'मामले:',
    },
    'uixq3x3e': {
      'en': '0',
      'ar': '0',
      'hi': '0',
    },
    'onmdb6yn': {
      'en': 'Items: ',
      'ar': 'أغراض:',
      'hi': 'सामान:',
    },
    'kaov5a5o': {
      'en': '0',
      'ar': '0',
      'hi': '0',
    },
    '50pfxh0u': {
      'en': 'Choose Reason',
      'ar': 'اختر السبب',
      'hi': 'कारण चुनें',
    },
    'y070xo7t': {
      'en': 'Sample for Doctors',
      'ar': 'عينة للأطباء',
      'hi': 'डॉक्टरों के लिए नमूना',
    },
    'ark956el': {
      'en': 'Packaging Review',
      'ar': 'مراجعة التعبئة والتغليف',
      'hi': 'पैकेजिंग समीक्षा',
    },
    '7xa3lg7f': {
      'en': 'Laboratory Sample',
      'ar': 'عينة مختبرية',
      'hi': 'प्रयोगशाला नमूना',
    },
    'ow88t8ta': {
      'en': 'Criminal Investigation',
      'ar': 'التحقيق الجنائي',
      'hi': 'आपराधिक जांच',
    },
    '5ghwtn60': {
      'en': 'Prequalification',
      'ar': 'التأهيل المسبق',
      'hi': 'पूर्व अर्हता',
    },
    'dwhcqeu4': {
      'en': 'Retention for future testing',
      'ar': 'الاحتفاظ بها للاختبار في المستقبل',
      'hi': 'भविष्य के परीक्षण के लिए प्रतिधारण',
    },
    'eh3tydjj': {
      'en': 'Consumer Report',
      'ar': 'تقرير المستهلك',
      'hi': 'उपभोक्ता रिपोर्ट',
    },
    '00sk1dst': {
      'en': ' Product Documentation',
      'ar': 'وثائق المنتج',
      'hi': 'उत्पाद दस्तावेज़ीकरण',
    },
    'cjoaf8zz': {
      'en': 'PMS Sampling',
      'ar': 'أخذ عينات من PMS',
      'hi': 'पीएमएस नमूनाकरण',
    },
    'svowqiuu': {
      'en': ' Suspect Activity',
      'ar': 'نشاط مشتبه به',
      'hi': 'संदिग्ध गतिविधि',
    },
    'j7y452x5': {
      'en': ' Storing Condition',
      'ar': 'حالة التخزين',
      'hi': 'भंडारण की स्थिति',
    },
    '46npcsad': {
      'en': 'Products',
      'ar': 'منتجات',
      'hi': 'उत्पादों',
    },
    'e76d3z0r': {
      'en': 'Confirm Return',
      'ar': 'تأكيد الإرجاع',
      'hi': 'वापसी की पुष्टि करें',
    },
  },
  // DestructionDecommission
  {
    'b8l9ap0y': {
      'en': 'Scan Items',
      'ar': 'مسح العناصر',
      'hi': 'आइटम स्कैन करें',
    },
    'j04bc15s': {
      'en': 'Scan or enter Serial/SSCC',
      'ar': 'امسح ضوئيًا أو أدخل الرقم التسلسلي/SSCC',
      'hi': 'स्कैन करें या सीरियल/SSCC दर्ज करें',
    },
    '71l6wd83': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'hi': 'रद्द करना',
    },
    'cp52o7he': {
      'en': 'Select Reason',
      'ar': 'حدد السبب',
      'hi': 'कारण चुनें',
    },
    '40yy5d0n': {
      'en': 'Choose Reason',
      'ar': 'اختر السبب',
      'hi': 'कारण चुनें',
    },
    'qzwklhwp': {
      'en': 'Item expired ',
      'ar': 'مكسور',
      'hi': 'टूटा हुआ',
    },
    '7un15u81': {
      'en': 'Improper storage',
      'ar': '',
      'hi': '',
    },
    'l3kgu1s5': {
      'en': 'Exceeded environmental conditions',
      'ar': '',
      'hi': '',
    },
    'py2jdoei': {
      'en': 'Contaminated',
      'ar': '',
      'hi': '',
    },
    'yf29l2if': {
      'en': 'Scanned Items',
      'ar': 'العناصر الممسوحة ضوئيًا',
      'hi': 'स्कैन की गई वस्तुएँ',
    },
    '1mw2e7y2': {
      'en': 'Confirm Decommission',
      'ar': 'تأكيد إيقاف التشغيل',
      'hi': 'डीकमीशन की पुष्टि करें',
    },
    'k6xbv44b': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'hi': 'रद्द करना',
    },
    '0qwrj4u5': {
      'en': 'Decommissionn',
      'ar': 'إيقاف التشغيل',
      'hi': 'विमुद्रीकरण',
    },
  },
  // Login
  {
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
      'en': 'Login',
      'ar': '',
      'hi': '',
    },
    '30avdo41': {
      'en': 'Failed To Connect to the Server',
      'ar': '',
      'hi': '',
    },
    '7enhpsre': {
      'en': 'Home',
      'ar': '',
      'hi': '',
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
      'en': 'Home',
      'ar': 'بيت',
      'hi': 'घर',
    },
    'fo1p95nn': {
      'en': 'Reports',
      'ar': 'التقارير',
      'hi': 'रिपोर्टों',
    },
    'qw18vub2': {
      'en': 'Settings',
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
    'oq8h38cz': {
      'en': 'Product: ',
      'ar': 'منتج:',
      'hi': 'उत्पाद:',
    },
    '7gh229bi': {
      'en': 'Cases: ',
      'ar': 'حالات:',
      'hi': 'मामले:',
    },
    '1q7tvq0k': {
      'en': 'Items: ',
      'ar': 'أغراض:',
      'hi': 'सामान:',
    },
  },
  // addnewsscc
  {
    'u56axdix': {
      'en': 'Unit',
      'ar': 'وحدة',
      'hi': 'इकाई',
    },
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
    'qqxq12ry': {
      'en': '#123456',
      'ar': '#123456',
      'hi': '#123456',
    },
    '306c3v9t': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
      'hi': 'लंबित',
    },
  },
  // SSCCDetailsCard
  {
    'vaqlu3y6': {
      'en': 'Case',
      'ar': 'قضية',
      'hi': 'मामला',
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
