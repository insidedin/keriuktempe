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

etalaseView( EdgeInsets margin, gambar, nama, harga,{
  Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: margin,
      width: 150,
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(gambar),
                fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          SizedBox(height: 10),
          textView(EdgeInsets.all(0),
          nama, TextAlign.center, Colors.black, FontWeight.w400, 14.0, ),
          SizedBox(height: 5),
          textView(EdgeInsets.all(0),
          harga, TextAlign.center,Color(0xFF78AC9D), FontWeight.bold, 15.0)
        ],
      ),
    ),
  );
}

//widget untuk button
buttonView(text, Function()? onPressed) {
  return SizedBox(
      width: double.infinity, // tombol full lebar
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
}

///khusus widget WAVA TEAM
menuItem(icon, label) {
  return Container(
    width: 70,
    height: 70,
    margin: EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 28, color: Colors.black),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 10),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
