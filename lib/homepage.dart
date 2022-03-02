import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  PageController pageController = PageController();
  List trading = [
    {
      "unit": "0.0065 Bitcoin",
      "img": "assets/bitcoin.png",
      "transaction": "Received",
      "date": "8:22, AUG 27, 2019",
      "gaining": true,
      "amount": 68.54,
    },
    {
      "unit": "0.038 Etherium",
      "img": "assets/etherium.png",
      "transaction": "Sent",
      "date": "9:38, AUG 27, 2019",
      "gaining": false,
      "amount": 48.03,
    },
    {
      "unit": "0.028 Counterparty",
      "img": "assets/counterparty.png",
      "transaction": "Sent",
      "date": "12:48, AUG 28, 2019",
      "gaining": false,
      "amount": 20.04,
    },
    {
      "unit": "0.0049 Ripple",
      "img": "assets/ripple.png",
      "transaction": "Received",
      "date": "14:57, AUG 28, 2019",
      "gaining": true,
      "amount": 37.26,
    },
    {
      "unit": "0.0065 Bitcoin",
      "img": "assets/bitcoin.png",
      "transaction": "Sent",
      "date": "17:36, AUG 28, 2019",
      "gaining": false,
      "amount": 68.54,
    },
    {
      "unit": "0.0098 Ripple",
      "img": "assets/ripple.png",
      "transaction": "Received",
      "date": "14:57, AUG 28, 2019",
      "gaining": true,
      "amount": 74.52,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    "History",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [Icon(Icons.sort_rounded), Text("Sort/Filter")],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: trading.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => tradView(
                                trad_unit: trading[index]['unit'],
                                trad_transaction: trading[index]['transaction'],
                                trad_date: trading[index]['date'],
                                trad_amount: trading[index]['amount'],
                                trad_img: trading[index]['img'])));
                  },
                  leading: Image.asset(
                    trading[index]['img'],
                    height: 20,
                    width: 20,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    trading[index]['transaction'],
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                  subtitle: Wrap(
                    alignment: WrapAlignment.start,
                    direction: Axis.vertical,
                    children: [
                      Text(
                        trading[index]['unit'],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        trading[index]['date'],
                        style: TextStyle(color: Colors.grey[500], fontSize: 12),
                      )
                    ],
                  ),
                  trailing: Text(
                    trading[index]['gaining']
                        ? "+\$${trading[index]['amount']}"
                        : "-\$${trading[index]['amount']}",
                    style: TextStyle(
                        color: trading[index]['gaining']
                            ? Colors.green
                            : Colors.red),
                  ),
                );
              },
            ),
          ],
          controller: pageController,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: 'Bar_Chart'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Map'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  tradView({trad_unit, trad_transaction, trad_date, trad_amount, trad_img}) {}

  CreateTrading() {}
}
