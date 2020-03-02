import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'FAQ (Frequently Asked Questions)',
              style: Theme.of(context).textTheme.headline,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Text(
              'P - Bagaimana cara mencari instrumen keselamatan?',
              style: Theme.of(context).textTheme.body2,
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
            ),
            Text(
              'J - ketik nama instrumen keselamatan pada kolom buton search "masukkan instrumen keselamatan misal, "Helm" dan "Sabuk keselamatan", kemudan klik/tap nama yang muncul pada kolom button',
              style: Theme.of(context).textTheme.body1,
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Text(
              'P - Bagaimana mengetahui about?',
              style: Theme.of(context).textTheme.body2,
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
            ),
            Text(
              'J - Tap/sentuh menu pojok kanan atas lalu pilih about',
              style: Theme.of(context).textTheme.body1,
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Text(
              'P - Bagaimana cara keluar aplikasi?',
              style: Theme.of(context).textTheme.body2,
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
            ),
            Text(
              'J - sentuh tombol pojok kanan atas, kemudian pilih "Exit" atau tap/sentuh tombol back pada smartphone.',
              style: Theme.of(context).textTheme.body1,
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
          ],
        ),
      ),
    );
  }
}
