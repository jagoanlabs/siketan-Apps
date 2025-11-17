import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
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

  // State pagination untuk masing-masing tab
  int _currentProductPage = 1;
  int _currentStorePage = 1;
  int _totalPages = 5; // Misal total page untuk semua tab

  // State search
  String _searchQueryProduct = '';
  String _searchQueryStore = '';

  // Data dummy
  List<Map<String, dynamic>> _ProductData = [
    {
      'image': 'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
      'name': 'Bibit Padi Siap Tanam Persemaian Sistem Kering',
      'price': 'Rp. 100.000',
      'id': '1',
    },
    {
      'image': 'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
      'name': 'Product 2',
      'price': 'Rp. 200.000',
      'id': '2',
    },
    {
      'image': 'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
      'name': 'Product 3',
      'price': 'Rp. 300.000',
      'id': '3',
    },
    {
      'image': 'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
      'name': 'Product 4',
      'price': 'Rp. 400.000',
      'id': '4',
    },
    {
      'image': 'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
      'name': 'Product 5',
      'price': 'Rp. 500.000',
      'id': '5',
    },
  ];

  final List<Map<String, dynamic>> _StoreData = [
    {
      'image': 'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
      'location': 'Desa Sekarjati, Karanganyar',
      'name': 'Toko Tani Maju',
      'id': '1',
    },
    {
      'image': 'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
      'location': 'Desa Sekarjati, Karanganyar',
      'name': 'Toko Tani Maju',
      'id': '2',
    },
    {
      'image': 'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
      'location': 'Desa Sekarjati, Karanganyar',
      'name': 'Toko Tani Maju',
      'id': '3',
    },
    {
      'image': 'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
      'location': 'Desa Sekarjati, Karanganyar',
      'name': 'Toko Tani Maju',
      'id': '4',
    },
    {
      'image': 'https://ik.imagekit.io/hw6fintvt1/IMG-1727920699145_gT97teFDU.jpg',
      'location': 'Desa Sekarjati, Karanganyar',
      'name': 'Toko Tani Maju',
      'id': '5',
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
            // Gradient Background (scrollable)
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
                        offset: Offset(0, 2),
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
                          'Prodok',
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


                // Tab Content (Tanpa tinggi tetap)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  child: SizedBox(
                    height: 600.h, // Tetapkan tinggi tetap agar tidak loncat
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // Tab Produk
                        _buildTabContent(
                          totalPages: _totalPages,
                          searchQuery: _searchQueryProduct,
                          onSearchChanged: (value) {
                            setState(() {
                              _searchQueryProduct = value;
                            });
                          },
                          onPageChanged: (page) {
                            setState(() {
                              _currentProductPage = page;
                            });
                          },
                          currentPage: _currentProductPage,
                          label: 'Product',
                          isAcara: true,
                        ),

                        // Tab Berita
                        _buildTabContent(
                          totalPages: _totalPages,
                          searchQuery: _searchQueryStore,
                          onSearchChanged: (value) {
                            setState(() {
                              _searchQueryStore = value;
                            });
                          },
                          onPageChanged: (page) {
                            setState(() {
                              _currentStorePage = page;
                            });
                          },
                          currentPage: _currentStorePage,
                          label: 'Toko',
                          isAcara: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget reusable untuk konten tab
  Widget _buildTabContent({
    required String searchQuery,
    required Function(String) onSearchChanged,
    required Function(int) onPageChanged,
    required int currentPage,
    required String label,
    required bool isAcara,
    required int totalPages,
  }) {
    final contentData = isAcara ? _ProductData : _StoreData;

    return _TabContent(
      totalPages: totalPages,
      searchQuery: searchQuery,
      onSearchChanged: onSearchChanged,
      contentData: contentData,
      isAcara: isAcara,
      currentPage: currentPage,
      onPageChanged: onPageChanged,
      label: label,
    );
  }
}

class _TabContent extends StatefulWidget {
  final String searchQuery;
  final Function(String) onSearchChanged;
  final List<Map<String, dynamic>> contentData;
  final bool isAcara;
  final int currentPage;
  final Function(int) onPageChanged;
  final String label;
  final int totalPages;

  const _TabContent({
    required this.searchQuery,
    required this.onSearchChanged,
    required this.contentData,
    required this.isAcara,
    required this.currentPage,
    required this.onPageChanged,
    required this.label,
    required this.totalPages,
  });

  @override
  State<_TabContent> createState() => _TabContentState();
}

class _TabContentState extends State<_TabContent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        // Search Bar
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.gray200, width: 1),
            boxShadow: [
              BoxShadow(
                color: AppColors.gray200.withOpacity(0.3),
                blurRadius: 8.r,
                offset: Offset(0, 2),
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
                  onChanged: widget.onSearchChanged,
                  decoration: InputDecoration(
                    hintText: "Cari ${widget.label}...",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 16.h),

        // Konten LIST / GRID
        widget.isAcara ? _buildGridproduct() : _buildGridstore(),

        SizedBox(height: 16.h),

        _buildPagination(
          currentPage: widget.currentPage,
          onPageChanged: widget.onPageChanged,
          totalPages: widget.totalPages,
        ),
      ],
    );
  }

  Widget _buildGridproduct() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 0.60,
      ),
      itemCount: widget.contentData.length,
      itemBuilder: (context, index) {
        final data = widget.contentData[index];
        return ProductCardWidget(
          imageUrl: data['image'],
          name: data['name'] ?? "",
          price: data['price'] ?? "",
          id: data['id'],
        );
      },
    );
  }

  Widget _buildGridstore() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 0.60,
      ),
      itemCount: widget.contentData.length,
      itemBuilder: (context, index) {
        final data = widget.contentData[index];
        return StoreCardWidget(
          imageUrl: data['image'],
          name: data['name'],
          location: data['location'],
          id: data['id'],
        );
      },
    );
  }
}

