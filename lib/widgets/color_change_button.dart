import 'package:flutter/material.dart';
import 'package:personal_portfolio/shared/constants/commonStyle.dart';
import '../responsive.dart';

class ColorChageButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const ColorChageButton({Key? key, required this.text, required this.onTap})
      : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: DesktopCCButton(text: text, onTap: onTap),
      mediumScreen: TabCCButton(text: text, onTap: onTap),
      smallScreen: MobileCCButton(text: text, onTap: onTap),
    );
  }
}

class MobileCCButton extends StatefulWidget {
  final String text;
  final Function() onTap;
  const MobileCCButton({Key? key, required this.text, required this.onTap})
      : super(key: key);
  @override

  // ignore: library_private_types_in_public_api
  _MobileCCButtonState createState() => _MobileCCButtonState();
}

class _MobileCCButtonState extends State<MobileCCButton> {
  double _animatedWidth = 0.0;
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    // theme
    var theme = Theme.of(context);

    return Stack(
      children: [
        if (!isHover)
          Container(
            height: 40,
            width: 125,
            decoration: BoxDecoration(
              border: Border.all(color:  Colors.white, width: 1.5),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 40,
          width: _animatedWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            gradient: CommonStyle.pinkpurple,
          ),
        ),
        InkWell(
          onHover: (value) {
            setState(() {
              isHover = !isHover;
              _animatedWidth = value ? 125 : 0.0;
            });
          },
          onTap: () {
            setState(() => _animatedWidth = 125);
            widget.onTap();
          },
          child: SizedBox(
            height: 40,
            width: 125,
            child: Center(
              child: Text(
                widget.text.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TabCCButton extends StatefulWidget {
  final String text;
  final Function() onTap;
  const TabCCButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  @override

  // ignore: library_private_types_in_public_api
  _TabCCButtonState createState() => _TabCCButtonState();
}

class _TabCCButtonState extends State<TabCCButton> {
  double _animatedWidth = 0.0;
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    // theme
    var theme = Theme.of(context);

    return Stack(
      children: [
        if (!isHover)
          Container(
            height: 40,
              width: 200,
            decoration: BoxDecoration(
              border: Border.all(color:  Colors.white, width: 2),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 40,
          width: _animatedWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: CommonStyle.pinkpurple,
          ),
        ),
        InkWell(
            onHover: (value) {
              setState(() {
                isHover = !isHover;
                _animatedWidth = value ? 200 : 0.0;
              });
            },
            onTap: () {
              setState(() => _animatedWidth = 200);
              widget.onTap();
            },
            child: SizedBox(
              height: 40,
                width: 200,
              child: Center(
                child: Text(
                  widget.text.toUpperCase(),
                  style: TextStyle(
                    color:  Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            )),
      ],
    );
  }
}

class DesktopCCButton extends StatefulWidget {
  final String text;
  final Function() onTap;
  const DesktopCCButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  @override

  // ignore: library_private_types_in_public_api
  _DesktopCCButtonState createState() => _DesktopCCButtonState();
}

class _DesktopCCButtonState extends State<DesktopCCButton> {
  double _animatedWidth = 0.0;
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Stack(
      children: [
        if (!isHover)
          Container(
            height: 40,
            width: 160,
            decoration: BoxDecoration(
              border: Border.all(color:  Colors.white, width: 3),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 40,
          width: _animatedWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: CommonStyle.pinkpurple,
          ),
        ),
        InkWell(
          onHover: (value) {
            setState(() {
              isHover = !isHover;
              _animatedWidth = value ? 160 : 0.0;
            });
          },
          onTap: () {
            setState(() => _animatedWidth = 160);
            widget.onTap();
          },
          child: SizedBox(
            height: 40,
            width: 160,
            child: Center(
              child: Text(
                widget.text.toUpperCase(),
                style: TextStyle(
                  color: isHover ? Colors.white : CommonStyle.magenta,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
