import 'package:flutter/material.dart';
import 'package:siketan/core/constant/image/image_config.dart';
import 'package:siketan/features/data/presentation/widget/table_widget.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siketan/shared/widget/acara_card_widget.dart';
import 'package:siketan/shared/widget/banner_home_widget.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/shared/widget/news_card_widget.dart';

class InformasiPage extends StatelessWidget {
  const InformasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const InformasiPageView();
  }
}

class InformasiPageView extends StatefulWidget {
  const InformasiPageView({super.key});

  @override
  State<InformasiPageView> createState() => _InformasiPageViewState();
}

class _InformasiPageViewState extends State<InformasiPageView>
    with TickerProviderStateMixin {
  late TabController _tabController;

  // State pagination untuk masing-masing tab
  int _currentAcaraPage = 1;
  int _currentBeritaPage = 1;
  int _totalPages = 5; // Misal total page untuk semua tab

  // State search
  String _searchQueryAcara = '';
  String _searchQueryBerita = '';

  // Data dummy
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
                  title: 'Informasi Pertanian',
                  subtitle: 'Informasi Statistik Data Pertanian di Kab. Ngawi',
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
                          'Acara',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Berita',
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

                // Tab Content (Tanpa tinggi tetap)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                  child: SizedBox(
                    height: 600.h, // Tetapkan tinggi tetap agar tidak loncat
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // Tab Acara
                        _buildTabContent(
                          totalPages: _totalPages,
                          searchQuery: _searchQueryAcara,
                          onSearchChanged: (value) {
                            setState(() {
                              _searchQueryAcara = value;
                            });
                          },
                          onPageChanged: (page) {
                            setState(() {
                              _currentAcaraPage = page;
                            });
                          },
                          currentPage: _currentAcaraPage,
                          label: 'Acara',
                          isAcara: true,
                        ),

                        // Tab Berita
                        _buildTabContent(
                          totalPages: _totalPages,
                          searchQuery: _searchQueryBerita,
                          onSearchChanged: (value) {
                            setState(() {
                              _searchQueryBerita = value;
                            });
                          },
                          onPageChanged: (page) {
                            setState(() {
                              _currentBeritaPage = page;
                            });
                          },
                          currentPage: _currentBeritaPage,
                          label: 'Berita',
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
    final contentData = isAcara ? _acaraData : _beritaData;

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

// Widget tambahan untuk masing-masing tab, dengan keep alive
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

class _TabContentState extends State<_TabContent> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Penting untuk keep alive

    return Column(
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
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.gray400,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 14.sp, color: AppColors.gray900),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 16.h),

        // Konten Tab Scrollable (AcaraCard atau BeritaCard) + Pagination
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...widget.contentData.map((data) {
                  if (widget.isAcara) {
                    return AcaraCard(
                      imageUrl: data['image'],
                      status: data['status'],
                      statusColor: data['statusColor'],
                      title: data['title'],
                      date: data['date'],
                      time: data['time'],
                      location: data['location'],
                    );
                  }
                  return BeritaCard(
                    imageUrl: data['image'],
                    author: data['author'],
                    title: data['title'],
                    description: data['description'],
                    date: data['date'],
                  );
                }).toList(),
                SizedBox(height: 16.h),
                _buildPagination(
                  currentPage: widget.currentPage,
                  onPageChanged: widget.onPageChanged,
                  totalPages: widget.totalPages,
                ),
              ],
            ),
          ),
        ),
      ],
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
              } else if (pageNum == currentPage - 2 || pageNum == currentPage + 2) {
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