import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'apft_db.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var tmp = APFTdb();

  var data;
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormFieldState> _specifyTextFieldKey =
      GlobalKey<FormFieldState>();

  ValueChanged _onChanged = (val) => print(val);
  var genderOptions = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          FormBuilder(
//             context,
            key: _fbKey,
//            autovalidate: true,
            readOnly: false,
            child: Column(
              children: <Widget>[
                FormBuilderDropdown(
                  attribute: "gender",
                  decoration: InputDecoration(
                    labelText: "Gender",
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 20,
                      ),
                    ),
                  ),
                  // initialValue: 'Male',
                  hint: Text('Select Gender'),
                  validators: [FormBuilderValidators.required()],
                  items: genderOptions
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text('$gender'),
                          ))
                      .toList(),
                ),
                SizedBox(height: 15),
                FormBuilderTextField(
                  attribute: "age",
                  decoration: InputDecoration(
                    labelText: "Age",
                  ),
                  onChanged: _onChanged,
                  valueTransformer: (text) {
                    return text == null ? null : num.tryParse(text);
                  },
                  validators: [
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                    // FormBuilderValidators.max(70),
                    FormBuilderValidators.minLength(2, allowEmpty: false),
                  ],
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 15),
                FormBuilderTextField(
                  attribute: "push-ups",
                  decoration: InputDecoration(
                    labelText: "Push-Ups",
                  ),
                  onChanged: _onChanged,
                  valueTransformer: (text) {
                    return text == null ? null : num.tryParse(text);
                  },
                  validators: [
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                    // FormBuilderValidators.max(70),
                    FormBuilderValidators.minLength(1, allowEmpty: false),
                  ],
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 15),
                FormBuilderTextField(
                  attribute: "sit-ups",
                  decoration: InputDecoration(
                    labelText: "Sit-Ups",
                  ),
                  onChanged: _onChanged,
                  valueTransformer: (text) {
                    return text == null ? null : num.tryParse(text);
                  },
                  validators: [
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                    // FormBuilderValidators.max(70),
                    FormBuilderValidators.minLength(1, allowEmpty: false),
                  ],
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FormBuilderTextField(
                        attribute: "run-minutes",
                        decoration: InputDecoration(
                          labelText: "Run (Minutes)",
                        ),
                        onChanged: _onChanged,
                        valueTransformer: (text) {
                          return text == null ? null : num.tryParse(text);
                        },
                        validators: [
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                          // FormBuilderValidators.max(70),
                          FormBuilderValidators.minLength(1, allowEmpty: false),
                        ],
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Expanded(
                      child: FormBuilderTextField(
                        attribute: "run-seconds",
                        decoration: InputDecoration(
                          labelText: "Run (Seconds)",
                        ),
                        onChanged: _onChanged,
                        valueTransformer: (text) {
                          return text == null ? null : num.tryParse(text);
                        },
                        validators: [
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                          // FormBuilderValidators.max(70),
                          FormBuilderValidators.minLength(1, allowEmpty: false),
                        ],
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          MaterialButton(
            height: 60,
            color: Theme.of(context).accentColor,
            child: Text(
              "Submit",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              if (_fbKey.currentState.saveAndValidate()) {
                print(_fbKey.currentState.value);
              } else {
                print(_fbKey.currentState.value);
                print("validation failed");
              }
            },
          ),
          SizedBox(height: 30),
          MaterialButton(
            height: 60,
            color: Theme.of(context).accentColor,
            child: Text(
              "Reset",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              _fbKey.currentState.reset();
            },
          ),
        ],
      ),
    );
  }
}
