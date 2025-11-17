import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/widget/primary_button_widget.dart';
import 'package:colorful_iconify_flutter/icons/logos.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailProductPageView();
  }
}

class DetailProductPageView extends StatefulWidget {
  const DetailProductPageView({super.key});

  @override
  State<DetailProductPageView> createState() => _DetailProductPageViewState();
}

class _DetailProductPageViewState extends State<DetailProductPageView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ScrollController _scroll = ScrollController();
  bool isScrolled = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // 🔥 wajib agar AppBar tidak menutupi gradient
      extendBodyBehindAppBar:
          true, // 🔥 wajib agar AppBar tidak menutupi gradient
      backgroundColor:
          Colors.white, // agar background di bawah appbar menjadi putih

      appBar: AppBar(
        backgroundColor: isScrolled
            ? Colors.white
            : Colors.transparent, // transparan
        elevation: isScrolled ? 1 : 0,
        leadingWidth: 30,
        leading: IconButton(
          iconSize: 36,
          icon: const Icon(Icons.chevron_left, color: AppColors.gray900),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Detail Product",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black, // karena background putih
          ),
        ),
        centerTitle: false,
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(color: Colors.white),
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
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
              ),
            ),
            SizedBox(width: 16.w),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.white,
                foregroundColor: AppColors.blue4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  side: BorderSide(color: AppColors.blue4, width: 2),
                ),
              ),
              child: Iconify(
                Ph.share_network_fill,
                color: AppColors.blue4,
                size: 24,
              ),
            ),
          ],
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
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(top: kToolbarHeight + 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.asset(
                        ImageConfig.authBackground,
                        width: double.infinity,
                        height: 320.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  // title
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bibit Padi Siap Tanam Persemaian Sistem Kering",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.gray900,
                          ),
                        ),
                        Text(
                          "Beras Pulen, Varietas Inpari 32, Satuan Kg",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.gray900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 24.w,
                      right: 24.w,
                      top: 16.h,
                      bottom: 24.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rp12.000",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.gray900,
                          ),
                        ),
                        Text(
                          "Stok Tersedia : 1000",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.green4,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Tab Bar: Detail Produk & Penjual
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.gray200.withOpacity(0.2),
                          blurRadius: 8.r,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TabBar(
                      tabAlignment: TabAlignment.start,
                      padding: EdgeInsets.zero,
                      labelPadding: EdgeInsets.only(right: 24),
                      isScrollable: true,
                      dividerColor: Colors.transparent,
                      dividerHeight: 0,
                      controller: _tabController,
                      labelColor: AppColors.blue4,
                      unselectedLabelColor: AppColors.gray500,
                      indicator: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: AppColors.blue4, width: 3),
                        ),
                      ),
                      tabs: [
                        Tab(
                          child: Text(
                            'Detail Produk',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Penjual',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Tab Content
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    child: SizedBox(
                      height: 200.h, // Atur tinggi konten tab
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          // Tab Detail Produk
                          _buildTabContent(
                            content: '''
                              Beras pulen varietas Inpari 32 ini memiliki tekstur yang lembut dan aroma yang khas saat dimasak. Cocok digunakan untuk konsumsi harian maupun kebutuhan usaha kuliner. Dikemas dalam karung bersih dan rapi, beras ini berasal langsung dari petani lokal Kabupaten Ngawi sehingga kualitas dan kesegarannya terjamin.
                            ''',
                          ),

                          // Tab Penjual
                          _buildTabContent(
                            content: '''
                              Penjual: Pak Agus
                              Alamat: Jl. Raya Ngawi No. 123
                              Kontak: 0812-3456-7890
                              Rating: ★★★★☆ (4.5)
                            ''',
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget reusable untuk konten tab
  Widget _buildTabContent({required String content}) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray200.withOpacity(0.2),
            blurRadius: 8.r,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        content,
        style: TextStyle(
          fontSize: 14.sp,
          color: AppColors.gray900,
          height: 1.5,
        ),
      ),
    );
  }
}
