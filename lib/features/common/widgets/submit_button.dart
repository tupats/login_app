import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SubmitButton extends StatefulWidget {
  final String title;
  final Future<void> Function()? onPressed;
  const SubmitButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  bool loading = false;

  Future<void> submit() async {
    setState(() {
      loading = true;
    });
    await widget.onPressed?.call();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final valid = ReactiveForm.of(context)?.valid ?? false;
    return ElevatedButton(
      onPressed: valid && !loading ? submit : null,
      child: loading ? const CircularProgressIndicator() : Text(widget.title),
    );
  }
}
