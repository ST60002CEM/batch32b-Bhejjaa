import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vendor_vault/core/networking/remote/http_service.dart';

final authRemoteDataSourceProvider = Provider(
  (ref) => AuthRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

