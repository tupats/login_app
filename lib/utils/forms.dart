import 'package:reactive_forms/reactive_forms.dart';

final validationMessages = {
  ValidationMessage.required: (error) => 'Field must not be empty',
  ValidationMessage.email: (error) => 'Must enter a valid email',
  ValidationMessage.minLength: (error) => 'Entry is too short',
  ValidationMessage.mustMatch: (error) => 'Passwords must match',
};
