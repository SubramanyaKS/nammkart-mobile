import 'package:flutter/material.dart';

class AnimatedIconButton extends StatefulWidget {
  const AnimatedIconButton({
    super.key,
    required this.onAdd,
    required this.iconData,
  });

  final VoidCallback onAdd;
  final IconData iconData;

  @override
  State<AnimatedIconButton> createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<AnimatedIconButton> {
  bool _showCheck = false;

  void _onTap() {
    widget.onAdd();

    setState(() {
      _showCheck = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _showCheck = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: 50,
      height: 50,
      child: ElevatedButton(
        onPressed: _onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: _showCheck? Colors.green:Colors.deepPurple,
          shape: CircleBorder(),
          padding: EdgeInsets.all(5),
        ),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (child, animation) =>
              ScaleTransition(scale: animation, child: child),
          child: Icon(
            _showCheck ? Icons.check : widget.iconData,
            key: ValueKey(_showCheck),
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
