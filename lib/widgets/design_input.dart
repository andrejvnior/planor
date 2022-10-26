import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DesignInput extends StatefulWidget {
  DesignInput({
    Key? key,
    this.initialValue,
    required this.hint,
    this.onChanged,
    this.onTap,
    this.obscureText = false,
    this.prefixIcon,
    this.isValid = true,
    this.textInputType = TextInputType.text,
    this.textEditingController,
  }) : super(key: key);

  final String? initialValue;
  final String hint;
  final Function(String)? onChanged;
  final void Function()? onTap;
  final Widget? prefixIcon;
  bool obscureText;
  final bool isValid;
  final TextInputType textInputType;
  final TextEditingController? textEditingController;

  @override
  State<DesignInput> createState() => _DesignInputState();
}

class _DesignInputState extends State<DesignInput> {
  bool isPassword = false;

  @override
  void initState() {
    isPassword = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      initialValue: widget.initialValue,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      obscureText: widget.obscureText,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        hintText: widget.hint,
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.isValid)
              Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            if (isPassword)
              TextButton(
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
                child: Text(
                  widget.obscureText ? 'Show' : 'Hide',
                ),
              ),
          ],
        ),
      ),
    );
  }
}
