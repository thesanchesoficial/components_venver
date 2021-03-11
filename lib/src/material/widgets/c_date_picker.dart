import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MSDatePicker extends StatelessWidget {

  final String labelText;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;
  final EdgeInsets margin;
  final Widget child;
  final String hintText;
  final String errorText;
  final bool readOnly;
  final Icon icon;
  final VoidCallback onPressedSuffix;

  const MSDatePicker(
    {Key key,
      this.child,
      this.labelText,
      this.valueText,
      this.valueStyle,
      this.margin,
      this.onPressedSuffix,
      this.icon,
      this.readOnly = false,
      this.hintText,
      this.onPressed,
      this.errorText,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: InkWell(
        onTap: onPressed,
        child: InputDecorator(
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).cardColor,
            labelText: labelText,
            hintText: hintText,
            errorText: errorText,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor)
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor)
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            labelStyle: TextStyle(color: Theme.of(context).primaryTextTheme.bodyText1.color),
            errorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.red),
            ),
            errorStyle: TextStyle(color: Colors.red),
            suffixIcon: (icon != null)
              ? IconButton(
                icon: icon,
                onPressed: onPressedSuffix,
              ) : null,
          ),
          baseStyle: valueStyle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(valueText, style: valueStyle),
              Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey.shade700
                  : Colors.white70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
