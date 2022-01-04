import 'package:flutter/material.dart';
class _InputChipExample extends StatefulWidget {
  @override
  _InputChipExampleState createState() =>
      _InputChipExampleState();
}

class _InputChipExampleState extends State<_InputChipExample> with TickerProviderStateMixin {

  final List<String> _foodType = ['Newari', 'Maithili', 'Korean', 'Spanish', 'Italian', 'Mexican','Chinese','Japanese'];
  final List<String> _placeType = ['Kathmandu', 'Chitwan', 'Janakpur', 'Pokhara', 'Biratnagar'];

  final List<bool> _selected = [false, false, false, false, false, false,false,false];
  final List<bool> _selected1 = [false, false, false, false, false];

  Widget _buildFoodChips() {

    List<Widget> chips = [];

    for (int i = 0; i < _foodType.length; i++) {
      FilterChip filterChip = FilterChip(
        selected: _selected[i],
        label: Text(_foodType[i], style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.normal,)),
        elevation: 20,
        pressElevation: 20,
        shadowColor: Colors.white60,
        backgroundColor: Color.fromRGBO(229, 229, 229, 90),
        selectedColor: Color.fromRGBO(244, 152, 7, 100),
        showCheckmark: false,
        onSelected: (bool selected) {
          setState(() {
            _selected[i] = selected;
          });
        },
      );

      chips.add(Padding(

        padding: EdgeInsets.all(4.0),
        child: filterChip,

      ));
    }

    return Wrap(
      // This next line does the trick.
      direction: Axis.horizontal,
      children: chips,
    );
  }
  Widget _buildPlaceChips() {

    List<Widget> chips = [];

    for (int i = 0; i < _placeType.length; i++) {
      FilterChip filterChip = FilterChip(
        selected: _selected1[i],
        label: Text(_placeType[i], style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.normal,)),
        elevation: 20,
        pressElevation: 20,
        shadowColor: Colors.white60,
        backgroundColor: Color.fromRGBO(229, 229, 229, 90),
        selectedColor: Color.fromRGBO(244, 152, 7, 100),
        showCheckmark: false,
        onSelected: (bool selected) {
          setState(() {
            _selected1[i] = selected;
          });
        },
      );

      chips.add(Padding(

        padding: EdgeInsets.all(4.0),
        child: filterChip,

      ));
    }

    return Wrap(
      // This next line does the trick.
      direction: Axis.horizontal,
      children: chips,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/img.png',
              fit: BoxFit.contain,
              height: 25,
            ),
          ],

        ),
        backgroundColor:  Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {},
            child: const Text("Skip",style: TextStyle(color:  Color.fromARGB(
                255, 250, 90, 30),decoration: TextDecoration.underline),),
            shape: const CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  child: const Text(
                    "Select Your Choice",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height/4,
                width: double.infinity,
                child: _buildFoodChips(),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  child: const Text(
                    "City You Like To Be In",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height/3,
                width: double.infinity,
                child: _buildPlaceChips(),
              ),
              SizedBox(
                child: RaisedButton(
                  onPressed: () {

                  },
                  textColor: Colors.white,
                  color: Colors.transparent,
                  elevation: 0,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: double.maxFinite,
                    decoration:  BoxDecoration(
                        borderRadius:BorderRadius.circular(20) ,
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 250, 157, 77),
                            Color.fromARGB(255, 255, 119, 76)
                          ],
                        )
                    ),
                    padding: const EdgeInsets.all(15.0),

                    child: const Text(
                      "Go to Home",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }

}