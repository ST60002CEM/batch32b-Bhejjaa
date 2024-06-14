// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:vendor_vault/core/error/failure.dart';
// import 'package:vendor_vault/core/networking/local/hive_service.dart';

// final authLocalDataSourceProvider = Provider(
//   (ref) => AuthLocalDataSource(
//     ref.read(hiveServiceProvider),
//     ref.read(authHiveModelProvider),
//   ),
// );


// class AuthLocalDataSource {
//   final HiveService _hiveService;
//   final AuthHiveModel _authHiveModel;

//   AuthLocalDataSource(this._hiveService, this._authHiveModel);

//   Future<Either<Failure, bool>> registerStudent(AuthEntity student) async {
//     try {
//       await _hiveService.addStudent(_authHiveModel.toHiveModel(student));
//       return const Right(true);
//     } catch (e) {
//       return Left(Failure(error: e.toString()));
//     }
//   }

//   Future<Either<Failure, bool>> loginStudent(
//     String username,
//     String password,
//   ) async {
//     try {
//       AuthHiveModel? students = await _hiveService.login(username, password);
//       return const Right(true);
//     } catch (e) {
//       return Left(Failure(error: e.toString()));
//     }
//   }
// }

