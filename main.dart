import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureConverterApp());
}
class TemperatureConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TemperatureConverter(),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  TextEditingController _inputController = TextEditingController();
  String _selectedUnit = 'Fahrenheit'; // Start with Fahrenheit as default
  String _convertedResult = '';

  void _convertTemperature() {
    double inputValue = double.tryParse(_inputController.text) ?? 0;
    if (_selectedUnit == 'Fahrenheit') { // Swap the logic
      double celsius = (inputValue - 32) * 5 / 9;
      setState(() {
        _convertedResult = '${celsius.toStringAsFixed(2)} °C';
      });
    } else {
      double fahrenheit = (inputValue * 9 / 5) + 32;
      setState(() {
        _convertedResult = '${fahrenheit.toStringAsFixed(2)} °F';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.0),
              BlendMode.darken,
            ),
            child: Card(
              elevation: 8,
              margin: EdgeInsets.all(20),
              color: Colors.black12, // Change card color to black
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _inputController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Temperature',
                        suffixText: '°',
                        suffixStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        icon: Icon(Icons.thermostat, color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    DropdownButton<String>(
                      value: _selectedUnit,
                      items: <String>['Fahrenheit', 'Celsius']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: TextStyle(color: Colors.white)),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedUnit = newValue!;
                        });
                      },
                      icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                      dropdownColor: Colors.black, // Change dropdown box color to black
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _convertTemperature,
                      child: Text('Convert'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      _convertedResult,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
