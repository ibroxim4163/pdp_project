import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdp_project/src/common/services/api_service.dart';
import 'package:pdp_project/src/feature/sign_in/repository/sign_in_repository.dart';

import 'package:pdp_project/src/feature/sign_in/sign_in_screen.dart';

import 'src/feature/sign_in/bloc/sign_in_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => SignInBloc(
          SignInRepositoryImp(
            APIService(),
          ),
        ),
        child: const SignIn(),
      ),
    );
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
