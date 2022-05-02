import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class up_down extends StatefulWidget {
  const up_down({Key? key}) : super(key: key);

  @override
  _up_downState createState() => _up_downState();
}

class _up_downState extends State<up_down> {
  final myController = TextEditingController();
  var upDownData;
  var buttonDownColor = Color(0xffdaccb2);
  var buttonUpColor = Color(0xffd3f6a3);
  var resetFlag = false;

  // Use this for resetFlag
  //if (resetFlag){
  //  myController.clear();
  //  upDownData = null;
  //  resetFlag = false;
  //}

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      child: Row(children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (s) {
            setState(() {
              // Toggle light when tapped.
              buttonDownColor = Color(0xffece4d9);
            });
          },
          onExit: (s) {
            setState(() {
              // Toggle light when tapped.
              buttonDownColor = Color(0xffdaccb2);
            });
          },
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.only(
                    bottomLeft: const Radius.circular(20.0),
                    topLeft: const Radius.circular(20.0),
                  ),
                  color: buttonDownColor),
              child: IconButton(
                hoverColor: Color(0xd3f6a3),
                onPressed: () {
                  print("down button clicked");
                  upDownData = int.parse(myController.text);
                  if (upDownData > 0) {
                    upDownData -= 1;
                    myController.text = (upDownData).toString();
                  }
                  print(upDownData);
                },
                icon: const Icon(Icons.keyboard_arrow_down),
                iconSize: 32,
                color: Color(0xff9e7c47),
              ),
            ),
          ),
        ),
        Expanded(
          child: TextField(
            controller: myController,
            onChanged: (text) {
              upDownData = int.tryParse(myController.text) ?? 0;
              print(upDownData);
            },
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "e.g. 1",
              contentPadding: EdgeInsets.all(8.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (s) {
            setState(() {
              // Toggle light when tapped.
              buttonUpColor = Color(0xffe2f8c7);
            });
          },
          onExit: (s) {
            setState(() {
              // Toggle light when tapped.
              buttonUpColor = Color(0xffd3f6a3);
            });
          },
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.only(
                  bottomRight: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0),
                ),
                color: buttonUpColor,
              ),
              child: IconButton(
                hoverColor: Color(0xd3f6a3),
                onPressed: () {
                  if (myController.text.isEmpty) {
                    myController.text = "0";
                  }
                  print("up button clicked");
                  upDownData = int.parse(myController.text);
                  upDownData += 1;
                  myController.text = (upDownData).toString();
                  print(upDownData);
                },
                icon: const Icon(Icons.keyboard_arrow_up),
                iconSize: 32,
                color: Color(0xff6f9442),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
