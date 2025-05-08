import 'package:flutter/material.dart';
import 'package:keripiktempe/detailproduk.dart';
import 'package:keripiktempe/widgets/textview.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          //konten header
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 50, left: 20),
                    child: textView(
                        EdgeInsets.all(0),
                        'User! Selamat Datang di',
                        TextAlign.left,
                        Colors.black,
                        FontWeight.normal,
                        15.0),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5, left: 20),
                    child: textView(
                        EdgeInsets.all(0),
                        'KruikTempe',
                        TextAlign.left,
                        Color(0xFF78AC9D),
                        FontWeight.bold,
                        20.0),
                  ),
                ],
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: IconButton(
                    onPressed: () {},
                    icon: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF78AC9D),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.menu_rounded,
                        size: 35,
                        color: Colors.white,
                      ),
                    )),
              ),
            ],
          ),

          //konten slider
          Container(
            margin: EdgeInsets.only(top: 20),
            width:
                MediaQuery.of(context).size.width * 0.9, // 90% dari lebar layar
            height: MediaQuery.of(context).size.height *
                0.25, // 25% dari tinggi layar (opsional)
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                'assets/slider.png',
                fit: BoxFit
                    .cover, // gunakan cover agar gambar tetap proporsional
              ),
            ),
          ),

          //konten kategori
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textView(
                  EdgeInsets.all(0),
                  'Variasi Produk Tempe Bu Mar',
                  TextAlign.left,
                  Colors.black,
                  FontWeight.bold,
                  15.0,
                ),
                textView(
                  EdgeInsets.all(0),
                  '“Dari Kompor ke Klik – Pesan Keripik Lebih Praktis!”',
                  TextAlign.left,
                  Colors.black,
                  FontWeight.normal,
                  12.0,
                ),
              ],
            ),
          ),

          // Konten list produk
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  etalaseView(
                    EdgeInsets.only(top: 20),
                    'assets/1.jpg',
                    'Original Flavor',
                    'Rp.15.000',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailProduk(
                            gambar: 'assets/1.jpg',
                            nama: 'Keripik Tempe Original',
                            harga: 'Rp.15.000',
                            deskripsi:
                                'Keripik tempe renyah khas Bu Mar dengan cita rasa original.',
                          ),
                        ),
                      );
                    },
                  ),
                  etalaseView(
                    EdgeInsets.only(top: 20),
                    'assets/3.jpg',
                    'Manis Asin Sedap',
                    'Rp.25.000',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailProduk(
                            gambar: 'assets/3.jpg',
                            nama: 'Manis Asin Sedap',
                            harga: 'Rp.25.000',
                            deskripsi:
                                'Keripik tempe renyah khas Bu Mar dengan cita rasa Manis Asin Sedap.',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  etalaseView(
                    EdgeInsets.only(top: 20),
                    'assets/4.jpg',
                    'Nusantara Flavor',
                    'Rp.25.000',
                  ),
                  etalaseView(
                    EdgeInsets.only(top: 20),
                    'assets/5.jpg',
                    'Pedas Gurih Nagih ',
                    'Rp.20.000',
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ));
  }
}
