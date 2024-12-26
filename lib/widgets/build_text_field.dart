import 'package:flutter/material.dart';

class BuildTextField extends StatefulWidget {
  const BuildTextField({
    super.key,
    required this.label,
    required this.prefix,
    required this.controller,
    required this.onChanged,
  });


  final String label;
  final String prefix;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  State<BuildTextField> createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: const TextStyle(color: Colors.white, fontSize: 24),
      keyboardType: TextInputType.number,
      cursorColor: Colors.amber,
      decoration: InputDecoration(
          prefix: Text("${widget.prefix} ", style: const TextStyle(fontSize: 25),),
          labelText: widget.label,
          border: const OutlineInputBorder()
      ),
      onChanged: widget.onChanged,
    );
  }
}
