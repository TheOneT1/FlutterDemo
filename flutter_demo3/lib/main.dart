import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget{

    @override
  _MyAppState createState() => _MyAppState();
  
}

class _MyAppState extends State<MyApp> {
  int _count = 0;
  String _time = "0";
  Ticker _ticker;
  String _beginButtonText = "开始";

  _MyAppState(){
    _ticker = new Ticker((Duration duration){
        setState(() {
          _time = (15-duration.inSeconds).toString();
          if(15-duration.inSeconds==0){
            _ticker.stop(canceled: true);
            _beginButtonText = "开始";
          }
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
          appBar: new AppBar(title: new Text('Flutter点点1'),),
          body: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("还剩$_time秒"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("一共点了$_count次"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.grey,
                      colorBrightness: Brightness.light,
                      child: Text(_beginButtonText),
                      onPressed:(){
                        if(_ticker.isTicking){
                          _ticker.stop(canceled: true);
                          setState(() {
                            _beginButtonText = "开始";
                          });
                        }else{
                          _ticker.start();
                          setState(() {
                            _beginButtonText = "结束";
                            _count = 0;
                          });
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.grey,
                      colorBrightness: Brightness.light,
                      child: Text('点我'),
                      onPressed:(){
                        if(_ticker.isTicking){
                          setState(() {
                            _count++;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          )),
        ),
      );
  }
}
