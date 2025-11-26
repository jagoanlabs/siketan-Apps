import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
// Sesuaikan import di bawah ini dengan struktur project Anda
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/features/toko/presentation/widget/product_card_widget.dart';
import 'package:siketan/features/toko/presentation/widget/store_card_widget.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/widget/banner_home_widget.dart';

class TokoPage extends StatelessWidget {
  const TokoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TokoPageView();
  }
}

class TokoPageView extends StatefulWidget {
  const TokoPageView({super.key});

  @override
  State<TokoPageView> createState() => _TokoPageViewState();
}

class _TokoPageViewState extends State<TokoPageView>
    with TickerProviderStateMixin {
  late TabController _tabController;

  // State search
  String _searchQueryProduct = '';
  String _searchQueryStore = '';

  // Data dummy Product
  final List<Map<String, dynamic>> _productData = [
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
      'name': 'Pupuk Organik Cair Multiguna',
      'price': 'Rp. 200.000',
      'id': '2',
    },
    {
      'image':
          'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
      'name': 'Benih Jagung Hibrida Unggul',
      'price': 'Rp. 300.000',
      'id': '3',
    },
    {
      'image':
          'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
      'name': 'Obat Pembasmi Hama Wereng',
      'price': 'Rp. 400.000',
      'id': '4',
    },
    {
      'image':
          'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
      'name': 'Alat Semprot Pertanian Elektrik',
      'price': 'Rp. 500.000',
      'id': '5',
    },
  ];

  // Data dummy Store
  final List<Map<String, dynamic>> _storeData = [
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
      'location': 'Kecamatan Ngawi Kota',
      'name': 'Toko Pertanian Berkah',
      'id': '2',
    },
    {
      'image':
          'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
      'location': 'Desa Geneng',
      'name': 'UD. Tani Sejahtera',
      'id': '3',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray50,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            // Gradient Background
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 72.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    "Informasi Pertanian",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray900,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                BannerHomeWidget(
                  title: 'Toko Pertanian',
                  subtitle: 'Informasi Toko Pertanian di Kab. Ngawi',
                ),
                SizedBox(height: 16.h),

                // Tab Bar
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.gray200.withOpacity(0.2),
                        blurRadius: 8.r,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TabBar(
                    controller: _tabController,
                    labelColor: AppColors.green4,
                    unselectedLabelColor: AppColors.gray500,
                    dividerHeight: 0,
                    indicatorColor: AppColors.green4,
                    tabs: [
                      Tab(
                        child: Text(
                          'Produk',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Toko',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Tab Content - DINAMIS HEIGHT (Tanpa SizedBox fixed height)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  child: AnimatedBuilder(
                    animation: _tabController,
                    builder: (context, child) {
                      // Logic switch tab
                      if (_tabController.index == 0) {
                        return _ProductTabContent(
                          searchQuery: _searchQueryProduct,
                          data: _productData,
                          onSearchChanged: (value) {
                            setState(() {
                              _searchQueryProduct = value;
                            });
                          },
                        );
                      } else {
                        return _StoreTabContent(
                          searchQuery: _searchQueryStore,
                          data: _storeData,
                          onSearchChanged: (value) {
                            setState(() {
                              _searchQueryStore = value;
                            });
                          },
                        );
                      }
                    },
                  ),
                ),

                SizedBox(height: 24.h), // Bottom spacing
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// WIDGET KHUSUS TAB PRODUK
// ============================================================================
class _ProductTabContent extends StatelessWidget {
  final String searchQuery;
  final List<Map<String, dynamic>> data;
  final Function(String) onSearchChanged;

  const _ProductTabContent({
    Key? key,
    required this.searchQuery,
    required this.data,
    required this.onSearchChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Logic filter produk
    final filteredData = data.where((item) {
      final name = item['name'].toString().toLowerCase();
      final query = searchQuery.toLowerCase();
      return name.contains(query);
    }).toList();

    return Column(
      children: [
        SizedBox(height: 16.h),
        // Search Bar Produk
        _buildSearchBar(hint: "Cari Produk...", onChanged: onSearchChanged),
        SizedBox(height: 16.h),

        // Grid Produk
        filteredData.isEmpty
            ? _buildEmptyState("Produk tidak ditemukan")
            : GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true, // Agar tinggi dinamis
                physics:
                    const NeverScrollableScrollPhysics(), // Scroll ikut parent
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 0.60,
                ),
                itemCount: filteredData.length,
                itemBuilder: (context, index) {
                  final item = filteredData[index];
                  return ProductCardWidget(
                    imageUrl: item['image'],
                    name: item['name'] ?? "",
                    price: item['price'] ?? "",
                    id: item['id'],
                  );
                },
              ),
      ],
    );
  }
}

// ============================================================================
// WIDGET KHUSUS TAB TOKO
// ============================================================================
class _StoreTabContent extends StatelessWidget {
  final String searchQuery;
  final List<Map<String, dynamic>> data;
  final Function(String) onSearchChanged;

  const _StoreTabContent({
    Key? key,
    required this.searchQuery,
    required this.data,
    required this.onSearchChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Logic filter toko
    final filteredData = data.where((item) {
      final name = item['name'].toString().toLowerCase();
      final location = item['location'].toString().toLowerCase();
      final query = searchQuery.toLowerCase();
      return name.contains(query) || location.contains(query);
    }).toList();

    return Column(
      children: [
        SizedBox(height: 16.h),
        // Search Bar Toko
        _buildSearchBar(hint: "Cari Toko...", onChanged: onSearchChanged),
        SizedBox(height: 16.h),

        // Grid Toko
        filteredData.isEmpty
            ? _buildEmptyState("Toko tidak ditemukan")
            : GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true, // Agar tinggi dinamis
                physics:
                    const NeverScrollableScrollPhysics(), // Scroll ikut parent
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 0.60, // Sesuaikan rasio kartu toko
                ),
                itemCount: filteredData.length,
                itemBuilder: (context, index) {
                  final item = filteredData[index];
                  return StoreCardWidget(
                    imageUrl: item['image'],
                    name: item['name'],
                    location: item['location'],
                    id: item['id'],
                  );
                },
              ),
      ],
    );
  }
}

// ============================================================================
// HELPER WIDGETS
// ============================================================================

Widget _buildSearchBar({
  required String hint,
  required Function(String) onChanged,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(color: AppColors.gray200, width: 1),
      boxShadow: [
        BoxShadow(
          color: AppColors.gray200.withOpacity(0.3),
          blurRadius: 8.r,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      children: [
        Iconify(
          MaterialSymbols.search_rounded,
          size: 20.w,
          color: AppColors.gray500,
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(fontSize: 14.sp, color: AppColors.gray400),
              border: InputBorder.none,
            ),
            style: TextStyle(fontSize: 14.sp, color: AppColors.gray900),
          ),
        ),
      ],
    ),
  );
}

Widget _buildEmptyState(String message) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 40.h),
    child: Center(
      child: Column(
        children: [
          Iconify(
            MaterialSymbols.inbox_rounded,
            size: 48.w,
            color: AppColors.gray300,
          ),
          SizedBox(height: 12.h),
          Text(
            message,
            style: TextStyle(color: AppColors.gray500, fontSize: 14.sp),
          ),
        ],
      ),
    ),
  );
}
