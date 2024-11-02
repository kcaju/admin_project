// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:admin_project/ui/screens/birds_list/birdlist_view.dart' as _i6;
import 'package:admin_project/ui/screens/bottomnav/bottomnav_view.dart' as _i3;
import 'package:admin_project/ui/screens/cats_list/catlist_view.dart' as _i5;
import 'package:admin_project/ui/screens/dogs_list/doglist_view.dart' as _i4;
import 'package:admin_project/ui/screens/pet_details/petdetails_view.dart'
    as _i7;
import 'package:admin_project/ui/screens/splash/splash_view.dart' as _i2;
import 'package:admin_project/ui/screens/supplies_detail_screen/supplies_details_view.dart'
    as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i10;

class Routes {
  static const splashView = '/';

  static const bottomnavView = '/bottomnav-view';

  static const doglistView = '/doglist-view';

  static const catlistView = '/catlist-view';

  static const birdlistView = '/birdlist-view';

  static const petdetailsView = '/petdetails-view';

  static const suppliesDetailsView = '/supplies-details-view';

  static const all = <String>{
    splashView,
    bottomnavView,
    doglistView,
    catlistView,
    birdlistView,
    petdetailsView,
    suppliesDetailsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashView,
      page: _i2.SplashView,
    ),
    _i1.RouteDef(
      Routes.bottomnavView,
      page: _i3.BottomnavView,
    ),
    _i1.RouteDef(
      Routes.doglistView,
      page: _i4.DoglistView,
    ),
    _i1.RouteDef(
      Routes.catlistView,
      page: _i5.CatlistView,
    ),
    _i1.RouteDef(
      Routes.birdlistView,
      page: _i6.BirdlistView,
    ),
    _i1.RouteDef(
      Routes.petdetailsView,
      page: _i7.PetdetailsView,
    ),
    _i1.RouteDef(
      Routes.suppliesDetailsView,
      page: _i8.SuppliesDetailsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashView(),
        settings: data,
      );
    },
    _i3.BottomnavView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.BottomnavView(),
        settings: data,
      );
    },
    _i4.DoglistView: (data) {
      final args = data.getArgs<DoglistViewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.DoglistView(
            key: args.key,
            dogData: args.dogData,
            id: args.id,
            url: args.url,
            breed: args.breed,
            category: args.category),
        settings: data,
      );
    },
    _i5.CatlistView: (data) {
      final args = data.getArgs<CatlistViewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.CatlistView(
            key: args.key,
            catData: args.catData,
            id: args.id,
            url: args.url,
            breed: args.breed,
            category: args.category),
        settings: data,
      );
    },
    _i6.BirdlistView: (data) {
      final args = data.getArgs<BirdlistViewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.BirdlistView(
            key: args.key,
            birdData: args.birdData,
            id: args.id,
            url: args.url,
            breed: args.breed,
            category: args.category),
        settings: data,
      );
    },
    _i7.PetdetailsView: (data) {
      final args = data.getArgs<PetdetailsViewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.PetdetailsView(
            key: args.key,
            name: args.name,
            color: args.color,
            owner: args.owner,
            desc: args.desc,
            sex: args.sex,
            location: args.location,
            url: args.url,
            price: args.price,
            age: args.age,
            phone: args.phone),
        settings: data,
      );
    },
    _i8.SuppliesDetailsView: (data) {
      final args = data.getArgs<SuppliesDetailsViewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.SuppliesDetailsView(
            key: args.key,
            name: args.name,
            desc: args.desc,
            size: args.size,
            url: args.url,
            benefits: args.benefits,
            price: args.price,
            isAccessory: args.isAccessory),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class DoglistViewArguments {
  const DoglistViewArguments({
    this.key,
    required this.dogData,
    required this.id,
    required this.url,
    required this.breed,
    required this.category,
  });

  final _i9.Key? key;

  final Map<String, dynamic> dogData;

  final String id;

  final String url;

  final String breed;

  final String category;

  @override
  String toString() {
    return '{"key": "$key", "dogData": "$dogData", "id": "$id", "url": "$url", "breed": "$breed", "category": "$category"}';
  }

  @override
  bool operator ==(covariant DoglistViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.dogData == dogData &&
        other.id == id &&
        other.url == url &&
        other.breed == breed &&
        other.category == category;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        dogData.hashCode ^
        id.hashCode ^
        url.hashCode ^
        breed.hashCode ^
        category.hashCode;
  }
}

class CatlistViewArguments {
  const CatlistViewArguments({
    this.key,
    required this.catData,
    required this.id,
    required this.url,
    required this.breed,
    required this.category,
  });

  final _i9.Key? key;

  final Map<String, dynamic> catData;

  final String id;

  final String url;

  final String breed;

  final String category;

  @override
  String toString() {
    return '{"key": "$key", "catData": "$catData", "id": "$id", "url": "$url", "breed": "$breed", "category": "$category"}';
  }

  @override
  bool operator ==(covariant CatlistViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.catData == catData &&
        other.id == id &&
        other.url == url &&
        other.breed == breed &&
        other.category == category;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        catData.hashCode ^
        id.hashCode ^
        url.hashCode ^
        breed.hashCode ^
        category.hashCode;
  }
}

class BirdlistViewArguments {
  const BirdlistViewArguments({
    this.key,
    required this.birdData,
    required this.id,
    required this.url,
    required this.breed,
    required this.category,
  });

  final _i9.Key? key;

  final Map<String, dynamic> birdData;

  final String id;

  final String url;

  final String breed;

  final String category;

  @override
  String toString() {
    return '{"key": "$key", "birdData": "$birdData", "id": "$id", "url": "$url", "breed": "$breed", "category": "$category"}';
  }

  @override
  bool operator ==(covariant BirdlistViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.birdData == birdData &&
        other.id == id &&
        other.url == url &&
        other.breed == breed &&
        other.category == category;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        birdData.hashCode ^
        id.hashCode ^
        url.hashCode ^
        breed.hashCode ^
        category.hashCode;
  }
}

class PetdetailsViewArguments {
  const PetdetailsViewArguments({
    this.key,
    required this.name,
    required this.color,
    required this.owner,
    required this.desc,
    required this.sex,
    required this.location,
    required this.url,
    required this.price,
    required this.age,
    required this.phone,
  });

  final _i9.Key? key;

  final String name;

  final String color;

  final String owner;

  final String desc;

  final String sex;

  final String location;

  final String url;

  final num price;

  final num age;

  final String phone;

  @override
  String toString() {
    return '{"key": "$key", "name": "$name", "color": "$color", "owner": "$owner", "desc": "$desc", "sex": "$sex", "location": "$location", "url": "$url", "price": "$price", "age": "$age", "phone": "$phone"}';
  }

  @override
  bool operator ==(covariant PetdetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.name == name &&
        other.color == color &&
        other.owner == owner &&
        other.desc == desc &&
        other.sex == sex &&
        other.location == location &&
        other.url == url &&
        other.price == price &&
        other.age == age &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        name.hashCode ^
        color.hashCode ^
        owner.hashCode ^
        desc.hashCode ^
        sex.hashCode ^
        location.hashCode ^
        url.hashCode ^
        price.hashCode ^
        age.hashCode ^
        phone.hashCode;
  }
}

class SuppliesDetailsViewArguments {
  const SuppliesDetailsViewArguments({
    this.key,
    required this.name,
    required this.desc,
    required this.size,
    required this.url,
    required this.benefits,
    required this.price,
    this.isAccessory = false,
  });

  final _i9.Key? key;

  final String name;

  final String desc;

  final String size;

  final String url;

  final String benefits;

  final num price;

  final bool isAccessory;

  @override
  String toString() {
    return '{"key": "$key", "name": "$name", "desc": "$desc", "size": "$size", "url": "$url", "benefits": "$benefits", "price": "$price", "isAccessory": "$isAccessory"}';
  }

  @override
  bool operator ==(covariant SuppliesDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.name == name &&
        other.desc == desc &&
        other.size == size &&
        other.url == url &&
        other.benefits == benefits &&
        other.price == price &&
        other.isAccessory == isAccessory;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        size.hashCode ^
        url.hashCode ^
        benefits.hashCode ^
        price.hashCode ^
        isAccessory.hashCode;
  }
}

extension NavigatorStateExtension on _i10.NavigationService {
  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBottomnavView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.bottomnavView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDoglistView({
    _i9.Key? key,
    required Map<String, dynamic> dogData,
    required String id,
    required String url,
    required String breed,
    required String category,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.doglistView,
        arguments: DoglistViewArguments(
            key: key,
            dogData: dogData,
            id: id,
            url: url,
            breed: breed,
            category: category),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCatlistView({
    _i9.Key? key,
    required Map<String, dynamic> catData,
    required String id,
    required String url,
    required String breed,
    required String category,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.catlistView,
        arguments: CatlistViewArguments(
            key: key,
            catData: catData,
            id: id,
            url: url,
            breed: breed,
            category: category),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBirdlistView({
    _i9.Key? key,
    required Map<String, dynamic> birdData,
    required String id,
    required String url,
    required String breed,
    required String category,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.birdlistView,
        arguments: BirdlistViewArguments(
            key: key,
            birdData: birdData,
            id: id,
            url: url,
            breed: breed,
            category: category),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPetdetailsView({
    _i9.Key? key,
    required String name,
    required String color,
    required String owner,
    required String desc,
    required String sex,
    required String location,
    required String url,
    required num price,
    required num age,
    required String phone,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.petdetailsView,
        arguments: PetdetailsViewArguments(
            key: key,
            name: name,
            color: color,
            owner: owner,
            desc: desc,
            sex: sex,
            location: location,
            url: url,
            price: price,
            age: age,
            phone: phone),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSuppliesDetailsView({
    _i9.Key? key,
    required String name,
    required String desc,
    required String size,
    required String url,
    required String benefits,
    required num price,
    bool isAccessory = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.suppliesDetailsView,
        arguments: SuppliesDetailsViewArguments(
            key: key,
            name: name,
            desc: desc,
            size: size,
            url: url,
            benefits: benefits,
            price: price,
            isAccessory: isAccessory),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBottomnavView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.bottomnavView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDoglistView({
    _i9.Key? key,
    required Map<String, dynamic> dogData,
    required String id,
    required String url,
    required String breed,
    required String category,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.doglistView,
        arguments: DoglistViewArguments(
            key: key,
            dogData: dogData,
            id: id,
            url: url,
            breed: breed,
            category: category),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCatlistView({
    _i9.Key? key,
    required Map<String, dynamic> catData,
    required String id,
    required String url,
    required String breed,
    required String category,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.catlistView,
        arguments: CatlistViewArguments(
            key: key,
            catData: catData,
            id: id,
            url: url,
            breed: breed,
            category: category),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBirdlistView({
    _i9.Key? key,
    required Map<String, dynamic> birdData,
    required String id,
    required String url,
    required String breed,
    required String category,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.birdlistView,
        arguments: BirdlistViewArguments(
            key: key,
            birdData: birdData,
            id: id,
            url: url,
            breed: breed,
            category: category),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPetdetailsView({
    _i9.Key? key,
    required String name,
    required String color,
    required String owner,
    required String desc,
    required String sex,
    required String location,
    required String url,
    required num price,
    required num age,
    required String phone,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.petdetailsView,
        arguments: PetdetailsViewArguments(
            key: key,
            name: name,
            color: color,
            owner: owner,
            desc: desc,
            sex: sex,
            location: location,
            url: url,
            price: price,
            age: age,
            phone: phone),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSuppliesDetailsView({
    _i9.Key? key,
    required String name,
    required String desc,
    required String size,
    required String url,
    required String benefits,
    required num price,
    bool isAccessory = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.suppliesDetailsView,
        arguments: SuppliesDetailsViewArguments(
            key: key,
            name: name,
            desc: desc,
            size: size,
            url: url,
            benefits: benefits,
            price: price,
            isAccessory: isAccessory),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
