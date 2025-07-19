# keripiktempe

Social Project (Hackathon Mini Test Challenge) 

UMKM Keripik Tempe Bu Mar with GSO39A class



///contoh kode

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
  

 




