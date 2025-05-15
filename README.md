# keripiktempe

Social Project (Hackathon Mini Test Challenge) 

UMKM Keripik Tempe Bu Mar with GSO39A class



///contoh kode
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Formpesan extends StatefulWidget {
  final String namaProduk;
  final int harga;

  const Formpesan({super.key, required this.namaProduk, required this.harga});

  @override
  State<Formpesan> createState() => _FormpesanState();
}

class _FormpesanState extends State<Formpesan> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController hpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  bool isLoading = false;

  Future<void> simpanPesanan() async {
    if (namaController.text.isEmpty ||
        hpController.text.isEmpty ||
        alamatController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Harap lengkapi semua data!')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseFirestore.instance.collection('pesanan').add({
        'nama_produk': widget.namaProduk,
        'harga': widget.harga,
        'nama_pemesan': namaController.text,
        'hp': hpController.text,
        'alamat': alamatController.text,
        'tanggal': Timestamp.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pesanan berhasil dikirim!')),
      );

      // Kosongkan field
      namaController.clear();
      hpController.clear();
      alamatController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menyimpan: $e')),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Pemesanan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama Produk: ${widget.namaProduk}'),
            Text('Harga: Rp ${widget.harga}'),
            const SizedBox(height: 16),
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Nama Pemesan'),
            ),
            TextField(
              controller: hpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: 'Nomor HP'),
            ),
            TextField(
              controller: alamatController,
              maxLines: 3,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            const SizedBox(height: 24),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: simpanPesanan,
                    child: Text('Kirim Pesanan'),
                  ),
          ],
        ),
      ),
    );
  }
}




