import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search/features/presentation/cubit/search_cubit.dart';
import 'package:movie_search/features/presentation/pages/search_page.dart';
import 'injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();                       // GetIt setup
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<SearchCubit>()),
      ],
      child: MaterialApp(
        title: 'TMDb Search',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true),
        home: const SearchPage(),
      ),
    );
  }
}