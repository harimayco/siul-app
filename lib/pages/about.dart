import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset('assets/logo_dishub.png'),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Text(
              'Aplikasi Undang undang Lalu Lintas 1.1 (Wasdal on mobile)',
              style: Theme.of(context).textTheme.headline,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Text(
              'Untuk ruang lingkup dinas perhubungan khususnya seksi pengawasan dan pengendalian menampilkan berbagai macam instrumen keselamatan berkendara serta fungsi rambu lalu lintas dan uji berkala untuk kendaraan umum dan angkutan jalan kemudian dasar hukum yang harus diketahui dan pahami sanksi hukum yang berlaku untuk pelanggar yang tidak mematuhi aturan tersebut.',
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.justify,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Text(
              'Dikembangkan oleh:\nZulfikar Alfiadi (@zulfikar\'alfiadi)',
              style: Theme.of(context).textTheme.body1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
