

import 'package:faker/faker.dart';
import 'package:flutter_meedu/providers.dart';

import '../data/repositories_impl/auth_repository.dart';
import '../domain/repositories/auth_repository.dart';

final fakelProvider = Provider(
  (ref)=> Faker(),
);


class Repositories{
  Repositories._();


  static final auth = Provider<AuthRepository>(
    (ref) => AuthRepositoryImpl(
      faker: fakelProvider.read(),
      ),
  );


}