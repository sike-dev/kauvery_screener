import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Yesno_Button extends StatefulWidget {
  final Text child;
  static const List<Widget> options_yesno = <Widget>[
    Text('Yes'),
    Text('No'),
  ];
  final Function(String) onAnswer;
  Yesno_Button({super.key, required this.child, required this.onAnswer});

  @override
  State<Yesno_Button> createState() => _Yesno_ButtonState();
}

class _Yesno_ButtonState extends State<Yesno_Button> {
  final List<bool> _selectedOption = <bool>[false, true];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 5,
        ),
        widget.child,
        ToggleButtons(
          direction: Axis.horizontal,
          onPressed: (int index) {
            setState(() {
              // The button that is tapped is set to true, and the others to false.
              for (int i = 0; i < _selectedOption.length; i++) {
                _selectedOption[i] = i == index;
              }
            });
            if (index == 0) {
              widget.onAnswer("Yes");
            } else {
              widget.onAnswer("No");
            }
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          selectedBorderColor: Colors.blue[700],
          selectedColor: Colors.white,
          fillColor: Colors.blue[200],
          color: Colors.blue[400],
          constraints: const BoxConstraints(
            minHeight: 30.0,
            minWidth: 40.0,
          ),
          isSelected: _selectedOption,
          children: Yesno_Button.options_yesno,
        ),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
