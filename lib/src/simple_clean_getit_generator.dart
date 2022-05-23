import 'package:analyzer/dart/element/element.dart';
import 'package:simple_clean_getit_generator/simple_clean_getit_generator.dart';
import 'package:simple_clean_getit_generator/src/generator.dart';
import 'package:source_gen/source_gen.dart';

class InjectionFileGenerator extends GeneratorAllInOneForAnnotation<GeneratorAnnotation>{

  @override
  String generateFile(Iterable<AnnotatedElement> annotatedElements) {
    List<_ServiceLocator> repoList = [];
    List<_ServiceLocator> dataSourceList = [];
    List<_ServiceLocator> serviceList = [];

    var value = '';

    for(var item in annotatedElements){
      assert(item is ClassElement);
      assert(!(item as ClassElement).isAbstract);

      var name = (item.element as ClassElement).name;
      var type = item.annotation.objectValue;
      var path = (item.element as ClassElement).location!.components.first;

      value = value + '$name  |  $type  |  $path\n';
      // print(value);

      if(type is AddRepositoryOf){
        repoList.add(_ServiceLocator(name, path, type));
      } else if(type is AddDataSourceOf){
        dataSourceList.add(_ServiceLocator(name, path, type));
      }else if(type is AddServiceOf){
        serviceList.add(_ServiceLocator(name, path, type));
      }
    }

    return "\"$value\"";
  }
  
}

class _ServiceLocator{
  String name;
  String path;
  dynamic type;

  _ServiceLocator(this.name, this.path, this.type);


}