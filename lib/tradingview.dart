import 'package:flutter/material.dart';

class TradingView extends StatefulWidget {
  final trad_unit, trad_transaction, trad_date, trad_amount, trad_img;

  const TradingView(
      {Key? key,
      this.trad_unit,
      this.trad_transaction,
      this.trad_date,
      this.trad_amount,
      this.trad_img})
      : super(key: key);

  @override
  _TradingViewState createState() => _TradingViewState();
}

class _TradingViewState extends State<TradingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trading View'),
      ),
      body: ListView(
        children: [
          Image.asset(
            widget.trad_img,
          ),
          ListTile(
            leading: Text("Unit"),
            title: Text(widget.trad_unit ?? ""),
          ),
          ListTile(
            leading: Text('Transaction'),
            title: Text(widget.trad_transaction ?? ""),
          ),
          ListTile(
            leading: Text('Date'),
            title: Text(widget.trad_date ?? ""),
          ),
          ListTile(
            leading: Text('Amount'),
            title: Text(widget.trad_amount ?? ""),
          ),
        ],
      ),
    );
  }
}
