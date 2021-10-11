import 'package:align_positioned/align_positioned.dart';
import 'package:animate_do/animate_do.dart';
import 'package:day40/pages/send_money.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({ Key? key }) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<dynamic> _contacts = [
    {
      'name': 'John',
      'avatar': 'assets/images/avatar-1.png',
    },
    {
      'name': 'Samantha',
      'avatar': 'assets/images/avatar-2.png',
    },
    {
      'name': 'Mary',
      'avatar': 'assets/images/avatar-3.png',
    },
    {
      'name': 'Julian',
      'avatar': 'assets/images/avatar-4.png',
    },
    {
      'name': 'Sara',
      'avatar': 'assets/images/avatar-5.png',
    },
    {
      'name': 'Kabir Singh',
      'avatar': 'assets/images/avatar-6.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Contacts', style: TextStyle(color: Colors.black),),
        leading: BackButton(color: Colors.black,),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: FadeInDown(
            duration: Duration(milliseconds: 500),
            child: Container(
              height: 40,
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: Icon(Icons.search, color: Colors.grey,),
                  hintText: 'Search contacts',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50,),
            FadeInUp(
              duration: Duration(milliseconds: 500),
              child: Container(
                width: double.infinity,
                height: 300,
                padding: EdgeInsets.all(90.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade200, width: 1.0),
                ),
                child: Stack(
                  children: [
                    for (double i = 0; i < 360; i += 60)
                      AnimChain(
                        initialDelay: Duration(milliseconds: i.toInt())
                      )
                      .next(
                        wait: Duration(milliseconds: 1000),
                        widget: AnimatedAlignPositioned(
                          dx: 0,
                          dy: 150,
                          duration: Duration(seconds: 1),
                          rotateDegrees: 0,
                          touch: Touch.middle,
                          child: user(0, i),
                        ),
                      )
                      .next(
                        wait: Duration(seconds: 2),
                        widget: AnimatedAlignPositioned(
                          dx: i / 360,
                          dy: 150,
                          duration: Duration(seconds: 1),
                          rotateDegrees: i,
                          touch: Touch.middle,
                          child: user(0, i),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 80,),
            FadeInRight(
              duration: Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 15.0, top: 10.0),
                child: Text('Most Recent', style: TextStyle(fontSize: 16, color: Colors.grey.shade900, fontWeight: FontWeight.w500),),
              ),
            ),
            Container(
              height: 90,
              padding: EdgeInsets.only(left: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  return FadeInRight(
                    duration: Duration(milliseconds: (index * 100) + 500),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (context) => SendMoney(
                              name: _contacts[index]['name'], 
                              avatar: _contacts[index]['avatar']
                            )
                          )
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.blueGrey[100],
                              backgroundImage: AssetImage(_contacts[index]['avatar']),
                            ),
                            SizedBox(height: 10,),
                            Text(_contacts[index]['name'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30,),
            FadeInRight(
              duration: Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 15.0, top: 10.0),
                child: Text('All Contacts', style: TextStyle(fontSize: 16, color: Colors.grey.shade900, fontWeight: FontWeight.w500),),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 200,
              padding: EdgeInsets.only(left: 20),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  return FadeInRight(
                    duration: Duration(milliseconds: (index * 100) + 500),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: <Widget>[
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.red[100],
                                backgroundImage: AssetImage(_contacts[index]['avatar']),
                              ),
                              SizedBox(width: 10,),
                              Text(_contacts[index]['name'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 15,),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ]
        )
      )
    );
  }

  user(int index, double number) {
    index = number ~/ 60;
    return FadeInRight(
      delay: Duration(seconds: 1),
      duration: Duration(milliseconds: (index * 100) + 500),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, 
            MaterialPageRoute(
              builder: (context) => SendMoney(
                name: _contacts[index]['name'], 
                avatar: _contacts[index]['avatar']
              )
            )
          );
        },
        child: Container(
          margin: EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Transform.rotate(
                angle: number / 60 * 5.2,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green.shade100,
                  backgroundImage: AssetImage(_contacts[index]['avatar']),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container circle(Color color, [double diameter = 50.0]) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
    ));
  }
}