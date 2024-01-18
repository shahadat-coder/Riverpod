import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/Model/user_model.dart';
import 'package:river_pod/services/services.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref)async{
  return ref.watch(userProvider).getUsers();
});