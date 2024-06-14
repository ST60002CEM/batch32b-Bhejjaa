// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:vendor_vault/app/constants/hive_table_constant.dart';

// final hiveServiceProvider = Provider((ref) => HiveService());

// class HiveService {
//   Future<void> init() async {
//     var directory = await getApplicationDocumentsDirectory();
//     Hive.init(directory.path);

//     // Register Adapters
//     Hive.registerAdapter(AuthHiveModelAdapter());
//   }

//   Future<void> addStudent(AuthHiveModel student) async {
//     var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
//     await box.put(user);
//   }

//   Future<List<AuthHiveModel>> getAllStudents() async {
//     var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
//     var students = box.values.toList();
//     box.close();
//     return students;
//   }

//   //Login
//   Future<AuthHiveModel?> login(String username, String password) async {
//     var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
//     var student = box.values.firstWhere((element) =>
//         element.username == username && element.password == password);
//     box.close();
//     return student;
//   }
// }
