import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  var name = TextEditingController();
  var weightCont = TextEditingController();
  var ftCont = TextEditingController();
  var inCont = TextEditingController();
  var result = "";
  var bgColor = const Color.fromARGB(255, 55, 160, 246);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 71, 125),
        title: Text(
          'BMI',
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: const Color.fromARGB(255, 182, 200, 220)),
        ),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                    label: Text('Enter your name'),
                    prefixIcon: Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: weightCont,
                  decoration: InputDecoration(
                    label: Text('Enter your weight in kg'),
                    prefixIcon: Icon(Icons.line_weight_rounded),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ftCont,
                  decoration: InputDecoration(
                    label: Text('Enter your height in feet'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: inCont,
                  decoration: InputDecoration(
                    label: Text('Enter your height in inches'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      var nam = name.text.toString();
                      var wt = weightCont.text.toString();
                      var ft = ftCont.text.toString();
                      var it = inCont.text.toString();

                      if (wt != "" && ft != "" && it != "") {
                        var weight = int.parse(wt);
                        var feet = int.parse(ft);
                        var inch = int.parse(it);

                        var iInch = (feet * 12) + inch;
                        var tCm = iInch * 2.54;
                        var tM = tCm / 100;
                        var bmi = weight / (tM * tM);
                        var msg = "";

                        if (bmi > 25) {
                          msg = "You are Overweight!!";
                          bgColor = const Color.fromARGB(255, 228, 184, 89);
                        } else if (bmi < 18) {
                          msg = "You are Underweight!";
                          bgColor = const Color.fromARGB(255, 225, 164, 160);
                        } else {
                          msg = "You are Healthy!";
                          bgColor = const Color.fromARGB(255, 144, 224, 147);
                        }
                        setState(() {
                          result =
                              "$msg\n $nam BMI is: ${bmi.toStringAsFixed(2)}";
                        });
                      } else {
                        setState(() {
                          result = "Fill all requirements";
                        });
                      }
                    },
                    child: Text('Calculate')),
                SizedBox(
                  height: 10,
                ),
                Text(
                  result,
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
