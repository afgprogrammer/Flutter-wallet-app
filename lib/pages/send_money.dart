import 'package:animate_do/animate_do.dart';
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
                duration: Duration(milliseconds: 500),
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
              FadeInRight(
                duration: Duration(milliseconds: 500),
                child: Text("Send Money To", style: TextStyle(color: Colors.grey),)),
              SizedBox(height: 10,),
              FadeInRight(
                duration: Duration(milliseconds: 500),
                child: Text(widget.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)),
              SizedBox(height: 30,),
              FadeInRight(
                duration: Duration(milliseconds: 500),
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
              SizedBox(height: 30,),
              // note textfield
              FadeInRight(
                duration: Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: TextField(
                    maxLines: 3,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      hintText: "Note ...",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade200, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              FadeInUp(
                duration: Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                    child: MaterialButton(
                      onPressed: () {},
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
