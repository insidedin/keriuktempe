import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

textView(margin, text, posisi, warna, tebal, ukuran) {
  return Container(
    margin: margin,
    child: Text(
      text,
      textAlign: posisi,
      style: GoogleFonts.poppins(
        color: warna,
        fontWeight: tebal,
        fontSize: ukuran,
      ),
    ),
  );
}

etalaseView(
  EdgeInsets margin,
  String gambar,
  String nama,
  String harga, {
  Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: margin,
      width: 150, // pastikan semua sama ukuran
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(gambar),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 10),
          textView(EdgeInsets.all(0), nama, TextAlign.center, Colors.black,
              FontWeight.w400, 13.0),
          textView(EdgeInsets.all(0), harga, TextAlign.center,
              Color(0xFF78AC9D), FontWeight.bold, 15.0),
        ],
      ),
    ),
  );
}
