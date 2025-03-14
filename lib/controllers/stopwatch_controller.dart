import 'dart:async';
import 'package:get/get.dart';

class StopwatchController extends GetxController {
  RxInt elapsedMilliseconds = 0.obs;
  RxBool isRunning = false.obs;
  RxList<int> lapTimes = <int>[].obs;
  Stopwatch stopwatch = Stopwatch();
  StreamSubscription? timer;

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  String getFormattedTime(int millis) {
    int minutes = (millis ~/ 60000);
    int seconds = (millis ~/ 1000 % 60);
    int miliSeconds = (millis % 1000) ~/ 10;
    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}:'
        '${miliSeconds.toString().padLeft(2, '0')}';
  }

  void lapStopwatch(){
    if(stopwatch.isRunning){
      lapTimes.add(stopwatch.elapsedMilliseconds);
    }
  }

  void startStopwatch() {
    if (!stopwatch.isRunning) {
      stopwatch.start();
      isRunning.value = true;

      timer?.cancel();
      timer = Stream.periodic(const Duration(milliseconds: 30), (_) {
        elapsedMilliseconds.value = stopwatch.elapsedMilliseconds;
        elapsedMilliseconds.refresh();
      }).listen((_) {});
    }
  }

  void stopStopwatch() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
      isRunning.value = false;
      timer?.cancel();
    }
  }

  void resetStopwatch() {
    stopStopwatch();
    stopwatch.reset();
    elapsedMilliseconds.value = 0;
    lapTimes.clear();
    elapsedMilliseconds.refresh();
  }
}
