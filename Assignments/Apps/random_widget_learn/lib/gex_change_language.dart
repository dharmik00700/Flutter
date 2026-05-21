import 'package:get/get_navigation/src/root/internacionalization.dart';

class languages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': 'Hello',
    },
    'hi_IN': {
      'hello': 'नमस्ते',
    },
    'es_ES': {
      'hello': 'Hola',
    },
    'fr_FR': {
      'hello': 'Bonjour',
    },
    'de_DE': {
      'hello': 'Hallo',
    },
    'ja_JP': {
      'hello': 'こんにちは',
    },
    'ko_KR': {
      'hello': '안녕하세요',
    },
    'pt_BR': {
      'hello': 'Olá',
    },
    'ru_RU': {
      'hello': 'Привет',
    },
  };
}
