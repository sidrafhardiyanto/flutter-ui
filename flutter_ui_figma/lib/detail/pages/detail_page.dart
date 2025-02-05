import 'package:flutter/material.dart';
import '../../detail/widgets/app_bar_detail.dart';
import '../../detail/widgets/container_detail.dart';
import '../../detail/widgets/nama_produk_harga_detail.dart';
import '../../detail/widgets/select_color_detail.dart';
import '../../detail/widgets/select_quantity_detail.dart';
import '../../detail/widgets/add_to_cart_detail.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Image.asset(
              'assets/images/furniture/img_product_1.png',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 48,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const AppBarDetail(),
            ),
          ),
          const Positioned(
            left: 0,
            bottom: 0,
            child: ContainerDetail(),
          ),
        ],
      ),
    );
  }
}

// class DetailPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBarDetail(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             ContainerDetail(),
//             NamaProdukHargaDetail(),
//             SelectColorDetail(),
//             SelectQuantityDetail(),
//             AddToCartDetail(),
//           ],
//         ),
//       ),
//     );
//   }
// }
