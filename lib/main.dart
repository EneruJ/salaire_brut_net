import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salaire Brut à Net',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Salaire Brut à Net'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double statut = 0.78;
  double _value = 100;
  double _value2 = 20;
  final _hb = TextEditingController();
  final _hn = TextEditingController();
  final _mb = TextEditingController();
  final _mn = TextEditingController();
  final _ab = TextEditingController();
  final _an = TextEditingController();
  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'ONE';

  // Group Value for Radio Button.
  int id = 0;

  void _calcSalaire() {
    setState(() {
      double val = double.parse(_hb.text);
      _hn.text = (val * statut * (_value / 100)).toStringAsFixed(0);
      _mb.text = (val * 151.55 * (_value / 100)).toStringAsFixed(0);
      _mn.text = (val * statut * 151.55 * (_value / 100)).toStringAsFixed(0);
      _ab.text = (val * 1818.6 * (_value / 100) + (val * 151.55 * (_value / 100)) * id).toStringAsFixed(0);
      _an.text = (val * statut * 1818.6 * (_value / 100) + (val * 151.55 * statut * (_value / 100)) * id ).toStringAsFixed(0) ;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                Widget>[
              ResponsiveGridRow(children: [
                ResponsiveGridCol(
                    lg: 1000,
                    child: Container(
                        height: MediaQuery.of(context).size.height - 56,
                        alignment: const Alignment(0, 0),
                        color: Colors.white,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                const Text('Horaire brut'),
                                                SizedBox(
                                                  width: 200,
                                                  child: TextField(
                                                    controller: _hb,
                                                    decoration: const InputDecoration(
                                                      labelText: '€',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    onChanged: (v){
                                                      setState(() {
                                                        _calcSalaire();
                                                      });
                                                    },
                                                    inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter.digitsOnly,
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 20.0),
                                                const Text('Mensuel brut'),
                                                SizedBox(
                                                  // <-- SEE HERE
                                                  width: 200,
                                                  child: TextField(
                                                    controller: _mb,
                                                    decoration: const InputDecoration(
                                                      labelText: '€',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter.digitsOnly,
                                                    ],
                                                    onChanged: (v){
                                                      setState(() {
                                                        _calcSalaire();
                                                      });
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(height: 20.0),
                                                const Text('Annuel brut'),
                                                SizedBox(
                                                  // <-- SEE HERE
                                                  width: 200,
                                                  child: TextField(
                                                    controller: _ab,
                                                    decoration: const InputDecoration(
                                                      labelText: '€',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter.digitsOnly,
                                                    ],
                                                    onChanged: (v){
                                                      setState(() {
                                                        _calcSalaire();
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ]),
                                          Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                const Text('Horaire net'),
                                                SizedBox(
                                                  // <-- SEE HERE
                                                  width: 200,
                                                  child: TextField(
                                                    controller: _hn,
                                                    decoration: const InputDecoration(
                                                      labelText: '€',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter.digitsOnly,
                                                    ],
                                                    onChanged: (v){
                                                      setState(() {
                                                        _calcSalaire();
                                                      });
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(height: 20.0),
                                                const Text('Mensuel net'),
                                                SizedBox(
                                                  // <-- SEE HERE
                                                  width: 200,
                                                  child: TextField(
                                                    controller: _mn,
                                                    decoration: const InputDecoration(
                                                      labelText: '€',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter.digitsOnly,
                                                    ],
                                                    onChanged: (v){
                                                      setState(() {
                                                        _calcSalaire();
                                                      });
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(height: 20.0),
                                                const Text('Annuel net'),
                                                SizedBox(
                                                  // <-- SEE HERE
                                                  width: 200,
                                                  child: TextField(
                                                    controller: _an,
                                                    decoration: const InputDecoration(
                                                      labelText: '€',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter.digitsOnly,
                                                    ],
                                                    onChanged: (v){
                                                      setState(() {
                                                        _calcSalaire();
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ]),
                                        ]),
                                    const SizedBox(height: 20.0),
                                    const Text(
                                        'STATUT :'),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Radio(
                                          value: 0.78,
                                          groupValue: statut,
                                          onChanged: (val) {
                                            setState(() {
                                              radioButtonItem = '0.78';
                                              statut = val as double;
                                              _calcSalaire();
                                            });
                                          },
                                        ),
                                        const Text(
                                          'Salarié non-cadre',
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                        Radio(
                                          value: 0.75,
                                          groupValue: statut,
                                          onChanged: (val) {
                                            setState(() {
                                              radioButtonItem = '0.75';
                                              statut = val as double;
                                              _calcSalaire();
                                            });
                                          },
                                        ),
                                        const Text(
                                          'Salarié cadre',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        Radio(
                                          value: 0.85,
                                          groupValue: statut,
                                          onChanged: (val) {
                                            setState(() {
                                              radioButtonItem = '0.85';
                                              statut = val as double;
                                              _calcSalaire();
                                            });
                                          },
                                        ),
                                        const Text(
                                          'Fonction publique',
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                        Radio(
                                          value: 0.55,
                                          groupValue: statut,
                                          onChanged: (val) {
                                            setState(() {
                                              radioButtonItem = '0.55';
                                              statut = val as double;
                                              _calcSalaire();
                                            });
                                          },
                                        ),
                                        const Text(
                                          'Profession libérale',
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                        Radio(
                                          value: 0.49,
                                          groupValue: statut,
                                          onChanged: (val) {
                                            setState(() {
                                              radioButtonItem = '0.49';
                                              statut = val as double;
                                              _calcSalaire();
                                            });
                                          },
                                        ),
                                        const Text(
                                          'Portage salarial',
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ]),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Text('TEMPS DE TRAVAIL :'),
                                    SizedBox(
                                      // <-- SEE HERE
                                        width: 400,
                                        child: SfSlider(
                                          min: 0.0,
                                          max: 100.0,
                                          value: _value,
                                          interval: 10,
                                          stepSize: 10,
                                          showTicks: true,
                                          showLabels: true,
                                          enableTooltip: true,
                                          onChanged: (dynamic value) {
                                            setState(() {
                                              _value = value;
                                              _calcSalaire();
                                            });
                                          },
                                        )),
                                    const SizedBox(height: 20.0),
                                    const Text(
                                        'NOMBRE DE MOIS DE PRIME CONVENTIONNELLE :'),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Radio(
                                          value: 0,
                                          groupValue: id,
                                          onChanged: (val) {
                                            setState(() {
                                              radioButtonItem = '0';
                                              id = 0;
                                              _calcSalaire();
                                            });
                                          },
                                        ),
                                        const Text(
                                          '12',
                                          style: TextStyle(fontSize: 17.0),
                                        ),
                                        Radio(
                                          value: 1,
                                          groupValue: id,
                                          onChanged: (val) {
                                            setState(() {
                                              radioButtonItem = '1';
                                              id = 1;
                                              _calcSalaire();
                                            });
                                          },
                                        ),
                                        const Text(
                                          '13',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                          ),
                                        ),
                                        Radio(
                                          value: 2,
                                          groupValue: id,
                                          onChanged: (val) {
                                            setState(() {
                                              radioButtonItem = '2';
                                              id = 2;
                                              _calcSalaire();
                                            });
                                          },
                                        ),
                                        const Text(
                                          '14',
                                          style: const TextStyle(fontSize: 17.0),
                                        ),
                                        Radio(
                                          value: 3,
                                          groupValue: id,
                                          onChanged: (val) {
                                            setState(() {
                                              radioButtonItem = '3';
                                              id = 3;
                                              _calcSalaire();
                                            });
                                          },
                                        ),
                                        const Text(
                                          '15',
                                          style: TextStyle(fontSize: 17.0),
                                        ),
                                        Radio(
                                          value: 4,
                                          groupValue: id,
                                          onChanged: (val) {
                                            setState(() {
                                              radioButtonItem = '4';
                                              id = 4;
                                              _calcSalaire();
                                            });
                                          },
                                        ),
                                        const Text(
                                          '16',
                                          style: const TextStyle(fontSize: 17.0),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20.0),
                                    const Text('TAUX DE PRÉLÉVEMENT À LA SOURCE :'),
                                    SizedBox(
                                      // <-- SEE HERE
                                        width: 400,
                                        child: SfSlider(
                                          min: 0.0,
                                          max: 43.0,
                                          value: _value2,
                                          interval: 10,
                                          stepSize: 0.1,
                                          showTicks: true,
                                          showLabels: true,
                                          enableTooltip: true,
                                          onChanged: (dynamic value) {
                                            setState(() {
                                              _value2 = value;

                                            });
                                          },
                                        )),
                                  ])
                            ])))
              ])
            ])));
  }
}
