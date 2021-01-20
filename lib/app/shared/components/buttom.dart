import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Buttom extends StatefulWidget {

  final GestureTapCallback onPressed;
  final String title;
  final bool load;
  final Color background;
  final Color color;
  final Color background2;
  final Color border;
  final double elevation;
  final Widget icon;


  Buttom(this.title, this.load, {@required this.onPressed, this.background, this.border, this.color, this.background2, this.elevation, this.icon});

  @override
  _ButtomState createState() => _ButtomState();
}

class _ButtomState extends State<Buttom> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 60.0,
      child: GestureDetector(
        child: Container(
          width: width,
          height: 60.0,
          decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: widget.border ?? Colors.transparent),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [widget.background ?? Color(0xFF1cd11c), widget.background2 ?? widget.background ?? Color(0xFF1cd11c)])),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            widget.icon != null ? widget.icon : Container(),

            widget.load ? Container(
              width: 30.0,
              height: 30.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(widget.color),
              ),
            ) : Container(),
            widget.load ? SizedBox(
              width: 10.0,
            ): Container(),
            Text(widget.title.toString(),
                style: TextStyle(
                    fontSize: 19,
                    color: widget.color ?? Colors.white,
                    textBaseline: TextBaseline.alphabetic,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold)),
          ],
        ),),
        onTap: widget.onPressed,
      ),
    );
  }
}