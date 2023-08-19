/* import 'package:circular_countdown_timer/circular_countdown_timer.dart'; */
import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:circular_timer/circular_timer.dart';



class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
  Color colorPurple = Color.fromRGBO(131, 56, 236, 1);
  Color colorPink = Color.fromRGBO(255, 0, 111, 1);
  final CountDownController _controller = CountDownController();
  DateTime _dateTime = DateTime.utc(0, 0, 0, 00, 00, 00, 00, 00);
  dynamic son = 1;
  
  

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Color.fromRGBO(4, 4, 4, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  hourMinuteSecond(),
                  /* Container(
                    margin: EdgeInsets.symmetric(vertical: 50),
                    child: Text(
                      '${_dateTime.hour.toString().padLeft(2, '0')}:${_dateTime.minute.toString().padLeft(2, '0')}:${_dateTime.second.toString().padLeft(2, '0')}',
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ), */
                ],
              ),
            ),
            NeonTimer(),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 36,
                        ),
                        onPressed: () {
                          setState(() {
                            _controller.start();
                          });
                        }),
                    IconButton(
                        icon: const Icon(
                          Icons.pause,
                          color: Colors.white,
                          size: 36,
                        ),
                        onPressed: () {
                          setState(() {
                            _controller.pause();
                          });
                        }),
                    IconButton(
                        icon: const Icon(
                          Icons.deblur,
                          color: Colors.white,
                          size: 36,
                        ),
                        onPressed: () {
                          setState(() {
                            _controller.resume();
                          });
                        }),
                    IconButton(
                        icon: const Icon(
                          Icons.repeat,
                          color: Colors.white,
                          size: 36,
                        ),
                        onPressed: () {
                          _controller.restart();
                          print(son);
                        }),
                  ]),
            ),
          ],
        ),
        
      ),
    );
  }
   
    
     NeonTimer() {
     
      return NeonCircularTimer(
        onComplete: () {
          _controller.pause();
        },

        autoStart: false,
        width: 200,
        textFormat: TextFormat.HH_MM_SS,
        isReverse: true,
        neon: 10,
        controller: _controller,
        duration: son,
        strokeWidth: 10,
        textStyle: const TextStyle(color: Colors.white, fontSize: 36),
        isTimerTextShown: true,
        neumorphicEffect: true,
        outerStrokeColor: Color.fromRGBO(3, 3, 3, 1), //dolan yer arka
        innerFillGradient: LinearGradient(colors: [
          colorPurple,
          colorPink,
        ]),
        neonGradient: LinearGradient(colors: [
          colorPurple,
          colorPink,
        ]),
        strokeCap: StrokeCap.round,
        innerFillColor: Color.fromRGBO(18, 18, 18, 1),
        backgroudColor: Color.fromRGBO(4, 4, 4, 1),
        neonColor: Color.fromRGBO(209, 31, 31, 1));
        
     }
  

  Widget hourMinuteSecond() {
    return TimePickerSpinner(
      time: DateTime.utc(0, 0, 0, 00, 00, 00, 00, 00),
      isShowSeconds: true,
      normalTextStyle: TextStyle(color: Colors.white, fontSize: 28),
      highlightedTextStyle: TextStyle(color: colorPink, fontSize: 28),
      onTimeChange: (time) {
        setState(() {
          controller.duration = time;
        });
      },
    );
  }
  
 
}
