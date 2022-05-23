class GeneratorAnnotation{
  final List<dynamic> type;
  const GeneratorAnnotation(this.type);
}

class AddRepositoryOf extends GeneratorAnnotation{
  const AddRepositoryOf(super.type);
}

class AddDataSourceOf extends GeneratorAnnotation{
  const AddDataSourceOf(super.type);
}

class AddServiceOf extends GeneratorAnnotation{
  const AddServiceOf(super.type);
}