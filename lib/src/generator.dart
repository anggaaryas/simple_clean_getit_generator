import 'dart:async';

import 'package:build/build.dart';
import 'package:glob/glob.dart';
import 'package:simple_clean_getit_generator/simple_clean_getit_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:path/path.dart' as p;
import 'package:analyzer/dart/element/element.dart';

abstract class GeneratorAllInOneForAnnotation<T> extends Generator{
  const GeneratorAllInOneForAnnotation();

  TypeChecker get typeChecker => TypeChecker.fromRuntime(T);

  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) {
    final values = <String>{};
    final listElement = library.annotatedWith(typeChecker);
    final generatedValue = generateFile(listElement);
    values.add(generatedValue);
    return values.join('\n\n');
  }

  String generateFile(Iterable<AnnotatedElement> element);
}

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
    final classNames = <String>[];
    await for (final input in buildStep.findAssets(Glob('lib/**'))){
      final library = await buildStep.resolver.libraryFor(input);
      final classesInLibrary = LibraryReader(library).annotatedWith(typeChecker);

      classNames.addAll(classesInLibrary.map((c){
        var name = (c.element as ClassElement).name;
        var type = (c.annotation.objectValue);
        var path = (c.element as ClassElement).location!.components.first;

        return '$name  |  $type  |  $path\n';
      }));
    }
    await buildStep.writeAsString(
        _allFileOutput(buildStep), classNames.join('\n'));
  }

  @override
  // TODO: implement buildExtensions
  Map<String, List<String>> get buildExtensions => const {
    r'$lib$': const ['service_locator.g.dart'],
  };
  
}
