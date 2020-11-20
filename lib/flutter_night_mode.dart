import 'package:flutter/material.dart';
import 'package:night_mode/night_mode.dart';
import 'delegate/index.dart';

class NightMode extends StatelessWidget {
  final Widget child;
  final LightDelegate delegate;
  final bool alwaysOn;
  final Duration duration;
  final Gradient nightGradient;

  NightMode({
    @required this.child,
    this.alwaysOn = false,
    this.duration = const Duration(milliseconds: 500),
    this.delegate = const DefaultLightDelegate(),
    this.nightGradient = const LinearGradient(
      colors: [Colors.black, Colors.black],
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        ShaderMask(
          blendMode: BlendMode.srcOut,
          shaderCallback: (bounds) {
            return nightGradient.createShader(bounds);
          },
          child: _LightModeDrag(
            duration: duration,
            alwaysOn: alwaysOn,
            delegate: delegate,
          ),
        )
      ],
    );
  }
}

class _LightModeDrag extends StatefulWidget {
  final Duration duration;
  final bool alwaysOn;
  final LightDelegate delegate;

  _LightModeDrag({this.duration, this.alwaysOn, this.delegate});

  @override
  _LightModeDragState createState() => _LightModeDragState();
}

class _LightModeDragState extends State<_LightModeDrag>
    with SingleTickerProviderStateMixin {
  Offset touchOffset;
  Offset animationOffset;
  Offset panStartOffset;
  AnimationController animationController;

  Duration get duration => widget.duration;

  bool get alwaysOn => widget.alwaysOn;

  LightDelegate get delegate => widget.delegate;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: duration, vsync: this);
    animationController.addListener(() {
      if (panStartOffset != null) {
        setState(() {
          animationOffset = Offset.lerp(
            panStartOffset,
            touchOffset,
            animationController.value,
          );
        });
      }
    });
  }

  @override
  void didUpdateWidget(_LightModeDrag oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.alwaysOn != alwaysOn) {
      touchOffset = null;
    }
  }

  onPanStart(DragStartDetails details) {
    setState(() {
      if (touchOffset != null) {
      print(animationController.status);
        panStartOffset = touchOffset;
        animationController.forward(from: 0).whenComplete(() {
          setState(() {
            animationOffset = null;
            panStartOffset = null;
            animationController.value = 0;
          });
        });
      }
      touchOffset = details.localPosition;
    });
  }

  onPanUpdate(DragUpdateDetails details) {
    setState(() {
      touchOffset = details.localPosition;
    });
  }

  onPanEnd(DragEndDetails details) {
    if (alwaysOn == false) {
      setState(() {
        touchOffset = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return GestureDetector(
          onPanStart: onPanStart,
          onPanUpdate: onPanUpdate,
          onPanEnd: onPanEnd,
          child: Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            color: Colors.transparent,
            child: CustomPaint(
              painter: LightPainter(
                delegate: delegate,
                touchOffset: animationOffset ?? touchOffset,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
