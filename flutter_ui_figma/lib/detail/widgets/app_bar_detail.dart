import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarDetail extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0, // Menghilangkan bayangan
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context); // Kembali ke halaman sebelumnya
        },
        icon: SvgPicture.asset('assets/icons/back.svg'), // Ganti dengan ikon kembali yang sesuai
      ),
      title: Text(
        "Detail Produk",
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Color(0xff4A4543),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // Aksi untuk ikon favorit atau lainnya
          },
          icon: SvgPicture.asset('assets/icons/favorite.svg'), // Ganti dengan ikon favorit yang sesuai
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // Ukuran AppBar
}
