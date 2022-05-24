import 'dart:developer';

class Service{
  final String path;
  final String name;

  Service(this.path, this.name,);
}

class ServiceLocator{
  final String className;
  final List<Service> services;
  final String path;
  final int layer;
  final String? tag;

  ServiceLocator(this.className, this.services, this.path, this.layer, this.tag);
}

class ClassGenerator{
  List<ServiceLocator> list;

  ClassGenerator(this.list){
    list.sort((a,b) => a.layer.compareTo(b.layer));
  }

  final StringBuffer _stringBuffer = StringBuffer();

  void _write(Object obj) => _stringBuffer.write(obj);

  void _writeln([Object obj = ""]) => _stringBuffer.writeln(obj);

  void _newLine() => _stringBuffer.writeln();

  String generate(){

    _writeln("import 'package:get_it/get_it.dart';");
    _writeln();
    var importList = <String>[];
    for(var item in list){
      if(item.services.isNotEmpty){
        for(var service in item.services){
          if(!importList.contains(service.path)){
            _writeln("import '${service.path}';");
            importList.add(service.path);
          }
        }
      }
      if(!importList.contains(item.path)){
        _writeln("import '${item.path}';");
        importList.add(item.path);
      }
    }
    _writeln();
    _writeln("GetIt getIt = GetIt.instance;");
    _writeln();
    _writeln("class ServiceLocator {");
    _writeln("  static void init() {");
    _writeln();
    _writeln();
    for(var item in list){
      if(item.services.isNotEmpty){
        _write("    // ");
        for(var service in item.services){
          _write("${service.name}, ");
        }
        _writeln();
        for(var service in item.services){
          if(item.tag != null){
            _writeln("    getIt.registerSingleton<${service.name}>(${item.className}(), instanceName: '${item.tag}');");
          }  else {
            _writeln("    getIt.registerSingleton<${service.name}>(${item.className}());");
          }
        }
      } else {
        _writeln("    // ${item.className}");
        _writeln("    getIt.registerSingleton(${item.className}());");
      }
      _writeln();
      _writeln();
    }
    _writeln("  }");
    _writeln("}");

    return _stringBuffer.toString();
  }

}