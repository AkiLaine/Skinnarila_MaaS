import 'package:flutter/material.dart';

void main() {
  runApp(Vehicles());
}

class Vehicles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vehicle screen',
      theme: ThemeData(
        primaryColor: Colors.white, //Theme colour
      ),
      home: VehicleScreen(),
    );
  }
}

class VehicleScreen extends StatefulWidget {
  @override
  _VehicleScreenState createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {

  //Desired icon colors to variables using the HexColor class
  Color lightOrange = HexColor("#FECCA8");
  Color darkOrange = HexColor("#FF9D56");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicle screen"),
      ),
      
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
                "Our vehicle options",
                style: TextStyle(fontSize: 24.0),
              ),
              margin: EdgeInsets.fromLTRB(0, 30, 0, 5),
              alignment: Alignment.topCenter,
          ),
          Container(
              child: Text(
                "Click the plus sign to view availabilities in a map.",
                style: TextStyle(fontSize: 13.0),
              ),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              alignment: Alignment.topCenter,
          ),
        ]
      ),//Column inside body

      //Creating the bottom navigation bar and its settings
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        iconSize: 35,
        elevation: 0.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        //Creating the icons on the bar
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.euro, color: lightOrange),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus_outlined, color: darkOrange),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined, color: lightOrange),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined, color: lightOrange),
            label: ""
          ),
        ]
      )//bottomNavigationBar
    );
  }
}

//Class that transforms hex color strings into Flutter usable format
//https://stackoverflow.com/questions/50081213/how-do-i-use-hexadecimal-color-strings-in-flutter
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
