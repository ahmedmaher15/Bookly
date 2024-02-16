
import 'package:flutter/material.dart';

class SlidingWidget extends StatelessWidget {
  const SlidingWidget({
    super.key,
    required this.slidingAnimation,
    required this.slidingAnimation2,
    required this.slidingAnimation3,
  });

  final Animation<Offset> slidingAnimation;
  final Animation<Offset> slidingAnimation2;
  final Animation<Offset> slidingAnimation3;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context,_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: slidingAnimation,
                child: const Text(
                  'Read ',
                  textAlign: TextAlign.center,
                ),
              ), SlideTransition(
                position: slidingAnimation2,
                child: const Text(
                  'free',
                  textAlign: TextAlign.center,
                ),
              ),
              SlideTransition(
                position: slidingAnimation3,
                child: const Text(
                  ' Books',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        }
    );
  }
}
