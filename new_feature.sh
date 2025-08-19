#!/bin/bash

FEATURE_NAME=$1
FEATURE_NAME_CAP="$(tr '[:lower:]' '[:upper:]' <<< ${FEATURE_NAME:0:1})${FEATURE_NAME:1}"

# Create folders
mkdir -p lib/features/$FEATURE_NAME/{data/repositories,domain/repositories,presentation/{bloc,pages}}

# Domain repository
cat > lib/features/$FEATURE_NAME/domain/repositories/${FEATURE_NAME}_repository.dart <<EOL
abstract class ${FEATURE_NAME_CAP}Repository {}
EOL

# Data repository
cat > lib/features/$FEATURE_NAME/data/repositories/${FEATURE_NAME}_repository_impl.dart <<EOL
import '../../domain/repositories/${FEATURE_NAME}_repository.dart';

class ${FEATURE_NAME_CAP}RepositoryImpl implements ${FEATURE_NAME_CAP}Repository {}
EOL

# Bloc files
cat > lib/features/$FEATURE_NAME/presentation/bloc/${FEATURE_NAME}_bloc.dart <<EOL
import 'package:flutter_bloc/flutter_bloc.dart';

part '${FEATURE_NAME}_event.dart';
part '${FEATURE_NAME}_state.dart';

class ${FEATURE_NAME_CAP}Bloc extends Bloc<${FEATURE_NAME_CAP}Event, ${FEATURE_NAME_CAP}State> {
  ${FEATURE_NAME_CAP}Bloc() : super(${FEATURE_NAME_CAP}Initial()) {
    on<${FEATURE_NAME_CAP}Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}
EOL

cat > lib/features/$FEATURE_NAME/presentation/bloc/${FEATURE_NAME}_event.dart <<EOL
part of '${FEATURE_NAME}_bloc.dart';

abstract class ${FEATURE_NAME_CAP}Event {}
EOL

cat > lib/features/$FEATURE_NAME/presentation/bloc/${FEATURE_NAME}_state.dart <<EOL
part of '${FEATURE_NAME}_bloc.dart';

abstract class ${FEATURE_NAME_CAP}State {}

class ${FEATURE_NAME_CAP}Initial extends ${FEATURE_NAME_CAP}State {}
EOL

# Page
cat > lib/features/$FEATURE_NAME/presentation/pages/${FEATURE_NAME}_page.dart <<EOL
import 'package:flutter/material.dart';

class ${FEATURE_NAME_CAP}Page extends StatelessWidget {
  const ${FEATURE_NAME_CAP}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('${FEATURE_NAME_CAP} Page')),
      body: const Center(child: Text('Welcome to ${FEATURE_NAME_CAP} Feature')),
    );
  }
}
EOL

echo "✅ Feature '$FEATURE_NAME' created successfully!"
