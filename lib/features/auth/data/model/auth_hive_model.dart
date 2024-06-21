import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:vendor_vault/app/constants/hive_table_constant.dart';
import 'package:vendor_vault/features/auth/domain/entity/auth_entity.dart';

part 'auth_hive_model.g.dart';

final authHiveModelProvider = Provider(
      (ref) => AuthHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String fname;

  @HiveField(2)
  final String lname;

  @HiveField(3)
  final String username;

  @HiveField(4)
  final String phone;

  @HiveField(5)
  final String password;

  @HiveField(6)
  final String accountType;

  // Constructor
  AuthHiveModel({
    String? userId,
    required this.fname,
    required this.lname,
    required this.phone,
    required this.username,
    required this.password,
    required  this.accountType,
  }) : userId = userId ?? const Uuid().v4();

  // empty constructor
  AuthHiveModel.empty()
      : this(
    userId: '',
    fname: '',
    lname: '',
    phone: '',
    username: '',
    password: '',
    accountType: '',
  );

  // Convert Hive Object to Entity
  AuthEntity toEntity() => AuthEntity(
    id: userId,
    fname: fname,
    lname: lname,
    phone: phone,
    username: username,
    password: password, 
    accountType: accountType,
  );

  // Convert Entity to Hive Object
  AuthHiveModel toHiveModel(AuthEntity entity) => AuthHiveModel(
    userId: const Uuid().v4(),
    fname: entity.fname,
    lname: entity.lname, 
    phone: entity.phone,
    username: entity.username,
    password: entity.password, accountType:entity.accountType,
  );

  // Convert Entity List to Hive List
  List<AuthHiveModel> toHiveModelList(List<AuthEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  String toString() {
    return 'userId: $userId, fname: $fname, lname: $lname, phone: $phone, username: $username, password: $password, accountType: $accountType';
  }
}