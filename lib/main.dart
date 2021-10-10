import 'package:animate_do/animate_do.dart';
import 'package:day40/pages/contact.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  bool _isScrolled = false;

  List<dynamic> _services = [
    ['Transfer', Iconsax.export_1, Colors.blue],
    ['Top-up', Iconsax.import, Colors.pink],
    ['Bill', Iconsax.wallet_3, Colors.orange],
    ['More', Iconsax.more, Colors.green],
  ];

  List<dynamic> _transactions = [
    ['Amazon', 'https://img.icons8.com/color/2x/amazon.png', '6:25pm', '\$8.90'],
    ['Cash from ATM', 'https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/2x/external-atm-banking-and-finance-kiranshastry-lineal-color-kiranshastry.png', '5:50pm', '\$200.00'],
    ['Netflix', 'https://img.icons8.com/color-glass/2x/netflix.png', '2:22pm', '\$13.99'],
    ['Apple Store', 'https://img.icons8.com/color/2x/mac-os--v2.gif', '6:25pm', '\$4.99'],
    ['Cash from ATM', 'https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/2x/external-atm-banking-and-finance-kiranshastry-lineal-color-kiranshastry.png', '5:50pm', '\$200.00'],
    ['Netflix', 'https://img.icons8.com/color-glass/2x/netflix.png', '2:22pm', '\$13.99']
  ];

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);

    super.initState();
  }

  void _listenToScrollChange() {
    if (_scrollController.offset >= 100.0) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            elevation: 0,
            pinned: true,
            stretch: true,
            toolbarHeight: 80,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Iconsax.menu, color: Colors.grey.shade700),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: Icon(Iconsax.notification, color: Colors.grey.shade700),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Iconsax.more, color: Colors.grey.shade700),
                onPressed: () {},
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            centerTitle: true,
            title: AnimatedOpacity(
              opacity: _isScrolled ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Column(
                children: [
                  Text(
                    '\$ 1,840.00',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 30,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              titlePadding: const EdgeInsets.only(left: 20, right: 20),
              title: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _isScrolled ? 0.0 : 1.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('\$', style: TextStyle(color: Colors.grey.shade800, fontSize: 22),),
                          SizedBox(width: 3,),
                          Text('1,840.00',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: MaterialButton(
                        height: 30,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        onPressed: () {},
                        child: Text('Add Money', style: TextStyle(color: Colors.black, fontSize: 10),),
                        color: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey.shade300, width: 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: 30,
                      height: 3,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: 8,),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(top: 20),
                height: 115,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _services.length,
                  itemBuilder: (context, index) {
                    return FadeInDown(
                      duration: Duration(milliseconds: (index + 1) * 100),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: GestureDetector(
                          onTap: () {
                            if (_services[index][0] == 'Transfer') { 
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ContactPage()));
                            }
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Icon(_services[index][1], color: Colors.white, size: 25,),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(_services[index][0], style: TextStyle(color: Colors.grey.shade800, fontSize: 12),),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ])
          ),
          SliverFillRemaining(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                children: [
                  FadeInDown(
                    duration: Duration(milliseconds: 500),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Today', style: TextStyle(color: Colors.grey.shade800, fontSize: 14, fontWeight: FontWeight.w600),),
                        SizedBox(width: 10,),
                        Text('\$ 1,840.00', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700,)),
                      ]
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 20),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _transactions.length,
                      itemBuilder: (context, index) {
                        return FadeInDown(
                          duration: Duration(milliseconds: 500),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  offset: Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.network(_transactions[index][1], width: 50, height: 50,),
                                    SizedBox(width: 15,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(_transactions[index][0], style: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.w500, fontSize: 14),),
                                        SizedBox(height: 5,),
                                        Text(_transactions[index][2], style: TextStyle(color: Colors.grey.shade500, fontSize: 12),),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(_transactions[index][3], style: TextStyle(color: Colors.grey.shade800, fontSize: 16, fontWeight: FontWeight.w700),),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ]
      )
    );
  }
}
