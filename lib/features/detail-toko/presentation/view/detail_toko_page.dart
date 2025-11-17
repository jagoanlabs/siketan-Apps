import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/features/toko/presentation/widget/store_card_widget.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:colorful_iconify_flutter/icons/logos.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../toko/presentation/widget/product_card_widget.dart'
    show ProductCardWidget;

class DetailTokoPage extends StatelessWidget {
  const DetailTokoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailTokoView();
  }
}

class DetailTokoView extends StatefulWidget {
  const DetailTokoView({super.key});

  @override
  State<DetailTokoView> createState() => _DetailTokoViewState();
}

class _DetailTokoViewState extends State<DetailTokoView> {
  ScrollController _scroll = ScrollController();
  bool isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      if (_scroll.offset > 80 && !isScrolled) {
        setState(() => isScrolled = true);
      } else if (_scroll.offset <= 80 && isScrolled) {
        setState(() => isScrolled = false);
      }
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  int currentPage = 1;
  int totalPages = 5;

  List<Map<String, dynamic>> _ProductData = [
    {
      'image':
          'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
      'name': 'Bibit Padi Siap Tanam Persemaian Sistem Kering',
      'price': 'Rp. 100.000',
      'id': '1',
    },
    {
      'image':
          'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
      'name': 'Product 2',
      'price': 'Rp. 200.000',
      'id': '2',
    },
    {
      'image':
          'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
      'name': 'Product 3',
      'price': 'Rp. 300.000',
      'id': '3',
    },
    {
      'image':
          'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
      'name': 'Product 4',
      'price': 'Rp. 400.000',
      'id': '4',
    },
    {
      'image':
          'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
      'name': 'Product 5',
      'price': 'Rp. 500.000',
      'id': '5',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // 🔥 wajib agar AppBar tidak menutupi gradient
      extendBodyBehindAppBar:
          true, // 🔥 wajib agar AppBar tidak menutupi gradient
      backgroundColor:
          Colors.white, // agar background di bawah appbar menjadi putih

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AnimatedTheme(
          data: Theme.of(context).copyWith(
            appBarTheme: AppBarTheme(
              backgroundColor: isScrolled ? Colors.white : Colors.transparent,
              elevation: isScrolled ? 1 : 0,
              iconTheme: IconThemeData(color: AppColors.gray900),
            ),
          ),
          child: AppBar(
            leadingWidth: 30,
            leading: IconButton(
              iconSize: 36,
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.gray900,
              ),
              child: const Text("Detail Toko"),
            ),
            centerTitle: false,
          ),
        ),
      ),
      body: Stack(
        children: [
          // 🔵 Background Gradient
          Container(
            width: double.infinity,
            height: 300.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: const [0.0, 0.8, 0.9, 1.0],
                colors: [
                  AppColors.blue2,
                  AppColors.blue1.withValues(alpha: 0.5),
                  AppColors.blue1.withValues(alpha: 0.2),
                  AppColors.blue1.withValues(alpha: 0.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // 🔵 Konten scroll
          SingleChildScrollView(
            controller: _scroll,
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(top: kToolbarHeight + 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32.h),
                  // content
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 50.r,
                          backgroundImage: NetworkImage(
                            'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'AGNES DYAN PARAMITA, S.P.',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.gray900,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: AppColors.green0,
                              ),
                              child: Text(
                                "Penyuluh",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.green5,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            _buildButton(
                              'Hubungi Penjual',
                              Logos.whatsapp_icon,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tentang Penjual',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.gray900,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        _buildMenuProfile(
                          icon: Ph.phone_call_light,
                          value: '08123456789',
                        ),
                        SizedBox(height: 16.h),
                        _buildMenuProfile(
                          icon: MaterialSymbols.location_on_outline_rounded,
                          value: "Ngawi, Jawa Timur",
                        ),
                        SizedBox(height: 16.h),
                        _buildMenuProfile(
                          icon: MaterialSymbols.alternate_email_rounded,
                          value: "agnesdyanparamita@gmail.com",
                        ),
                        SizedBox(height: 16.h),
                        _buildMenuProfile(
                          icon: Carbon.product,
                          value: "4 Produk",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
                    child: Text(
                      "Produk",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.gray900,
                      ),
                    ),
                  ),

                  // list Product
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 12.h,
                    ),
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _ProductData.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.w,
                        childAspectRatio: 0.6,
                      ),
                      itemBuilder: (context, index) {
                        final product = _ProductData[index];
                        return ProductCardWidget(
                          imageUrl: product['image'],
                          name: product['name'],
                          price: product['price'],
                          id: product['id'],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton _buildButton(String text, String icon) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        backgroundColor: AppColors.green4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Iconify(Logos.whatsapp_icon),
          SizedBox(width: 8.w),
          Text(
            'Hubungi Penjual',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Row _buildMenuProfile({required String icon, required String value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 8.w,
      children: [
        Iconify(icon, size: 24.sp, color: AppColors.blue4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.gray900,
          ),
        ),
      ],
    );
  }
}
