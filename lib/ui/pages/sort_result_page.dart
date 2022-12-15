import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/sort_bloc.dart';
import 'package:flutter_application_1/ui/components/primary_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SortResult extends StatefulWidget {
  const SortResult({Key? key}) : super(key: key);

  @override
  State<SortResult> createState() => _SortResultState();
}

class _SortResultState extends State<SortResult> {
  final TextEditingController _sortTextBox = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SortBloc>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SortBloc()
            ..add(
              const SortInitialEvent(title: 'Sort Form Result Page'),
            ),
        ),
      ],
      child: BlocBuilder<SortBloc, SortState>(
          bloc: bloc, // provide the local bloc instance
          builder: (context, state) {
            final width = MediaQuery.of(context).size.width;

            return Scaffold(
              appBar: AppBar(
                title: Text(state.title!),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.result.toString(),
                        ),
                        TextButton(
                            onPressed: () {}, child: const Text('Go Back')),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
