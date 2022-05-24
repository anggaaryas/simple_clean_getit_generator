
class GeneratorAnnotation{
  const GeneratorAnnotation();
}

class AddRepositoryOf extends GeneratorAnnotation {
  final List<dynamic> services;
  final int layer = 1;
  final String? tag;
  const AddRepositoryOf({this.services = const[], this.tag = null});
}

class AddDataSourceOf extends GeneratorAnnotation{
  final List<dynamic> services;
  final int layer = 0;
  final String? tag;
  const AddDataSourceOf({this.services = const[], this.tag = null});
}

class AddServiceOf extends GeneratorAnnotation{
  final List<dynamic> services;
  final int layer = 0;
  final String? tag;
  const AddServiceOf({this.services = const[], this.tag = null});
}