import 'package:simple_clean_getit_generator/simple_clean_getit_generator.dart';

abstract class UserInfoRepository{
  String getName();
}

@AddRepositoryOf([UserInfoRepository])
class RemoteRepository implements UserInfoRepository{
  @override
  String getName() {
    // TODO: implement getName
    throw UnimplementedError();
  }
  
}