import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class jobdescription extends StatefulWidget{
  @override
  _jobdescriptionstate createState() => _jobdescriptionstate();
}

class _jobdescriptionstate extends State<jobdescription>{
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
                  onPressed: () =>Navigator.of(context).pop(),
                ),
                Text("2/3",style:TextStyle(color: Colors.white,fontSize: 25)),
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
                Text('Description',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0)),
                SizedBox(width:90.0),
               
                ClipOval(
  child: Material(
    color: Colors.white, // button color
    child: InkWell(
      splashColor: Color(0xFF21BFBD), // inkwell color
      child: SizedBox(width: 56, height: 56, child: Icon(Icons.arrow_forward_ios,color: Colors.black,)),
      onTap: () {
        
        Navigator.pushNamed(context,'/third');
      
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
            
          )
        ],
      ),
    );
  }

}