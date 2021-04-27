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
          ), Container(alignment: Alignment.center, child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Row(mainAxisSize: MainAxisSize.min, children: [
              new ShapedButton(
                  icon: IconData(61759, fontFamily: 'MaterialIcons'),
                  typeIcon: IconData(57663, fontFamily: 'MaterialIcons'),
                  inputColor: Color(0xfffee4d1),
                  title: 'City bus',
                  description: 'Routes cover most of central Lappeenranta',
                  onTap: () {print('Functionality for viewing bus routes is not implemented in this prototype.');}),
              new ShapedButton(
                  icon: IconData(61759, fontFamily: 'MaterialIcons'),
                  typeIcon: IconData(59634, fontFamily: 'MaterialIcons'),
                  inputColor: Color(0xffb7d3dd),
                  title: 'City bikes',
                  description: 'Available in multiple bike parks in the city',
                  onTap: () {print('Functionality for viewing city bike locations is not implemented in this prototype.');})
            ]),
            Row(mainAxisSize: MainAxisSize.min, children: [
              new ShapedButton(
                  icon: IconData(61759, fontFamily: 'MaterialIcons'),
                  typeIcon: IconData(59067, fontFamily: 'MaterialIcons'),
                  inputColor: Color(0xffe9f7fe),
                  title: 'LOAS cars',
                  description: 'Five cars located in Skinnarila & center',
                  onTap: () {print('Functionality for viewing car renting availabilities is not implemented in this prototype.');}),
              SizedBox(width: 166)
            ])
          ]))
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

//Creates a single box shaped button with parameters that can be declared
// on creating a new class of this type. This approach allows us to easily add new
// methods of transportation into the UI.
class ShapedButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData icon;
  final IconData typeIcon;
  final Color inputColor;
  final String title;
  final String description;

  const ShapedButton(
      {Key key,
        this.icon,
        this.typeIcon,
        this.title,
        this.description,
        this.inputColor,
        this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 150.0;
    return new InkResponse(
        onTap: onTap,
        child: new Container(
            width: size,
            height: size,
            margin: EdgeInsets.all(8),
            decoration: (new ShapeDecoration(
                color: inputColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)))),
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Icon(typeIcon, size: 70, color: Color(0xff828282)),
                    new SizedBox(width: 20),
                    new Icon(icon, size: 50, color: Color(0xff828282))
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    new Container(
                        padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                        width: size,
                        height: 25,
                        child:
                        new Text(title,
                            style: new TextStyle(fontSize: 15, color: Color(0xff828282))))
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    new Container(
                        padding: EdgeInsets.only(left: 8, right: 8, top: 4),
                        width: size,
                        height: 50,
                        child: new Text(description,
                            style: new TextStyle(fontSize: 13, color: Color(0xff828282))))
                  ])
            ])));}}