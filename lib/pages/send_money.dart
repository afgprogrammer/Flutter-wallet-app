import 'package:animate_do/animate_do.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class SendMoney extends StatefulWidget {
  final String name;
  final String avatar;
  const SendMoney({ Key? key, required this.name, required this.avatar }) : super(key: key);

  @override
  _SendMoneyState createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  var amount = TextEditingController(text: "0.00");

  FocusNode _focusNode = new FocusNode();
  TextEditingController _editingController = new TextEditingController();
  bool isFocused = false;

  List<String> _feedbacks = [
    'Awsome 🙌',
    'Nice 🔥',
    'Cool 🤩',
    'Amazing work 👍🏼',
  ];

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(onFocusChanged);
  }

  void onFocusChanged() {
    setState(() {
      isFocused = _focusNode.hasFocus;
    });

    print('focus changed.');
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Send Money', style: TextStyle(color: Colors.black),),
        leading: BackButton(color: Colors.black,),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              FadeInDown(
                from: 100,
                duration: Duration(milliseconds: 1000),
                child: Container(
                  width: 130,
                  height: 130,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(widget.avatar)),
                ),
              ),
              SizedBox(height: 50,),
              FadeInUp(
                from: 60,
                delay: Duration(milliseconds: 500),
                duration: Duration(milliseconds: 1000),
                child: Text("Send Money To", style: TextStyle(color: Colors.grey),)),
              SizedBox(height: 10,),
              FadeInUp(
                from: 30,
                delay: Duration(milliseconds: 800),
                duration: Duration(milliseconds: 1000),
                child: Text(widget.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)),
              SizedBox(height: 20,),
              FadeInUp(
                from: 40,
                delay: Duration(milliseconds: 800),
                duration: Duration(milliseconds: 1000),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: TextField(
                    controller: amount,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
                    onSubmitted: (value) {
                      setState(() {
                        amount.text = "\$" + value + ".00";
                      });
                    },
                    onTap: () {
                      setState(() {
                        if (amount.text == "0.00") {
                          amount.text = "";
                        } else {
                          amount.text = amount.text.replaceAll(RegExp(r'.00'), '');
                        }
                      });
                    },
                    inputFormatters: [
                      ThousandsFormatter()
                    ],
                    decoration: InputDecoration(
                      hintText: "Enter Amount",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              // note textfield
              FadeInUp(
                from: 60,
                delay: Duration(milliseconds: 800),
                duration: Duration(milliseconds: 1000),
                child: AnimatedContainer(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  duration: Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: isFocused ? Colors.indigo.shade400 : Colors.grey.shade200, width: 2),
                    // // boxShadow: 
                  ),
                  child: TextField(
                    maxLines: 3,
                    focusNode: _focusNode,
                    controller: _editingController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      hintText: "Message ...",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              FadeInUp(
                from: 60,
                delay: Duration(milliseconds: 800),
                duration: Duration(milliseconds: 1000),
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _feedbacks.length,
                    itemBuilder: (context, index) {
                      return FadeInRight(
                        from: 100,
                        delay: Duration(milliseconds: index * 500),
                        duration: Duration(milliseconds: 1000),
                        child: BouncingWidget(
                          duration: Duration(milliseconds: 100),
                          scaleFactor: 1.5,
                          onPressed: () {
                            _editingController.text = _feedbacks[index];
                            _focusNode.requestFocus();
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 20),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade200, width: 2),
                            ),
                            child: Text(_feedbacks[index], style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 16
                            ),),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 50,),
              FadeInUp(
                duration: Duration(milliseconds: 1000),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/');
                      },
                      minWidth: double.infinity,
                      height: 50,
                      child: Text("Send", style: TextStyle(color: Colors.white, fontSize: 16),),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
