import 'package:build/build.dart';
import 'package:simple_clean_getit_generator/simple_clean_getit_generator.dart';
import 'package:simple_clean_getit_generator/src/generator.dart';
import 'package:simple_clean_getit_generator/src/simple_clean_getit_generator.dart';
import 'package:source_gen/source_gen.dart';

/*
Builder simpleCleanGetitGenerator(BuilderOptions options) => LibraryBuilder(
  InjectionFileGenerator(),
  generatedExtension: '.inject.dart',
  header: '''
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: public_member_api_docs, unused_import, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies
import 'package:meta/meta.dart';
    ''',
);*/

Builder simpleCleanGetitGenerator(BuilderOptions options) => ListAllServiceLocatorBuilder();