class Duration {
  double _ms = 0;

  Duration(double ms) {
    if (ms >= 0) {
      this._ms = ms;
    } else {
      throw Exception("Duration cannot be negative");
    }
  }

  Duration.fromHours(double hr):this._ms = hr*3600000;
  Duration.fromMinutes(double mn):this._ms = mn*60000;
  Duration.fromSeconds(double s):this._ms = s*1000;

  double toHours() => (_ms/3600000);
  double toMinutes() => _ms/60000;
  double toSeconds() => _ms/1000;

  Duration operator+(Duration other) {
    return Duration(_ms + other._ms);
  }
  Duration operator-(Duration other) {
    return Duration(_ms - other._ms);
  }
  bool operator>(Duration other) {
    if(_ms > other._ms) {
      return true;
    }else {
      return false;
    }
  }

  @override
  String toString() {
    // int hours = (_ms ~/ 3600000);
    // int minutes = ((_ms % 3600000) ~/ 60000);
    // int seconds = ((_ms % 60000) ~/ 1000);
    // int milliseconds = (_ms % 1000).toInt();

    // String two(int n) => n.toString().padLeft(2, '0');
    // String three(int n) => n.toString().padLeft(3, '0');
    // return "${two(hours)}:${two(minutes)}:${two(seconds)}:${three(milliseconds)}";

    // return "$hours:$minutes:$seconds:$milliseconds";
    return "$_ms";
  }
}

void main()  {
  Duration twoMin = Duration(120000);
  Duration sixSec = Duration(6000);
  // Duration negDur = Duration(-888);
  print(twoMin.toHours());
  print((twoMin + sixSec).toMinutes()); // got 2.1
  print((twoMin - sixSec).toSeconds()); // got 114.0
  print(twoMin > sixSec); 
  print(sixSec > twoMin);
}