// Widget pagination server-side (scrollable) - dipindahkan ke sini agar bisa diakses oleh _TabContent
Widget _buildPagination({
  required int currentPage,
  required Function(int) onPageChanged,
  required int totalPages,
}) {
  return SizedBox(
    height: 48.h,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Tombol Previous
        IconButton(
          onPressed: currentPage == 1
              ? null
              : () => onPageChanged(currentPage - 1),
          icon: Iconify(
            MaterialSymbols.chevron_left_rounded,
            color: currentPage == 1 ? AppColors.gray300 : AppColors.green4,
          ),
        ),

        // Nomor Halaman (Scrollable)
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: List.generate(totalPages, (index) {
              int pageNum = index + 1;
              bool isCurrent = pageNum == currentPage;

              if (pageNum == 1 ||
                  pageNum == totalPages ||
                  (pageNum >= currentPage - 1 && pageNum <= currentPage + 1)) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: ElevatedButton(
                    onPressed: () => onPageChanged(pageNum),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isCurrent
                          ? AppColors.green4
                          : Colors.white,
                      foregroundColor: isCurrent
                          ? Colors.white
                          : AppColors.gray900,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(8.w),
                    ),
                    child: Text(
                      pageNum.toString(),
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ),
                );
              } else if (pageNum == currentPage - 2 ||
                  pageNum == currentPage + 2) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Text('...', style: TextStyle(fontSize: 12.sp)),
                );
              }
              return const SizedBox.shrink();
            }).where((widget) => widget != const SizedBox.shrink()).toList(),
          ),
        ),

        // Tombol Next
        IconButton(
          onPressed: currentPage == totalPages
              ? null
              : () => onPageChanged(currentPage + 1),
          icon: Iconify(
            MaterialSymbols.chevron_right_rounded,
            color: currentPage == totalPages
                ? AppColors.gray300
                : AppColors.green4,
          ),
        ),
      ],
    ),
  );
}
