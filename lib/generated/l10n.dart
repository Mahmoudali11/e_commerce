// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `LogIn`
  String get login {
    return Intl.message(
      'LogIn',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Produts`
  String get products {
    return Intl.message(
      'Produts',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get language {
    return Intl.message(
      'English',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `LogOut`
  String get logout {
    return Intl.message(
      'LogOut',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Prouducts Managment`
  String get productm {
    return Intl.message(
      'Prouducts Managment',
      name: 'productm',
      desc: '',
      args: [],
    );
  }

  /// `Name: `
  String get name {
    return Intl.message(
      'Name: ',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Price: `
  String get price {
    return Intl.message(
      'Price: ',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Describtion: `
  String get desc {
    return Intl.message(
      'Describtion: ',
      name: 'desc',
      desc: '',
      args: [],
    );
  }

  /// `Available Sizes: `
  String get availablesizes {
    return Intl.message(
      'Available Sizes: ',
      name: 'availablesizes',
      desc: '',
      args: [],
    );
  }

  /// `Buying Date: `
  String get buyingdate {
    return Intl.message(
      'Buying Date: ',
      name: 'buyingdate',
      desc: '',
      args: [],
    );
  }

  /// `Adress: `
  String get adress {
    return Intl.message(
      'Adress: ',
      name: 'adress',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Size: `
  String get size {
    return Intl.message(
      'Size: ',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `AddToCart`
  String get buy {
    return Intl.message(
      'AddToCart',
      name: 'buy',
      desc: '',
      args: [],
    );
  }

  /// `allready in your card!`
  String get allreadyinyourcard {
    return Intl.message(
      'allready in your card!',
      name: 'allreadyinyourcard',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `email`
  String get email {
    return Intl.message(
      'email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get pass {
    return Intl.message(
      'password',
      name: 'pass',
      desc: '',
      args: [],
    );
  }

  /// `confirm password`
  String get confirmp {
    return Intl.message(
      'confirm password',
      name: 'confirmp',
      desc: '',
      args: [],
    );
  }

  /// `password are not identical`
  String get passnotidentical {
    return Intl.message(
      'password are not identical',
      name: 'passnotidentical',
      desc: '',
      args: [],
    );
  }

  /// `Don't have account? `
  String get createaccount {
    return Intl.message(
      'Don\'t have account? ',
      name: 'createaccount',
      desc: '',
      args: [],
    );
  }

  /// `yes`
  String get yes {
    return Intl.message(
      'yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `SignUp`
  String get signup {
    return Intl.message(
      'SignUp',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get phone {
    return Intl.message(
      'Mobile Number',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `your cart is empty!`
  String get noproducts {
    return Intl.message(
      'your cart is empty!',
      name: 'noproducts',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forget {
    return Intl.message(
      'Forget Password?',
      name: 'forget',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}