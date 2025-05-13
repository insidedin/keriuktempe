import 'package:flutter/material.dart';
import 'package:keripiktempe/widgets/textview.dart';

class Formpesan extends StatefulWidget {
  const Formpesan({super.key});

  @override
  State<Formpesan> createState() => _FormpesanState();
}

class _FormpesanState extends State<Formpesan> {
  //definisi controller inputan
  final TextEditingController namaController = TextEditingController();
  final TextEditingController hpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  //definisi variabel
  int jumlahPesanan = 1;
  int hargaSatuan = 25000;
  int get totalHarga => jumlahPesanan * hargaSatuan;

  //variabel untuk menyimpan pilihan
  String? rasaTerpilih;
  String? metodePembayaran;

  List<String> variasiRasa = [
    'Keripik Tempe Manis Asin Sedap',
    'Keripik Tempe Pedas Gurih',
    'Keripik Tempe Original Renyah'
  ];

  List<String> metodePembayaranList = [
    'COD (Cash On Delivery)',
    'Transfer Bank',
    'E-Wallet'
  ];
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

              // Variasi Rasa
              Text('Variasi Rasa:', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              DropdownButtonFormField<String>(
                value: rasaTerpilih,
                hint: Text('Pilih Varian'),
                onChanged: (value) => setState(() => rasaTerpilih = value),
                items: variasiRasa.map((rasa) {
                  return DropdownMenuItem(value: rasa, child: Text(rasa));
                }).toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
              ),
              const SizedBox(height: 16),

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
                  Text('Total Harga', style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
                  SizedBox(width: 8),
                  Text('Rp ${totalHarga.toString()}', style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 24),

              // Nama Pemesan
              Text('Nama Pemesan:', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              TextField(
                controller: namaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Nomor HP
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

              // Alamat
              Text('Alamat:', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              TextField(
                controller: alamatController,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Metode Pembayaran
              Text('Metode Pembayaran:', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              DropdownButtonFormField<String>(
                value: metodePembayaran,
                hint: Text('Pilih Metode Pembayaran'),
                onChanged: (value) => setState(() => metodePembayaran = value),
                items: metodePembayaranList.map((metode) {
                  return DropdownMenuItem(value: metode, child: Text(metode));
                }).toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
              ),
              const SizedBox(height: 24),

              // Tombol Kirim
              buttonView(
                'Kirim Pesanan',
                () {
                  // Validasi data sebelum kirim
                  if (rasaTerpilih == null ||
                      metodePembayaran == null ||
                      namaController.text.isEmpty ||
                      hpController.text.isEmpty ||
                      alamatController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Harap lengkapi semua data!')),
                    );
                    return;
                  }

                  // Lanjutkan ke submit/pesan
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Pesanan dikirim!')),
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