import 'dart:math';
import 'package:bmi/result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key}) : super(key: key);
  final double sliderHeight;
  final int min;
  final int max;
  final fullWidth;

  const MyHomePage(
      {this.sliderHeight = 48,
      this.max = 220,
      this.min = 0,
      this.fullWidth = false});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightVal = 170;
  int weidht = 55;
  int age = 18;
  double paddingFactor = .2;
  double _value = 0;
  @override
  Widget build(BuildContext context) {
    // if (this.widget.fullWidth) paddingFactor = .3;
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: const Color(0xFF04040C),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m1Expanded(context, 'male'),
                    const SizedBox(width: 10),
                    m1Expanded(context, 'female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF272A4E),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Height',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              heightVal.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            const Text(
                              'cm',
                              style: TextStyle(
                                  color: Colors.white24,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Slider(
                          thumbColor: Color(0xFFFF0067),
                          inactiveColor: Color(0xFFFFFFFF),
                          activeColor: Color(0xFFFF0067),
                          value: heightVal,
                          onChanged: (newVal) {
                            setState(() {
                              heightVal = newVal;
                            });
                          },
                          min: 90,
                          max: 220,
                        ),
                        // Container(
                        //   width: widget.fullWidth
                        //       ? double.infinity
                        //       : (widget.sliderHeight) * 5.5,
                        //   height: (widget.sliderHeight),
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.all(
                        //       Radius.circular((widget.sliderHeight * .3)),
                        //     ),
                        //     gradient: const LinearGradient(
                        //       colors: [
                        //         Color(0xFF00c6ff),
                        //         Color(0xFF0072ff),
                        //       ],
                        //       begin: FractionalOffset(0.0, 0.0),
                        //       end: FractionalOffset(1.0, 1.00),
                        //       stops: [0.0, 1.0],
                        //       tileMode: TileMode.clamp,
                        //     ),
                        //   ),
                        //   child: Padding(
                        //     padding: EdgeInsets.fromLTRB(
                        //       widget.sliderHeight * paddingFactor,
                        //       2,
                        //       widget.sliderHeight * paddingFactor,
                        //       2,
                        //     ),
                        //     child: Row(
                        //       children: <Widget>[
                        //         Text(
                        //           '${widget.min}',
                        //           textAlign: TextAlign.center,
                        //           style: TextStyle(
                        //             fontSize: widget.sliderHeight * .3,
                        //             fontWeight: FontWeight.w700,
                        //             color: Colors.white,
                        //           ),
                        //         ),
                        //         SizedBox(
                        //           width: widget.sliderHeight * .1,
                        //         ),
                        //         Expanded(
                        //           child: Center(
                        //             child: SliderTheme(
                        //               data: SliderTheme.of(context).copyWith(
                        //                 activeTrackColor:
                        //                     Colors.white.withOpacity(1),
                        //                 inactiveTrackColor:
                        //                     Colors.white.withOpacity(.5),

                        //                 trackHeight: 4.0,
                        //                 thumbShape: CustomSliderThumbCircle(
                        //                   thumbRadius: widget.sliderHeight * .4,
                        //                   min: widget.min,
                        //                   max: widget.max,
                        //                 ),
                        //                 overlayColor:
                        //                     Colors.white.withOpacity(.4),
                        //                 //valueIndicatorColor: Colors.white,
                        //                 activeTickMarkColor: Colors.white,
                        //                 inactiveTickMarkColor:
                        //                     Colors.red.withOpacity(.7),
                        //               ),
                        //               child: Slider(
                        //                   value: _value,
                        //                   onChanged: (value) {
                        //                     setState(() {
                        //                       _value = value;
                        //                     });
                        //                   }),
                        //             ),
                        //           ),
                        //         ),
                        //         SizedBox(
                        //           width: widget.sliderHeight * .1,
                        //         ),
                        //         Text(
                        //           '${widget.max}',
                        //           textAlign: TextAlign.center,
                        //           style: TextStyle(
                        //             fontSize: widget.sliderHeight * .3,
                        //             fontWeight: FontWeight.w700,
                        //             color: Colors.white,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                     
                     
                      ],
                    )),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m2Expanded(context, 'Weight'),
                    const SizedBox(width: 10),
                    m2Expanded(context, 'Age'),
                  ],
                ),
              ),
            ),
            Container(
              color: const Color(0xFFFF0067),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 15,
              child: TextButton(
                onPressed: () {
                  var result = weidht / pow(heightVal / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Result(result: result, isMale: isMale, age: age),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    )),
                child: const Text('CALCULATE YOUR BMI'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => isMale = (type == 'male') ? true : false),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF272A4E),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              type == 'male'
                  ? Icon(
                      Icons.male,
                      color: (isMale && type == 'male') ||
                              (!isMale && type == 'female')
                          ? Colors.white
                          : Colors.white24,
                      size: 90,
                    )
                  : Icon(
                      Icons.female,
                      color: (isMale && type == 'male') ||
                              (!isMale && type == 'female')
                          ? Colors.white
                          : Colors.white24,
                      size: 90,
                    ),
              const SizedBox(
                height: 15,
              ),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style:
                    (isMale && type == 'male') || (!isMale && type == 'female')
                        ? Theme.of(context).textTheme.headline1
                        : Theme.of(context).textTheme.headline2,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF141A3C),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type,
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              type == 'Weight' ? '$weidht' : '$age',
              style: Theme.of(context).textTheme.headline3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  backgroundColor: const Color(0xFF212747),
                  heroTag: type == 'Weight' ? 'age++' : 'weight++',
                  onPressed: () {
                    setState(() {
                      type == 'Weight' ? weidht++ : age++;
                    });
                  },
                  mini: true,
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  backgroundColor: const Color(0xFF212747),
                  heroTag: type == 'Weight' ? 'age--' : 'weight--',
                  onPressed: () {
                    setState(() {
                      type == 'Weight' ? weidht-- : age--;
                    });
                  },
                  mini: true,
                  child: const Icon(Icons.remove),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final int min;
  final int max;

  const CustomSliderThumbCircle({
    required this.thumbRadius,
    this.min = 0,
    this.max = 220,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = Colors.white //Thumb Background Color
      ..style = PaintingStyle.fill;

    TextSpan span = TextSpan(
      style: TextStyle(
        fontSize: thumbRadius * .8,
        fontWeight: FontWeight.w700,
        color: sliderTheme.thumbColor, //Text Color of Value on Thumb
      ),
      text: getValue(value),
    );

    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter =
        Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawCircle(center, thumbRadius * .9, paint);
    tp.paint(canvas, textCenter);
  }

  String getValue(double value) {
    return (min + (max - min) * value).round().toString();
  }
}
