import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/sort_bloc.dart';
import 'package:flutter_application_1/ui/pages/sort_form_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SortBloc()
              ..add(
                const SortInitialEvent(title: 'Sort Form Demo Page'),
              ),
          ),
        ],
        child: const SortForm(),
      ),
    );
  }
}
