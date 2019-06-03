import 'package:flutter/material.dart';
import 'package:animator/animator.dart';
import 'package:flutter/widgets.dart';

class Loader extends StatelessWidget {
  Loader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Add box decoration
      color: Colors.white,
      child: Stack(children:[
        getListMessage(3),
        Align(alignment: Alignment.bottomLeft, child:  Indicator())]),
      );
  }

  Widget getListMessage(int number){
   return  Column(children: <Widget>[
            getMessage(),
            getMessage(),
            getMessage(),
          ],);
  }

  Widget getMessage(){
   return  Container(
          height: 90,
          padding: EdgeInsets.all(20),
          child: Column(children: <Widget>[
            SizedBox(width: double.infinity,height: 10,child: Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(3),color: Colors.blueGrey[50]),),),
            Spacer(),
            SizedBox(width: double.infinity,height: 10,child: Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(3),color: Colors.blueGrey[50]),),),
            Spacer(),
            SizedBox(width: double.infinity,height: 10,child: Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(3),color: Colors.blueGrey[50]),),),
          ],),
        );
  }

}



class Indicator extends StatelessWidget {
  Indicator({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Animator(
      tween: Tween<double>(begin: 0,end: MediaQuery.of(context).size.width),
      cycles: 0,
      duration: Duration(seconds: 3),
      builder: (anim) =>Container( 
      padding: EdgeInsets.only(left: anim.value),
      //transform: Matrix4.translationValues(-80.0, 0, 0.0),
      child:new RotationTransition(
  turns: new AlwaysStoppedAnimation(-1 / 360), child:Container( 
      width: 80,
      
      decoration: BoxDecoration(
        // Box decoration takes a gradient
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment(-1.0,-1.0),
          end: Alignment(1.0, -1.0),
          //tileMode: TileMode.mirror,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0,0.5,1],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Color.fromARGB(0x00, 0xFF, 0xFF, 0xFF),
            Color.fromARGB(0xFF, 0xFF, 0xFF, 0xFF),
            Color.fromARGB(0x00, 0xFF, 0xFF, 0xFF),
          ],
        ),
      ),
     child:SizedBox(width: 0,height: double.infinity,),
     ))));
  }
}
