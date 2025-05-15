import 'package:flutter/material.dart';
import 'package:keripiktempe/widgets/textview.dart';

class Formpesan extends StatefulWidget {
  final String rasa;
  final int harga;

  const Formpesan({
    super.key,
    required this.rasa,
    required this.harga,
  });

  @override
  State<Formpesan> createState() => _FormpesanState();
}

class _FormpesanState extends State<Formpesan> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController hpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  int jumlahPesanan = 1;

  int get totalHarga => jumlahPesanan * widget.harga;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textView(
          EdgeInsets.zero,
          'Form Pemesanan',
          TextAlign.left,
          Colors.black,
          FontWeight.w500,
          14.0,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Info Produk
              Text('Varian: ${widget.rasa}', style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 8),
              Text('Harga Satuan: Rp ${widget.harga}', style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 16),

              // Jumlah Pesanan
              Text('Jumlah Pesanan:', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: jumlahPesanan > 1
                        ? () => setState(() => jumlahPesanan--)
                        : null,
                    icon: Icon(Icons.remove_circle_outline),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(jumlahPesanan.toString(), style: TextStyle(fontSize: 18)),
                  ),
                  IconButton(
                    onPressed: () => setState(() => jumlahPesanan++),
                    icon: Icon(Icons.add_circle_outline),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Total Harga
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Total Harga: ', style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
                  Text('Rp ${totalHarga.toString()}', style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 24),

              // Form Inputan
              Text('Nama Pemesan:', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              TextField(
                controller: namaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              Text('Nomor Handphone:', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              TextField(
                controller: hpController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              Text('Alamat:', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              TextField(
                controller: alamatController,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),

              // Tombol Kirim
              buttonView(
                'Kirim Pesanan',
                () {
                  if (namaController.text.isEmpty ||
                      hpController.text.isEmpty ||
                      alamatController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Harap lengkapi semua data!')),
                    );
                    return;
                  }

                  // Kirim data pesanan, simpan ke database atau API
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Pesanan berhasil dikirim!')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
