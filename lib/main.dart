import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordup_flutter_test/screens/definition_screen.dart';
import 'package:wordup_flutter_test/utlis/theme/app_theme.dart';
import 'package:wordup_flutter_test/utlis/theme/theme_provider.dart';

void main() {
  runApp(
    Root(),
  );
}

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  ThemeProvider themeProvider = ThemeProvider();

  void getTheme() async {
    themeProvider.setTheme = await themeProvider.themePreference.getTheme();
  }

  @override
  void initState() {
    super.initState();
    getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (buildContext) {
        return themeProvider;
      },
      child: Consumer<ThemeProvider>(
        builder: (buildContext, value, child) => MaterialApp(
          theme: AppTheme.theme(
            theme: themeProvider.theme,
          ),
          debugShowCheckedModeBanner: false,
          home: DefinitionScreen(),
        ),
      ),
    );
  }
}
