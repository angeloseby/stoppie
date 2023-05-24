import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stoppie/pallete.dart';
import 'package:stoppie/timer_provider.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class StopwatchScreen extends StatelessWidget {
  const StopwatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPallete.scaffoldColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Title Components
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Stopwatch",
                      style: FontPallete.titleTextStyle,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'assets/svgs/stopwatch.svg',
                      width: 24,
                    ),
                  ],
                ),
                // Timer
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: screenSize.width * 0.4692,
                      height: screenSize.width * 0.4692,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: ColorPallete.outerCircleColor,
                              begin: const Alignment(-1, 1),
                              end: Alignment.topCenter,
                              stops: const [0.0, 0.2, 0.6, 0.8]),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(6, 6),
                              blurRadius: 36,
                              spreadRadius: 0,
                              color: Colors.black.withOpacity(0.51),
                            ),
                            BoxShadow(
                              offset: const Offset(-5, -5),
                              blurRadius: 16,
                              spreadRadius: 0,
                              color: Colors.white.withOpacity(0.33),
                            ),
                            const BoxShadow(
                              offset: Offset(3, 3),
                              blurRadius: 15,
                              spreadRadius: 0,
                              color: Colors.black,
                            )
                          ]),
                    ),
                    Container(
                      width: screenSize.width * 0.3871,
                      height: screenSize.width * 0.3871,
                      decoration: const BoxDecoration(
                        color: ColorPallete.scaffoldColor,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          gradient: RadialGradient(colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.1)
                          ], stops: const [
                            0.80,
                            1,
                          ]),
                        ),
                      ),
                    ),
                    Text(
                      Provider.of<TimerProvider>(context).currentTimerValue,
                      style: FontPallete.timerTextStyle,
                    ),
                  ],
                ),

                //Flagpoints
                Container(
                  alignment: Alignment.center,
                  width: screenSize.width * 0.4800,
                  height: screenSize.height * 0.1500,
                  child: Consumer<TimerProvider>(
                      builder: (context, snapshot, child) {
                    return ListWheelScrollView.useDelegate(
                      controller: FixedExtentScrollController(
                        initialItem: snapshot.timerFlags.length,
                      ),
                      itemExtent: screenSize.height * 0.0236,
                      physics: const FixedExtentScrollPhysics(),
                      perspective: 0.005,
                      squeeze: 0.8,
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: snapshot.timerFlags.length,
                        builder: (context, index) {
                          return Text(
                            '#${index + 1}    ${snapshot.timerFlags[index]}',
                            style: FontPallete.flagTextStyle,
                          );
                        },
                      ),
                    );
                  }),
                ),

                //Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Provider.of<TimerProvider>(context, listen: false)
                            .resetTimer();
                      },
                      child: Container(
                        width: screenSize.width * 0.2200,
                        height: screenSize.height * 0.0600,
                        decoration: BoxDecoration(
                          color: ColorPallete.buttonColor,
                          borderRadius: BorderRadius.circular(
                            (screenSize.height * 0.0367) / 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(1, 2),
                              blurRadius: 15,
                              spreadRadius: 0,
                              color: Colors.black.withOpacity(0.31),
                            ),
                            BoxShadow(
                              offset: const Offset(-3, -3),
                              blurRadius: 4,
                              spreadRadius: 0,
                              color: const Color(0xFF545454).withOpacity(0.26),
                            ),
                            BoxShadow(
                              offset: const Offset(3, 3),
                              blurRadius: 4,
                              spreadRadius: 0,
                              color: Colors.black.withOpacity(0.41),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "Reset",
                            style: FontPallete.buttonTextStyle,
                          ),
                        ),
                      ),
                    ),

                    //StartStop Button
                    GestureDetector(
                      onTap: () {
                        Provider.of<TimerProvider>(context, listen: false)
                                .started
                            ? Provider.of<TimerProvider>(context, listen: false)
                                .pauseTimer()
                            : Provider.of<TimerProvider>(context, listen: false)
                                .startTimer();
                      },
                      child: Container(
                        width: screenSize.width * 0.1500,
                        height: screenSize.width * 0.1500,
                        decoration: BoxDecoration(
                          color: ColorPallete.buttonColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(-1, -3),
                              blurRadius: 4,
                              spreadRadius: 0,
                              color: const Color(0xFF545454).withOpacity(0.26),
                            ),
                            BoxShadow(
                              offset: const Offset(4, 3),
                              blurRadius: 8,
                              spreadRadius: 0,
                              color: Colors.black.withOpacity(0.44),
                            ),
                            BoxShadow(
                              inset: true,
                              offset: const Offset(1.4, 0.5),
                              blurRadius: 2,
                              spreadRadius: 0,
                              color: Colors.white.withOpacity(0.6),
                            ),
                            BoxShadow(
                              inset: true,
                              offset: const Offset(-4, -4),
                              blurRadius: 5,
                              spreadRadius: 0,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ],
                        ),
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFFFF5C00),
                                Color(0xFFFF9900),
                                Color(0xFFE3B308)
                              ],
                              stops: [0.1, 0.3, 0.9],
                            ).createShader(bounds);
                          },
                          child: Icon(
                            Provider.of<TimerProvider>(context).started
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white,
                            size: 40,
                            shadows: const [
                              BoxShadow(
                                offset: Offset(0, 0),
                                color: Color(0xFFFF9900),
                                blurRadius: 9,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Share button

                    Container(
                      width: screenSize.width * 0.2200,
                      height: screenSize.height * 0.0600,
                      decoration: BoxDecoration(
                        color: ColorPallete.buttonColor,
                        borderRadius: BorderRadius.circular(
                          (screenSize.height * 0.0367) / 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(1, 2),
                            blurRadius: 15,
                            spreadRadius: 0,
                            color: Colors.black.withOpacity(0.31),
                          ),
                          BoxShadow(
                            offset: const Offset(-3, -3),
                            blurRadius: 4,
                            spreadRadius: 0,
                            color: const Color(0xFF545454).withOpacity(0.26),
                          ),
                          BoxShadow(
                            offset: const Offset(3, 3),
                            blurRadius: 4,
                            spreadRadius: 0,
                            color: Colors.black.withOpacity(0.41),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Share",
                          style: FontPallete.buttonTextStyle,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
