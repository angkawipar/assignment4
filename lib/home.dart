import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  var totalblue = 0;
  var totalpink = 0;
  var statusButton = true;
  List<bool> list = [false, false, false, false];
  List<int> scoringblue = [];
  List<int> scoringpink = [];

  Widget Scorenull() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 23),
        Container(
          height: 47,
        ),
      ],
    );
  }

  Widget Score(int i) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 5),
        i != 4 ? Text("ROUND $i") : Text("TOTAL"),
        Container(
          height: 47,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: i != 4
                        ? Text(
                      "${scoringblue[i - 1]}",
                      style: TextStyle(fontSize: 17),
                    )
                        : Text(
                      "${totalblue}",
                      style: TextStyle(fontSize: 17),
                    )),
              ),
              Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: i != 4
                        ? Text(
                      "${scoringpink[i - 1]}",
                      style: TextStyle(fontSize: 17),
                    )
                        : Text(
                      "${totalpink}",
                      style: TextStyle(fontSize: 17),
                    )),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.black26.withOpacity(0.1),
          height: 2,
        ),
      ],
    );
  }

  void Click(bool check) {
    for (int i = 0; i < list.length; i++) {
      if (list[i] == false) {
        setState(() {
          list[i] = true;
          if (i == 2) {
            list[i + 1] = true;
            statusButton = false;
          }
          if (check) {
            scoringblue.add(10);
            scoringpink.add(9);
            totalblue += 10;
            totalpink += 9;
          } else {
            scoringblue.add(9);
            scoringpink.add(10);
            totalblue += 9;
            totalpink += 10;
          }
        });
        break;
      }
    }
  }

  Widget Buttonmodel1() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
              onPressed: () {
                for (int i = 0; i < list.length; i++) {
                  if (list[i] == false) {
                    setState(() {
                      Click(true);
                    });
                    break;
                  }
                }
              },
              child: Icon(Icons.person, size: 27),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                primary: Colors.deepPurple[300],
                fixedSize: Size(10,45),
              ),

            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
              onPressed: () {
                for (int i = 0; i < list.length; i++) {
                  if (list[i] == false) {
                    setState(() {
                      Click(false);
                    });
                    break;
                  }
                }
              },
              child: Icon(Icons.person, size: 27),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                primary: Colors.amber[300],
                fixedSize: Size(10,45),
              ),

            ),
          ),
        ),
      ],
    );
  }

  Widget Buttonmodel2() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              child: Container(
                height: 47,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.clear, size: 27),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("OLYMPIC BOXING SCORING", style: TextStyle(fontSize: 22)),
        ),
        backgroundColor: Colors.teal[300],
      ),
      backgroundColor: Colors.teal[100],
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('lg.png'), height: 60, width: 127),
              SizedBox(width: 4),
              Text("TOKYO 2020", style: TextStyle(fontSize: 27)),
            ],
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.teal[300],
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text("Women's Light (57-60kg) Semi-final",
                  style: TextStyle(fontSize: 13)),
            ),
          ),
          Row(
            children: [
              Icon(Icons.person, size: 50, color: Colors.deepPurple[300]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image(
                          image: AssetImage('flag_ireland.png'),
                          width: 30,
                          height: 27),
                      SizedBox(width: 2),
                      Text("IRELAND", style: TextStyle(fontSize: 17)),
                    ],
                  ),
                  Text("HARRINGTON Kellie Anne",
                      style: TextStyle(fontSize: 13)),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.person, size: 50, color: Colors.amber[300]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image(
                          image: AssetImage('flag_thailand.png'),
                          width: 30,
                          height: 27),
                      SizedBox(width: 2),
                      Text("THAILAND", style: TextStyle(fontSize: 17)),
                    ],
                  ),
                  Text("SEESONDEE Sudaporn", style: TextStyle(fontSize: 13)),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 2,
                  color: Colors.deepPurple[300],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 2,
                  color: Colors.amber[300],
                ),
              ),
            ],
          ),
          SizedBox(height: 2),
          for (int i = 0; i < 4; i++)
            list[i] == false ? Scorenull() : Score(i + 1),
          SizedBox(
            height: 2,
          ),
          statusButton == true ?Buttonmodel1():Buttonmodel2(),
        ],
      ),
    );
  }
}