import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vendor_vault/app/constants/api_endpoints.dart';
import 'package:vendor_vault/core/error/failure.dart';
import 'package:vendor_vault/core/networking/remote/http_service.dart';
import 'package:vendor_vault/features/auth/domain/entity/auth_entity.dart';

final authRemoteDataSourceProvider = Provider(
  (ref) => AuthRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class AuthRemoteDataSource {
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;

  AuthRemoteDataSource({required this.dio, required this.userSharedPrefs});

  Future<Either<Failure, bool>> registerUser(AuthEntity user) async {
    try {
      Response response = await dio.post(
        ApiEndpoints.register,
        data: {
          "fname": user.fname,
          "lname": user.lname,
          "phone": user.phone,
          "username": user.username,
          "password": user.password,
          "account type": user.accountType
        },
      );
