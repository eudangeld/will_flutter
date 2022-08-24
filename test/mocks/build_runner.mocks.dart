// Mocks generated by Mockito 5.3.0 from annotations
// in will_flutter/test/mocks/build_runner.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:will_flutter/core/error/failures.dart' as _i6;
import 'package:will_flutter/core/platform/connectivity_info.dart' as _i9;
import 'package:will_flutter/features/meals/data/sources/meals_remote_datasource.dart'
    as _i10;
import 'package:will_flutter/features/meals/domain/entities/categorie.dart'
    as _i7;
import 'package:will_flutter/features/meals/domain/entities/meal.dart' as _i8;
import 'package:will_flutter/features/meals/domain/repositories/meals_repository.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeDuration_1 extends _i1.SmartFake implements Duration {
  _FakeDuration_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeAddressCheckResult_2 extends _i1.SmartFake
    implements _i3.AddressCheckResult {
  _FakeAddressCheckResult_2(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [MealRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMealRepository extends _i1.Mock implements _i4.MealRepository {
  MockMealRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.Categorie>>> getCategories() =>
      (super.noSuchMethod(Invocation.method(#getCategories, []),
          returnValue:
              _i5.Future<_i2.Either<_i6.Failure, List<_i7.Categorie>>>.value(
                  _FakeEither_0<_i6.Failure, List<_i7.Categorie>>(
                      this, Invocation.method(#getCategories, [])))) as _i5
          .Future<_i2.Either<_i6.Failure, List<_i7.Categorie>>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i8.Meal>>> filterByCategory(
          {String? category}) =>
      (super.noSuchMethod(
              Invocation.method(#filterByCategory, [], {#category: category}),
              returnValue: _i5.Future<_i2.Either<_i6.Failure, List<_i8.Meal>>>.value(
                  _FakeEither_0<_i6.Failure, List<_i8.Meal>>(
                      this,
                      Invocation.method(
                          #filterByCategory, [], {#category: category}))))
          as _i5.Future<_i2.Either<_i6.Failure, List<_i8.Meal>>>);
}

/// A class which mocks [ConnectivityInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockConnectivityInfo extends _i1.Mock implements _i9.ConnectivityInfo {
  MockConnectivityInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<bool> get hasConnection =>
      (super.noSuchMethod(Invocation.getter(#hasConnection),
          returnValue: _i5.Future<bool>.value(false)) as _i5.Future<bool>);
}

/// A class which mocks [MealsRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMealsRemoteDataSource extends _i1.Mock
    implements _i10.MealsRemoteDataSource {
  MockMealsRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i7.Categorie>> getCategories() => (super.noSuchMethod(
          Invocation.method(#getCategories, []),
          returnValue: _i5.Future<List<_i7.Categorie>>.value(<_i7.Categorie>[]))
      as _i5.Future<List<_i7.Categorie>>);
  @override
  _i5.Future<List<_i8.Meal>> filterByCategory({String? category}) =>
      (super.noSuchMethod(
              Invocation.method(#filterByCategory, [], {#category: category}),
              returnValue: _i5.Future<List<_i8.Meal>>.value(<_i8.Meal>[]))
          as _i5.Future<List<_i8.Meal>>);
}

/// A class which mocks [InternetConnectionChecker].
///
/// See the documentation for Mockito's code generation for more information.
class MockInternetConnectionChecker extends _i1.Mock
    implements _i3.InternetConnectionChecker {
  MockInternetConnectionChecker() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Duration get checkInterval => (super.noSuchMethod(
          Invocation.getter(#checkInterval),
          returnValue: _FakeDuration_1(this, Invocation.getter(#checkInterval)))
      as Duration);
  @override
  Duration get checkTimeout => (super.noSuchMethod(
          Invocation.getter(#checkTimeout),
          returnValue: _FakeDuration_1(this, Invocation.getter(#checkTimeout)))
      as Duration);
  @override
  List<_i3.AddressCheckOptions> get addresses =>
      (super.noSuchMethod(Invocation.getter(#addresses),
              returnValue: <_i3.AddressCheckOptions>[])
          as List<_i3.AddressCheckOptions>);
  @override
  set addresses(List<_i3.AddressCheckOptions>? value) =>
      super.noSuchMethod(Invocation.setter(#addresses, value),
          returnValueForMissingStub: null);
  @override
  _i5.Future<bool> get hasConnection =>
      (super.noSuchMethod(Invocation.getter(#hasConnection),
          returnValue: _i5.Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<_i3.InternetConnectionStatus> get connectionStatus =>
      (super.noSuchMethod(Invocation.getter(#connectionStatus),
              returnValue: _i5.Future<_i3.InternetConnectionStatus>.value(
                  _i3.InternetConnectionStatus.connected))
          as _i5.Future<_i3.InternetConnectionStatus>);
  @override
  _i5.Stream<_i3.InternetConnectionStatus> get onStatusChange =>
      (super.noSuchMethod(Invocation.getter(#onStatusChange),
              returnValue: _i5.Stream<_i3.InternetConnectionStatus>.empty())
          as _i5.Stream<_i3.InternetConnectionStatus>);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  bool get isActivelyChecking =>
      (super.noSuchMethod(Invocation.getter(#isActivelyChecking),
          returnValue: false) as bool);
  @override
  _i5.Future<_i3.AddressCheckResult> isHostReachable(
          _i3.AddressCheckOptions? options) =>
      (super.noSuchMethod(Invocation.method(#isHostReachable, [options]),
              returnValue: _i5.Future<_i3.AddressCheckResult>.value(
                  _FakeAddressCheckResult_2(
                      this, Invocation.method(#isHostReachable, [options]))))
          as _i5.Future<_i3.AddressCheckResult>);
}
