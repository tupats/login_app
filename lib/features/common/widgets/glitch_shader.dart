import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

import 'ticking_builder.dart';

class GlitchShader extends StatelessWidget {
  final Widget child;
  const GlitchShader({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      (context, shader, _) {
        return TickingBuilder(
          builder: (context, time) {
            return AnimatedSampler(
              (image, size, canvas) {
                shader.setFloat(0, size.width);
                shader.setFloat(1, size.height);
                shader.setFloat(2, time);
                shader.setImageSampler(0, image);

                canvas.drawRect(
                  Rect.fromLTWH(0, 0, size.width, size.height),
                  Paint()..shader = shader,
                );
              },
              child: child,
            );
          },
        );
      },
      assetKey: 'shaders/glitch.frag',
    );
  }
}
