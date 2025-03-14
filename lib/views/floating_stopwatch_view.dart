import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/stopwatch_controller.dart';

class FloatingStopwatchView extends StatelessWidget {
  const FloatingStopwatchView({super.key});

  @override
  Widget build(BuildContext context) {
    final StopwatchController oController = Get.put(StopwatchController());
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Stopwatch',
          style: TextStyle(color: Colors.green[900]), // Change text color
        ),
        centerTitle: true,
        backgroundColor: Colors.green[50], // Change AppBar background color
      ),

      body: Column(
        children: <Widget>[
          Container(
            height: 48,
            color: Colors.green[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
  //              IconButton(
  //                  onPressed: () {
//
  //                  },
  //                  color: Colors.green[900],
  //                  icon: const Icon(Icons.more_vert)
  //              ),
              ],
            ),
          ),
          Container(
            height: 221,
            width: double.maxFinite,
            color: Colors.green[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() =>
                    Text(
                      oController.getFormattedTime(oController.elapsedMilliseconds.value),
                      style:  TextStyle(
                          fontSize: 48, fontWeight: FontWeight.bold, color: Colors.green[900]),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity, // Ensure full width
              color: Colors.green[100], // Background is always green
              child: Obx(() {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Wrap(
                        alignment: WrapAlignment.center, // Keeps items centered
                        spacing: 8, // Horizontal gap
                        runSpacing: 8, // Vertical gap
                        children: List.generate(oController.lapTimes.length, (index) {
                          return SizedBox(
                            width: (MediaQuery.of(context).size.width / 2) - 4, // 2 items per row
                            child: Card(
                              color: Colors.green[50],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Lap ${index + 1}: ${oController.getFormattedTime(oController.lapTimes[index])}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.green[900], // Text color
                                  ),
                                ),

                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),


          Container(
            height: 221,
            color: Colors.green[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(alignment: Alignment.center, children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                          Border.all(color: (Colors.green[900])!, width: 3),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            oController.startStopwatch();
                          },
                          iconSize: 32,
                          color: Colors.green[900],
                          icon: const Icon(Icons.play_arrow)),
                    ]),
                    const SizedBox(
                      width: 24,
                    ),
                    Stack(alignment: Alignment.center, children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                          Border.all(color: (Colors.red[900])!, width: 3),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            oController.stopStopwatch();
                          },
                          iconSize: 32,
                          color: Colors.red[900],
                          icon: const Icon(Icons.pause)),
                    ]),
                    const SizedBox(
                      width: 24,
                    ),
                    Stack(alignment: Alignment.center, children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                          Border.all(color: (Colors.grey[700])!, width: 3),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            oController.resetStopwatch();
                          },
                          iconSize: 32,
                          color: Colors.grey[700],
                          icon: const Icon(Icons.restart_alt)),
                    ]),
                    const SizedBox(
                      width: 24,
                    ),
                    Stack(alignment: Alignment.center, children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                          Border.all(color: (Colors.grey[700])!, width: 3),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            oController.lapStopwatch();
                          },
                          iconSize: 32,
                          color: Colors.grey[700],
                          icon: const Icon(Icons.flag)),
                    ]),
                  ],

                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
//          Center(
//            child: Stack(
//              alignment: Alignment.center,
//              children: [
//                Container(
//                  width: double.infinity, // Adjust the container size as needed
//                  height: 100,
//                  color: Colors.green[200],
//                ),
//                ElevatedButton(
//                  onPressed: () {},
//                  style: ElevatedButton.styleFrom(
//                    backgroundColor: Colors.green[50], // Change this to any color you want
//                    foregroundColor: Colors.green[900], // Text color
//                  ),
//                  child: const Text('Floating Stopwatch'),
//                )
//
//              ],
//            ),
//          )


        ],
      ),
    );
  }
}
