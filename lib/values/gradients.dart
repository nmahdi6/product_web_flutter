part of values;

class Gradients {
  static const LinearGradient curvesGradient3 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF88CEBC),
      Color(0xFF69C7C6),
    ],
  );

  static const Gradient darkOverlayGradient = LinearGradient(
    begin: Alignment(0.51436, 1.07565),
    end: Alignment(0.51436, -0.03208),
    stops: [
      0,
      0.17571,
      1,
    ],
    colors: [
      Color.fromARGB(180, 60, 70, 85),
      Color.fromARGB(180, 60, 70, 85),
      Color.fromARGB(20, 45, 45, 45),
    ],
  );

  static const Gradient discoverCardOverlayGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [
      0,
      1,
    ],
    colors: [
      Color.fromRGBO(27, 87, 85, 0.4),
      Color.fromRGBO(27, 87, 85, 0.4),
    ],
  );

  static const Gradient primaryGradient = RadialGradient(
    center: Alignment.centerRight,
//    focalRadius: 1.0,
    radius: 1.0,
    colors: [
      AppColors.accentColor,
      AppColors.primaryColor,
    ],
  );

  static const Gradient try1 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    stops: [0.5, 1.0],
    colors: [
      Color(0xFF43cea2),
      Color(0xFF185a9d),
    ],
  );

  static const Gradient try2 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    stops: [0.5, 1.0],
    colors: [
      Color(0xFFc33764),
      Color(0xFF1d2671),
    ],
  );
}
