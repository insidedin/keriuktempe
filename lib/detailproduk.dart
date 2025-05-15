import 'package:flutter/material.dart';
import 'package:keripiktempe/formpesan.dart';
import 'package:keripiktempe/widgets/textview.dart';

class DetailProduk extends StatelessWidget {
  final String gambar;
  final String nama;
  final String harga;
  final String deskripsi;

  const DetailProduk({
    Key? key,
    required this.gambar,
    required this.nama,
    required this.harga,
    required this.deskripsi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textView(
          EdgeInsets.zero,
          nama,
          TextAlign.left,
          Colors.black,
          FontWeight.w500,
          14.0,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //memanggil gambar produk
            Center(
              child: Image.asset(
                gambar,
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 16),

            //memanggil nama produk
            textView(
              EdgeInsets.zero,
              nama,
              TextAlign.left,
              Colors.black,
              FontWeight.bold,
              22.0,
            ),
            SizedBox(height: 8),

            //memanggil harga produk
            textView(
              EdgeInsets.zero,
              harga,
              TextAlign.left,
              Colors.green,
              FontWeight.w600,
              18.0,
            ),
            SizedBox(height: 16),

            //memanggil deskripsi produk
            textView(
              EdgeInsets.zero,
              'Deskripsi Produk:',
              TextAlign.left,
              Colors.black,
              FontWeight.bold,
              16.0,
            ),
            SizedBox(height: 8),

            //memanggil deskripsi produk
            textView(
              EdgeInsets.zero,
              deskripsi,
              TextAlign.left,
              Colors.black,
              FontWeight.normal,
              14.0,
            ),
            SizedBox(height: 16),

            //tombol beli
            buttonView(
              'Beli Sekarang',
              () {
                // Aksi ketika tombol dibeli ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Formpesan(
                      rasa: nama,
                      harga: int.parse(harga.replaceAll(RegExp(r'[^0-9]'), '')),
                    ),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Produk ditambahkan ke keranjang!'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
