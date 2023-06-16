import 'package:flutter/material.dart';
import 'package:login_app/themes/themes.dart';
import 'package:login_app/utils/forms.dart';
import 'package:reactive_forms/reactive_forms.dart';

Widget createScreen(Widget screen) => MaterialApp(
      theme: theme,
      home: ReactiveFormConfig(
        validationMessages: validationMessages,
        child: screen,
      ),
    );
