import 'session.dart';
//import 'styles.dart';
//export 'styles.dart';

class Strings {
  static String t(word) {
    String lang = session.getString('language') ?? 'ru';
    return v[lang][word];
  }

  static final Map v = {
    'ru': {
      'login': 'Логин',
      'signIn': 'Войти',
      'signUp': 'Регистрация',
      'signInCap': 'ВОЙТИ',
      'forgotPass': "Забыли пароль?",
      'email': 'Эл. почта',
      'password': 'Пароль',
      'invalidPassword': 'Неверный пароль',
      'invalidLoginOrPass': 'Неверный логин или пароль',
      'submit': 'Отправить',
      'invalidLogin': 'Неверный логин',
      'logout': 'Выйти',
      'noData': 'Нет данных',
      'dateAndTime': 'Дата и время',
      'ready': 'Готово',
      'date': 'Дата',
      'dateFrom': 'Дата с',
      'dateTo': 'Дата по',
      'dateToNotReq': 'Дата по (необязательно)',
      'send': 'Отправить',
      'fillField': 'Заполните поле',
      'sum': 'Сумма',
      'end': 'Заверщить',
      'ended': 'Заверщён',
      'addPost': 'Добавить объявление',
      'edit': 'Редактировать',
      'selectCategory': 'Выберите категорию'
    },
    'ky': {
      'login': 'Логин',
      'signInCap': 'КИРҮҮ',
      'signIn': 'Кирүү',
      'signUp': 'Катталуу',
      'forgotPass': "Парольду унуттуңузбу?",
      'email': 'Эл. почта',
      'password': 'Пароль',
      'invalidPassword': 'Пароль туура эмес',
      'invalidLogin': 'Логин туура эмес',
      'submit': 'Жөнөтүү',
      'logout': 'Чыгуу',
      'noData': 'Маалымат жок',
      'dateAndTime': 'Дата жана убакыт',
      'ready': 'Даяр',
      'from': 'Башы',
      'to': 'Аягы',
      'date': 'Дата',
      'dateFrom': 'Дата (башы)',
      'dateTo': 'Дата (аягы)',
      'reason': 'Себеп',
      'send': 'Жөнөтүү',
      'fillField': 'Маалымат киргизиңиз',
      'sum': 'Сумма',
      'dateToReceive': 'Кайсы күнгө',
      'end': 'Жабуу',
      'edit': 'Оңдоо',
      'ended': 'Жабылган'
    }
  };

  static String truncate(String txt, int max) {
    if (txt != null) {
      int len = txt.length;
      if (len > max) {
        txt = txt.substring(0, max) + '..';
      }
    }
    return txt;
  }

  static Map<int, String> cities() {
    return {
      2: 'Бишкек',
      3: 'Ош',
      4: 'Жалал-Абад',
      5: 'Каракол',
      6: 'Нарын',
      7: 'Талас',
      8: 'Баткен',
      9: 'Кызыл-Кыя',
      10: 'Ошская область',
      11: 'Джалал-Абадская область',
      12: 'Чуйская область',
      13: 'Баткенская область',
      14: 'Иссык-Кульская область',
      15: 'Нарынская область',
      16: 'Таласская область'
    };
  }

  static Map<String, dynamic> socialParams = {
    'mailru': {
      'clientId': '717376', //fingen@mail.ru site
    }
  };
}
