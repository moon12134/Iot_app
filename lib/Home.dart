import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _lowerValueCar = 50;
  double _upperValueCar = 180;
  double _lowerValuelight  = 50;
  double _upperValuelight = 180;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args ?? "智慧路燈 ： "),
      ),
      body: Column(children: [
        Expanded(
          flex: 5,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Opacity(
                  opacity: 0.8,
                  child: Icon(
                    Icons.wb_sunny,
                    color: Colors.yellow,
                    size: 150,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('狀態:正常', style: TextStyle(fontSize: 20)),
                    Text('亮度:65%', style: TextStyle(fontSize: 20)),
                    Text('控制:自動', style: TextStyle(fontSize: 20)),
                    Text('檢查:2020/01/01', style: TextStyle(fontSize: 20)),
                    Text('年限:2020/01/01', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade300,
                    child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text('車流控制模擬器',
                                style: TextStyle(fontSize: 26))),
                        Expanded(
                            flex: 8,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 5,
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text('車流量')),
                                        Expanded(
                                          flex: 7,
                                          child: FlutterSlider(
                                            axis: Axis.vertical,
                                            values: [
                                              _lowerValueCar,
                                              _upperValueCar
                                            ],
                                            rangeSlider: true,
                                            max: 500,
                                            min: 0,
                                            rtl: true,
                                            onDragging: (handlerIndex,
                                                lowerValue, upperValue) {
                                              _lowerValueCar = lowerValue;
                                              _upperValueCar = upperValue;
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Text('Max: ' +
                                                _lowerValueCar.toString() +
                                                'Car/min')),
                                        Expanded(
                                            flex: 1,
                                            child: Text('Min: ' +
                                                _upperValueCar.toString() +
                                                'Car/min'))
                                      ],
                                    )),
                                Expanded(
                                    flex: 5,
                                    child: Column(
                                      children: [

                                        Expanded(
                                            flex: 1,
                                            child: Text('亮度')),
                                        Expanded(
                                          flex: 7,
                                          child: FlutterSlider(
                                            axis: Axis.vertical,
                                            values: [
                                              _lowerValuelight,
                                              _upperValuelight
                                            ],
                                            rangeSlider: true,
                                            max: 500,
                                            min: 0,
                                            rtl: true,
                                            onDragging: (handlerIndex,
                                                lowerValue, upperValue) {
                                              _lowerValuelight = lowerValue;
                                              _upperValuelight = upperValue;
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Text('Light: ' +
                                                _lowerValuelight.toString() +
                                                '%')),
                                      ],
                                    )),
                                Expanded(
                                  flex: 5,
                                  child: CustomRadioButton(
                                    spacing: 0,
                                    defaultSelected: "1",
                                    horizontal: true,
                                    enableButtonWrap: false,
                                    width: 20,
                                    absoluteZeroSpacing: false,
                                    selectedColor:
                                        Theme.of(context).accentColor,
                                    padding: 10,
                                    elevation: 0,
                                    unSelectedColor:
                                        Theme.of(context).canvasColor,
                                    buttonLables: [
                                      '正常',
                                      '異常',
                                      '損毀',
                                    ],
                                    buttonValues: [
                                      "1",
                                      "2",
                                      "3",
                                    ],
                                    buttonTextStyle: ButtonTextStyle(
                                        selectedColor: Colors.white,
                                        unSelectedColor: Colors.black,
                                        textStyle: TextStyle(fontSize: 16)),
                                    radioButtonValue: (value) {
                                      print(value);
                                    },
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    color: Colors.grey.shade300,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Text('歷史紀錄', style: TextStyle(fontSize: 30)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
