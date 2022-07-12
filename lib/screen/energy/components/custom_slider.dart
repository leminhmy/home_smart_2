import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../../widget/small_text.dart';


class SliderWidgetCustom extends StatefulWidget {
  const SliderWidgetCustom({Key? key, required this.valueDefault}) : super(key: key);
  final double valueDefault;

  @override
  State<SliderWidgetCustom> createState() => _SliderWidgetCustomState();
}

class _SliderWidgetCustomState extends State<SliderWidgetCustom> {
  late double value;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutQuint,
        tween: Tween(begin: 0.0,end: widget.valueDefault),
        builder: (context,double valueAnimation, child) {
          value = valueAnimation;
          return StatefulBuilder(
          builder: (context, setState2) {
            return Row(
              children: [
                Expanded(
                  child: SliderTheme(
                    data: const SliderThemeData(
                      trackHeight: 10,
                      trackShape: GradientRectSliderTrackShape(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.lightBlueAccent,Colors.blue,Colors.indigo],
                          )
                      ),

                    ),
                    child: Slider(
                      value: value,
                      min: 0,
                      max: 100,
                      activeColor: Colors.blue,
                      inactiveColor: Colors.grey.shade300,
                      onChanged: (value) => setState2(() => this.value = value),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                SmallText(text: '${value.toInt()}%'),
              ],
            );
          }
        );
      }
    );
  }
}


class GradientRectSliderTrackShape extends RoundedRectSliderTrackShape
    with BaseSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
  const GradientRectSliderTrackShape({
    this.gradient = const LinearGradient(
      colors: [
        Colors.red,
        Colors.yellow,
      ],
    ),
    this.darkenInactive = true,
  });

  final LinearGradient gradient;
  final bool darkenInactive;

  @override
  void paint(
      PaintingContext context,
      Offset offset,
      {
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required Animation<double> enableAnimation,
        required TextDirection textDirection,
        required Offset thumbCenter,
        bool isDiscrete = false,
        bool isEnabled = false,
        double additionalActiveTrackHeight = 2,
      }
      ) {
    assert(sliderTheme.disabledActiveTrackColor != null);
    assert(sliderTheme.disabledInactiveTrackColor != null);
    assert(sliderTheme.activeTrackColor != null);
    assert(sliderTheme.inactiveTrackColor != null);
    assert(sliderTheme.thumbShape != null);
    assert(sliderTheme.trackHeight != null && sliderTheme.trackHeight! > 0);

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final activeGradientRect = Rect.fromLTRB(
      trackRect.left,
      (textDirection == TextDirection.ltr)
          ? trackRect.top - (additionalActiveTrackHeight / 2)
          : trackRect.top,
      thumbCenter.dx,
      (textDirection == TextDirection.ltr)
          ? trackRect.bottom + (additionalActiveTrackHeight / 2)
          : trackRect.bottom,
    );

    // Assign the track segment paints, which are leading: active and
    // trailing: inactive.
    final ColorTween activeTrackColorTween = ColorTween(
        begin: sliderTheme.disabledActiveTrackColor,
        end: sliderTheme.activeTrackColor);
    final ColorTween inactiveTrackColorTween = darkenInactive
        ? ColorTween(
        begin: sliderTheme.disabledInactiveTrackColor,
        end: sliderTheme.inactiveTrackColor
    )
        : activeTrackColorTween;
    final Paint activePaint = Paint()
      ..shader = gradient.createShader(activeGradientRect)
      ..color = activeTrackColorTween.evaluate(enableAnimation)!;
    final Paint inactivePaint = Paint()
      ..color = inactiveTrackColorTween.evaluate(enableAnimation)!;
    final Paint leftTrackPaint;
    final Paint rightTrackPaint;
    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
    }

    final Radius trackRadius = Radius.circular(trackRect.height / 2);
    final Radius activeTrackRadius = Radius.circular(trackRect.height / 2 + 1);

    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        trackRect.left,
        (textDirection == TextDirection.ltr)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        thumbCenter.dx,
        (textDirection == TextDirection.ltr)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
        bottomLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
      ),
      leftTrackPaint,
    );
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        thumbCenter.dx,
        (textDirection == TextDirection.rtl)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        trackRect.right,
        (textDirection == TextDirection.rtl)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
        bottomRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
      ),
      rightTrackPaint,
    );
  }
}