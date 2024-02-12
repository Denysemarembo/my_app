import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CalculatorApp();
  }
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _output = '0';
  double num1 = 0;
  double num2 = 0;
  String operand = '';

  void _buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      _clear();
    } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
      _operandPressed(buttonText);
    } else if (buttonText == '=') {
      _calculate();
    } else {
      _digitPressed(buttonText);
    }
  }

  void _clear() {
    setState(() {
      _output = '0';
      num1 = 0;
      num2 = 0;
      operand = '';
    });
  }

  void _operandPressed(String newOperand) {
    setState(() {
      operand = newOperand;
      num1 = double.parse(_output);
      _output = '0';
    });
  }

  void _digitPressed(String digit) {
    setState(() {
      if (_output == '0') {
        _output = digit;
      } else {
        _output += digit;
      }
    });
  }

  void _calculate() {
    setState(() {
      num2 = double.parse(_output);
      switch (operand) {
        case '+':
          _output = (num1 + num2).toString();
          break;
        case '-':
          _output = (num1 - num2).toString();
          break;
        case '*':
          _output = (num1 * num2).toString();
          break;
        case '/':
          if (num2 != 0) {
            _output = (num1 / num2).toString();
          } else {
            _output = 'Error';
          }
          break;
      }
      operand = '';
      num1 = double.parse(_output);
      num2 = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.lightBlue,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: const TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Divider(),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                itemCount: buttonText.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _buttonPressed(buttonText[index]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isOperator(buttonText[index])
                            ? Color.fromARGB(255, 189, 125, 40)
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(
                        child: Text(
                          buttonText[index],
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: isOperator(buttonText[index])
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String buttonText) {
    return buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '*' ||
        buttonText == '/' ||
        buttonText == '=';
  }

  final List<String> buttonText = [
    '7', '8', '9', '/',
    '4', '5', '6', '*',
    '1', '2', '3', '-',
    'C', '0', '=', '+',
    '(', ')', '.', '%',
  ];
}
