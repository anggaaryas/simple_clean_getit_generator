import 'dart:async';

import 'package:build/build.dart';
import 'package:glob/glob.dart';
import 'package:simple_clean_getit_generator/simple_clean_getit_generator.dart';
import 'package:simple_clean_getit_generator/src/class_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:path/path.dart' as p;
import 'package:analyzer/dart/element/element.dart';

class ListAllServiceLocatorBuilder extends Builder{

  TypeChecker get typeChecker => TypeChecker.fromRuntime(GeneratorAnnotation);

  static AssetId _allFileOutput(BuildStep buildStep) {
    return AssetId(
      buildStep.inputId.package,
      p.join('lib', 'service_locator.g.dart'),
    );
  }

  @override
  Future<void> build(BuildStep buildStep) async {
    final List<ServiceLocator> serviceLocators = [];
    await for (final input in buildStep.findAssets(Glob('lib/**'))){
      final library = await buildStep.resolver.libraryFor(input);
      final classesInLibrary = LibraryReader(library).annotatedWith(typeChecker);

      serviceLocators.addAll(classesInLibrary.map((c){
        var name = (c.element as ClassElement).name;
        var layer = c.annotation.objectValue.getField('layer')!.toIntValue();
        var as = c.annotation.objectValue.getField('services')!.toListValue()!;
        var tag = c.annotation.objectValue.getField('tag')?.toStringValue();
        var path = (c.element as ClassElement).location!.components.first;

        var serviceList = <Service>[];
        for(var item in as){
          serviceList.add(
              Service(item.toTypeValue()!.element!.source!.uri.toString(),
              item.toTypeValue()!.getDisplayString(withNullability: false))
          );
        }

        return ServiceLocator(name, serviceList, path, layer!, tag);
      }));
    }

    var generateClass = ClassGenerator(serviceLocators).generate();

    await buildStep.writeAsString(
        _allFileOutput(buildStep), generateClass);
  }

  @override
  // TODO: implement buildExtensions
  Map<String, List<String>> get buildExtensions => const {
    r'$lib$': const ['service_locator.g.dart'],
  };
  
}
