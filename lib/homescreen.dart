import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
class homescreen extends StatefulWidget{
  @override
  _homescreenstate createState() => _homescreenstate();
}

class _homescreenstate extends State<homescreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  
                  color: Colors.white,
                  onPressed: () 
                    =>Navigator.of(context).pop(),
                  
                ),
                Text("1/3",style:TextStyle(color: Colors.white,fontSize: 25)),
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Job',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Details',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0)),
                SizedBox(width:110.0),
                ClipOval(
  child: Material(
    color: Colors.white, // button color
    child: InkWell(
      splashColor: Color(0xFF21BFBD), // inkwell color
      child: SizedBox(width: 56, height: 56, child: Icon(Icons.arrow_forward_ios,color: Colors.black,)),
      onTap: () {
        Navigator.pushNamed(context,'/second');
      },
    ),
  ),
)

              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ), 
          
             child: Padding(
               padding: EdgeInsets.only(top:50,left:20,right: 20),
               child: Column(
                 children:<Widget>[
                   TextField(
                     keyboardType: TextInputType.text,
                     style:TextStyle(
                       fontSize: 15,
                       height: 0.2,
                       
                     ) ,

                     decoration: InputDecoration(
                       labelText: 'I want to hire a',
                       border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(10),
                       ),
                       focusedBorder: OutlineInputBorder(
                         borderSide: const BorderSide(color:Color(0xFF21BFBD),width: 2.0),
                         borderRadius:BorderRadius.circular(10),
                         
                       )
                     ),
                   )

                   
                 ]
               ),
             ),
          ),
         

          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: _myState,
                        iconSize: 30,
                        icon: (null),
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        hint: Text('Select State'),
                        onChanged: (String newValue) {
                          setState(() {
                            _myState = newValue;
                            _getCitiesList();
                            print(_myState);
                          });
                        },
                        items: statesList?.map((item) {
                              return new DropdownMenuItem(
                                child: new Text(item['name']),
                                value: item['id'].toString(),
                              );
                            })?.toList() ??
                            [],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
         
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: _myCity,
                        iconSize: 30,
                        icon: (null),
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        hint: Text('Select City'),
                        onChanged: (String newValue) {
                          setState(() {
                            _myCity = newValue;
                            print(_myCity);
                          });
                        },
                        items: citiesList?.map((item) {
                              return new DropdownMenuItem(
                                child: new Text(item['name']),
                                value: item['id'].toString(),
                              );
                            })?.toList() ??
                            [],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
      //CALLING STATE API HERE
// Get State information by API
  List statesList;
  String _myState;

  String stateInfoUrl = 'http://cleanions.bestweb.my/api/location/get_state';
  Future<String> _getStateList() async {
    await http.post(stateInfoUrl, headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }, body: {
      "api_key": '25d55ad283aa400af464c76d713c07ad',
    }).then((response) {
      var data = json.decode(response.body);

//      print(data);
      setState(() {
        statesList = data['state'];
      });
    });
  }

  // Get State information by API
  List citiesList;
  String _myCity;

  String cityInfoUrl =
      'http://cleanions.bestweb.my/api/location/get_city_by_state_id';
  Future<String> _getCitiesList() async {
    await http.post(cityInfoUrl, headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }, body: {
      "api_key": '25d55ad283aa400af464c76d713c07ad',
      "state_id": _myState,
    }).then((response) {
      var data = json.decode(response.body);

      setState(() {
        citiesList = data['cities'];
      });
    });
  }
}
  

