import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:siketan/features/home/presentation/widget/search_widget.dart';
import 'package:siketan/features/toko/presentation/widget/product_card_widget.dart';
import 'package:siketan/features/toko/presentation/widget/store_card_widget.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/widget/acara_card_widget.dart';
import 'package:siketan/shared/widget/news_card_widget.dart';

class SearchGlobalPage extends StatelessWidget {
  const SearchGlobalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SearchGlobalView();
  }
}

class SearchGlobalView extends StatefulWidget {
  const SearchGlobalView({super.key});

  @override
  State<SearchGlobalView> createState() => _SearchGlobalViewState();
}

class _SearchGlobalViewState extends State<SearchGlobalView> {
  ScrollController _scroll = ScrollController();
  TextEditingController _searchController = TextEditingController();
  bool isScrolled = false;

  int _selectedIndex = 0; // Index untuk chip yang aktif

  final List<String> _chipLabels = [
    "Semua (10)",
    "Produk (4)",
    "Toko (2)",
    "Berita (2)",
    "Kegiatan (2)",
  ];

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
              child: const Text("Pencarian Keseluruhan"),
            ),
            centerTitle: false,
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scroll,
        physics: const BouncingScrollPhysics(),
        child: Stack(
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
            Padding(
              padding: EdgeInsets.only(top: kToolbarHeight + 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: SearchBarWidget(
                      controller: _searchController,
                      onSearchTap: () {
                        // aksi ketika icon search ditekan
                        debugPrint('Search clicked!');
                      },
                    ),
                  ),
                  // chip menu
                  SizedBox(height: 24.h),
                  Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(_chipLabels.length, (index) {
                          return Padding(
                            padding: index == 0
                                ? EdgeInsets.only(left: 24.w, right: 12)
                                : index == _chipLabels.length - 1
                                ? EdgeInsets.only(right: 24.w)
                                : EdgeInsets.only(right: 12.w),
                            child: ChoiceChip(
                              checkmarkColor: Colors.white,
                              label: Text(
                                _chipLabels[index],
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: _selectedIndex == index
                                      ? Colors.white
                                      : AppColors.gray700,
                                ),
                              ),
                              selected: _selectedIndex == index,
                              selectedColor: AppColors.blue4,
                              backgroundColor: Colors.white,
                              side: BorderSide(
                                color: _selectedIndex == index
                                    ? AppColors.blue2
                                    : AppColors.gray300,
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              onSelected: (bool selected) {
                                setState(() {
                                  _selectedIndex = selected ? index : 0;
                                });
                              },
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      'Ditemukan 10 hasil pencarian untuk “Beras” (diurutkan berdasarkan relevansi)',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.gray900,
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      'Menampilkan 1-10 dari 10 hasil',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.gray600,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  _buildSectionProduct(),
                  SizedBox(height: 24.h),
                  _buildSectionToko(),
                  SizedBox(height: 24.h),
                  _buildSectionBerita(),
                  SizedBox(height: 24.h),
                  _buildSectionAcara(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionProduct() {
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 8.w,
            children: [
              Iconify(Carbon.product, color: AppColors.blue4),
              Text(
                "Produk (4)",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.gray900,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Grid Produk
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.60, // Rasio untuk card produk
            ),
            itemCount: _ProductData.length,
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
        ],
      ),
    );
  }

  Widget _buildSectionToko() {
    final List<Map<String, dynamic>> _StoreData = [
      {
        'image':
            'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
        'location': 'Desa Sekarjati, Karanganyar',
        'name': 'Toko Tani Maju',
        'id': '1',
      },
      {
        'image':
            'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
        'location': 'Desa Sekarjati, Karanganyar',
        'name': 'Toko Tani Maju',
        'id': '2',
      },
      {
        'image':
            'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
        'location': 'Desa Sekarjati, Karanganyar',
        'name': 'Toko Tani Maju',
        'id': '3',
      },
      {
        'image':
            'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
        'location': 'Desa Sekarjati, Karanganyar',
        'name': 'Toko Tani Maju',
        'id': '4',
      },
      {
        'image':
            'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
        'location': 'Desa Sekarjati, Karanganyar',
        'name': 'Toko Tani Maju',
        'id': '5',
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 8.w,
            children: [
              Iconify(Carbon.store, color: AppColors.blue4),
              Text(
                "Toko (4)",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.gray900,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Grid Produk
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.60, // Rasio untuk card produk
            ),
            itemCount: _StoreData.length,
            itemBuilder: (context, index) {
              final store = _StoreData[index];
              return StoreCardWidget(
                imageUrl: store['image'],
                name: store['name'],
                location: store['location'],
                id: store['id'],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionBerita() {
    List<Map<String, dynamic>> _beritaData = [
      {
        'image': 'https://placehold.co/600x400',
        'author': 'Agus Pasianto, S.P., M.M.A',
        'title':
            'Perangkap Tikus dengan Bubu. Salah Satu Strategi Pengendali Tikus...',
        'description':
            'Kalau masih ada yang ramah lingkungan, kenapa pakai yang ekstrim. Perangkap...',
        'date': '16 Agustus 2024',
      },
      {
        'image': 'https://placehold.co/600x400',
        'author': 'Dewi Sartika, M.P.',
        'title': 'Pupuk Organik Lebih Baik dari Kimia?',
        'description':
            'Pupuk organik tidak hanya menyuburkan tanah, tapi juga menjaga kelestarian ekosistem pertanian jangka panjang.',
        'date': '18 Agustus 2024',
      },
      {
        'image': 'https://placehold.co/600x400',
        'author': 'Budi Santoso, S.T.P.',
        'title': 'Teknologi Pertanian Digital Mulai Masuk Desa',
        'description':
            'Aplikasi mobile untuk pemantauan cuaca, harga pasar, dan prediksi hasil panen kini bisa diakses petani di pelosok desa.',
        'date': '20 Agustus 2024',
      },
      {
        'image': 'https://placehold.co/600x400',
        'author': 'Dewi Sartika, M.P.',
        'title': 'Pupuk Organik Lebih Baik dari Kimia?',
        'description':
            'Pupuk organik tidak hanya menyuburkan tanah, tapi juga menjaga kelestarian ekosistem pertanian jangka panjang.',
        'date': '18 Agustus 2024',
      },
      {
        'image': 'https://placehold.co/600x400',
        'author': 'Budi Santoso, S.T.P.',
        'title': 'Teknologi Pertanian Digital Mulai Masuk Desa',
        'description':
            'Aplikasi mobile untuk pemantauan cuaca, harga pasar, dan prediksi hasil panen kini bisa diakses petani di pelosok desa.',
        'date': '20 Agustus 2024',
      },
    ];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 8.w,
            children: [
              Iconify(Ri.newspaper_line, color: AppColors.blue4),
              Text(
                "Berita (4)",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.gray900,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // List Berita
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _beritaData.length,
            itemBuilder: (context, index) {
              final berita = _beritaData[index];
              return BeritaCard(
                id: berita['id'],
                imageUrl: berita['image'],
                author: berita['author'],
                title: berita['title'],
                description: berita['description'],
                date: berita['date'],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionAcara() {
    List<Map<String, dynamic>> _acaraData = [
      {
        'image': 'https://placehold.co/600x400',
        'status': 'Sudah berakhir',
        'statusColor': AppColors.red4,
        'title': 'Pendampingan Lomba Cipta Menu B2SA',
        'date': '16 Agustus 2024',
        'time': '08:00 - 11:00',
        'location': 'Rumah Bu Widy',
      },
      {
        'image': 'https://placehold.co/600x400',
        'status': 'Sedang Berlangsung',
        'statusColor': AppColors.green4,
        'title': 'Pelatihan Pertanian Organik',
        'date': '20 Agustus 2024',
        'time': '09:00 - 15:00',
        'location': 'Balai Desa Ngawi',
      },
      {
        'image': 'https://placehold.co/600x400',
        'status': 'Akan Datang',
        'statusColor': AppColors.blue4,
        'title': 'Sosialisasi Pupuk Subsidi',
        'date': '5 September 2024',
        'time': '10:00 - 12:00',
        'location': 'Kantor Kecamatan',
      },
      {
        'image': 'https://placehold.co/600x400',
        'status': 'Sudah berakhir',
        'statusColor': AppColors.red4,
        'title': 'Pendampingan Lomba Cipta Menu B2SA',
        'date': '16 Agustus 2024',
        'time': '08:00 - 11:00',
        'location': 'Rumah Bu Widy',
      },
      {
        'image': 'https://placehold.co/600x400',
        'status': 'Sedang Berlangsung',
        'statusColor': AppColors.green4,
        'title': 'Pelatihan Pertanian Organik',
        'date': '20 Agustus 2024',
        'time': '09:00 - 15:00',
        'location': 'Balai Desa Ngawi',
      },
    ];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 8.w,
            children: [
              Iconify(Ri.newspaper_line, color: AppColors.blue4),
              Text(
                "Kegiatan (4)",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.gray900,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // List Berita
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _acaraData.length,
            itemBuilder: (context, index) {
              final acara = _acaraData[index];
              return AcaraCard(
                imageUrl: acara['image'],
                status: acara['status'],
                statusColor: acara['statusColor'],
                title: acara['title'],
                date: acara['date'],
                time: acara['time'],
                location: acara['location'],
              );
            },
          ),
        ],
      ),
    );
  }
}
