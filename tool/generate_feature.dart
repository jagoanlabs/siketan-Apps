import 'dart:io';

void main(List<String> args) async {
  if (args.isEmpty) {
    print('❌ Masukkan nama fitur, contoh: dart run tool/generate_feature.dart auth');
    exit(1);
  }

  final featureName = args.first;
  final withContent = args.contains('--with-content');

  final featurePath = 'lib/features/$featureName';
  final directories = [
    '$featurePath/data/datasources',
    '$featurePath/data/repository_impl',
    '$featurePath/domain/model',
    '$featurePath/domain/repository',
    '$featurePath/presentation/view',
    '$featurePath/presentation/widget',
  ];

  for (final dir in directories) {
    await Directory(dir).create(recursive: true);
  }

  if (withContent) {
    await _generateFiles(featurePath, featureName);
  }

  print('✅ Feature "$featureName" berhasil dibuat!');
  print('📂 Path: $featurePath');
}

Future<void> _generateFiles(String basePath, String featureName) async {
  final className =
      featureName[0].toUpperCase() + featureName.substring(1).toLowerCase();

  // ===== Data Layer =====
  await File('$basePath/data/datasources/${featureName}_remote_datasource.dart')
      .writeAsString('''
import '../../domain/model/${featureName}_model.dart';

class ${className}RemoteDataSource {
  Future<List<${className}Model>> fetchAll() async {
    // TODO: implement API call
    return [];
  }
}
''');

  await File('$basePath/data/repository_impl/${featureName}_repository_impl.dart')
      .writeAsString('''
import '../../domain/repository/${featureName}_repository.dart';
import '../../domain/model/${featureName}_model.dart';
import '../datasources/${featureName}_remote_datasource.dart';

class ${className}RepositoryImpl implements ${className}Repository {
  final ${className}RemoteDataSource remoteDataSource;

  ${className}RepositoryImpl(this.remoteDataSource);

  @override
  Future<List<${className}Model>> getAll() async {
    return remoteDataSource.fetchAll();
  }
}
''');

  // ===== Domain Layer =====
  await File('$basePath/domain/model/${featureName}_model.dart').writeAsString('''
class ${className}Model {
  final int id;
  final String name;

  ${className}Model({required this.id, required this.name});
}
''');

  await File('$basePath/domain/repository/${featureName}_repository.dart').writeAsString('''
import '../model/${featureName}_model.dart';

abstract class ${className}Repository {
  Future<List<${className}Model>> getAll();
}
''');

  // ===== Presentation Layer =====
  await File('$basePath/presentation/view/${featureName}_page.dart').writeAsString('''
import 'package:flutter/material.dart';

class ${className}Page extends StatelessWidget {
  const ${className}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('$className')),
      body: const Center(
        child: Text('This is $className feature'),
      ),
    );
  }
}
''');

  await File('$basePath/presentation/widget/${featureName}_widget.dart')
      .writeAsString('''
import 'package:flutter/material.dart';

class ${className}Widget extends StatelessWidget {
  const ${className}Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
''');
}