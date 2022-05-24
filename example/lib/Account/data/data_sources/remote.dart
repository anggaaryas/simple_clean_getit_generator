
import 'package:simple_clean_getit_generator/simple_clean_getit_generator.dart';

@AddDataSourceOf()
class RemoteDataSource{
  bool logIn(String username, String password){
    return true;
  }

  bool logOut(){
    return true;
  }
}