import 'package:example/Account/domain/repositories/auth.dart';
import 'package:simple_clean_getit_generator/simple_clean_getit_generator.dart';

import '../../domain/repositories/user_info.dart';

@AddRepositoryOf(services: [AuthRepository, UserInfoRepository], tag: "Local")
class LocalRepository implements AuthRepository, UserInfoRepository {
  @override
  String getAdress(String username) {
    // TODO: implement getAdress
    throw UnimplementedError();
  }

  @override
  String getName(String username) {
    // TODO: implement getName
    throw UnimplementedError();
  }

  @override
  bool logIn(String username, String password) {
    // TODO: implement logIn
    throw UnimplementedError();
  }

  @override
  bool logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }
}
