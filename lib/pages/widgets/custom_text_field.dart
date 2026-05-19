import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final int maxLines;
  final IconData icon;
  const CustomTextField({super.key, required this.controller, required this.label,  this.isPassword = false,  this.maxLines= 1, required this.icon,});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _obscureText = widget.isPassword;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 10),
    child: TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      maxLines: widget.maxLines,
      style: const TextStyle(color: Colors.white, fontSize: 18),
      validator: (text) => text == null || text.isEmpty ? 'Please enter ${widget.label}' : null,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon, color: Colors.white,),
        labelText: widget.label,
        labelStyle: const TextStyle(color: Colors.white54),
        fillColor: Colors.black26,
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        
          
        ),
        suffixIcon: widget.isPassword ? IconButton(
          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off, color: Colors.white54,),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ) : null,
      ),
    ),);
  }
}