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

etalaseView(margin, gambar, nama, harga) {
  return Container(
    margin: margin,
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              gambar,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          textView(
            EdgeInsets.all(0),
            nama,
            TextAlign.left,
            Colors.black,
            FontWeight.w400,
            13.0,
          ),
          textView(
            EdgeInsets.all(0),
            harga,
            TextAlign.left,
            Color(0xFF78AC9D),
            FontWeight.bold,
            15.0,
          ),
        ],
      ),
    ),
  );
}
