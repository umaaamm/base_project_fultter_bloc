#!/bin/bash

FEATURE_NAME=$1

if [ -z "$FEATURE_NAME" ]; then
  echo "❌ Please provide a feature name."
  echo "Usage: ./new_feature.sh feature_name"
  exit 1
fi

mkdir -p lib/features/$FEATURE_NAME/data/repositories
mkdir -p lib/features/$FEATURE_NAME/domain/repositories
mkdir -p lib/features/$FEATURE_NAME/presentation/bloc
mkdir -p lib/features/$FEATURE_NAME/presentation/pages

# Create placeholder files
cat > lib/features/$FEATURE_NAME/domain/repositories/${FEATURE_NAME}_repository.dart <<EOL
abstract class ${FEATURE_NAME^}Repository {}
EOL

cat > lib/features/$FEATURE_NAME/data/repositories/${FEATURE_NAME}_repository_impl.dart <<EOL
import '../../domain/repositories/${FEATURE_NAME}_repository.dart';

class ${FEATURE_NAME^}RepositoryImpl implements ${FEATURE_NAME^}Repository {}
EOL

cat > lib/features/$FEATURE_NAME/presentation/bloc/${FEATURE_NAME}_bloc.dart <<EOL
import 'package:flutter_bloc/flutter_bloc.dart';

part '${FEATURE_NAME}_event.dart';
part '${FEATURE_NAME}_state.dart';

class ${FEATURE_NAME^}Bloc extends Bloc<${FEATURE_NAME^}Event, ${FEATURE_NAME^}State> {
  ${FEATURE_NAME^}Bloc() : super(${FEATURE_NAME^}Initial()) {
    on<${FEATURE_NAME^}Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}
EOL

cat > lib/features/$FEATURE_NAME/presentation/bloc/${FEATURE_NAME}_event.dart <<EOL
part of '${FEATURE_NAME}_bloc.dart';

abstract class ${FEATURE_NAME^}Event {}
EOL

cat > lib/features/$FEATURE_NAME/presentation/bloc/${FEATURE_NAME}_state.dart <<EOL
part of '${FEATURE_NAME}_bloc.dart';

abstract class ${FEATURE_NAME^}State {}

class ${FEATURE_NAME^}Initial extends ${FEATURE_NAME^}State {}
EOL

cat > lib/features/$FEATURE_NAME/presentation/pages/${FEATURE_NAME}_page.dart <<EOL
import 'package:flutter/material.dart';

class ${FEATURE_NAME^}Page extends StatelessWidget {
  const ${FEATURE_NAME^}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('${FEATURE_NAME^} Page')),
      body: const Center(child: Text('Welcome to ${FEATURE_NAME^} Feature')),
    );
  }
}
EOL

echo "✅ Feature $FEATURE_NAME created successfully."