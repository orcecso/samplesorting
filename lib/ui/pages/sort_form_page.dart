import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/sort_bloc.dart';
import 'package:flutter_application_1/ui/components/primary_textfield.dart';
import 'package:flutter_application_1/ui/pages/sort_result_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SortForm extends StatefulWidget {
  const SortForm({Key? key}) : super(key: key);

  @override
  State<SortForm> createState() => _SortFormState();
}

class _SortFormState extends State<SortForm> {
  final TextEditingController _sortTextBox = TextEditingController();
  String? _selectedDropdown;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  GlobalKey? dropdownButtonKey;
  final List<String> strategy = [
    'Select Strategy',
    'Quick Sort',
    'Merge Sort',
    'Bubble Sort'
  ];
  String defaultDropdown = 'Select Strategy';
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocConsumer<SortBloc, SortState>(
      listener: (context, state) {
        print(state.title);
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Scaffold(
            appBar: AppBar(
              //change later
              title: Text(state.title.toString()),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: width / 1.3,
                    child: PrimaryTextField(
                      inputController: _sortTextBox,
                      enabled: true,
                      labelText: 'Type a Text here',
                      labelStyle: const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        decoration: TextDecoration.none,
                      ),
                      contentPadding: const EdgeInsets.all(16),
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: 'Please Input a Text before proceeding'),
                      ]),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    width: width / 1.5,
                    height: 50,
                    child: DropdownButtonFormField<String>(
                      hint: Text(
                        defaultDropdown,
                      ),
                      value: _selectedDropdown,
                      key: dropdownButtonKey,
                      items: strategy.map<DropdownMenuItem<String>>(
                        (value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        },
                      ).toList(),
                      icon: const Icon(Icons.keyboard_arrow_down_sharp),
                      onChanged: (val) {
                        _selectedDropdown = val;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () => handleClear(),
                          child: const Text('Clear')),
                      TextButton(
                          onPressed: () => _submitResult(),
                          child: const Text('Submit')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void handleClear() {
    formKey.currentState?.reset();
    _sortTextBox.clear();
  }

  void _submitResult() {
    if (formKey.currentState!.validate()) {
      context.read<SortBloc>().add(SortBlocResult(
          result: _sortTextBox.text,
          sortingStrategy: _selectedDropdown.toString(),
          title: 'Sort Form Demo Page'));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SortResult()),
      );
    }
  }
}
