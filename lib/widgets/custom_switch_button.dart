import 'package:flutter/material.dart';

class CustomSwitchButton extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitchButton(
      {Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  late bool _switchValue;

  @override
  void initState() {
    super.initState();
    _switchValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        setState(() {
          _switchValue = !_switchValue;
        });
        widget.onChanged(_switchValue);
      },
      child: Container(
        width: screenHeight / 844 * 52,
        height: screenHeight / 844 * 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenHeight / 844 * 14),
          color:
              _switchValue ? const Color(0xFFDABFFF) : const Color(0xFFD9D9D9),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenHeight / 844 * 2),
          child: Container(
            alignment: _switchValue
                ? ((Directionality.of(context) == TextDirection.rtl)
                    ? Alignment.centerRight
                    : Alignment.centerLeft)
                : ((Directionality.of(context) == TextDirection.rtl)
                    ? Alignment.centerLeft
                    : Alignment.centerRight),
            child: Container(
              width: screenHeight / 844 * 20,
              height: screenHeight / 844 * 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _switchValue
                    ? const Color(0xFF6B19DD)
                    : const Color(0xFF707070),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
