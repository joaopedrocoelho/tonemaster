import "dart:math";

double convertDegreesToRadians(double degree) {
  double radians;
  if (degree == 0) {
    radians = 360 * pi /180;
  } else {
  radians = degree * pi /180;
  }
  return radians;
}