import 'package:flutter/material.dart';

class InputIcon extends StatefulWidget {
  final controller;
  final title;
  final placeholder;
  final icon;
  final type;
  final Color color;
  final Color colorIcon;
  final Color background;
  final Color border;
  final Color labelColor;
  final errorText;
  final bool obscureText;
  final FocusNode focusNode;
  final bool enabled;
  final bool showLabel;
  final ValueChanged<String> onChanged;
  int maxLines;

  InputIcon(
    this.controller,
    this.title,
    this.icon, {
    this.type = TextInputType.text,
    this.obscureText = false,
    this.errorText,
    this.color,
    this.border,
    this.background,
    this.focusNode,
    this.colorIcon,
    this.enabled,
    this.onChanged,
    this.showLabel,
    this.maxLines,
    this.labelColor,
    this.placeholder,
  });

  @override
  _InputIconState createState() => _InputIconState();
}

class _InputIconState extends State<InputIcon> {
  @override
  Widget build(BuildContext context) {

    if(widget.controller.text == 'null'){
      setState(() {
        widget.controller.text = "";
      });

      print(widget.controller.text == 'null');
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.showLabel != null && !widget.showLabel
              ? Container()
              : Text(
                  widget.title,
                  style: TextStyle(fontSize: 16.0, color: widget.labelColor ?? Colors.black),
                ),
          widget.showLabel != null && !widget.showLabel
              ? Container()
              : SizedBox(
                  height: 5.0,
                ),
          Container(
            height: widget.maxLines == null ? 60.0 : null,
            child: TextField(
              controller: widget.controller,
              keyboardType: widget.type,
              obscureText: widget.obscureText,
              focusNode: widget.focusNode,
              onChanged: widget.onChanged,
              maxLines: widget.maxLines ?? 1,
              enabled: widget.enabled ?? true,
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 17.0,
                  color: widget.color ?? Colors.black),
              decoration: InputDecoration(
                  hintText: widget.placeholder ?? widget.title,
                  errorText: widget.errorText,
                  hintStyle: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 17.0,
                      color: widget.color ?? Colors.black),
                  filled: true,
                  prefixIcon: widget.icon != null ? Icon(
                    widget.icon,
                    color: widget.colorIcon ?? Color(0xFF0bb70b),
                  ) : null,
                  fillColor: widget.background ?? Colors.white,
                  contentPadding: const EdgeInsets.all(20.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                        color: widget.border ?? Color(0xFF2125ff), width: 2.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
