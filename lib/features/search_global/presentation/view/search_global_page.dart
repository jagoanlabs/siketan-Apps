import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:siketan/app/dependency_injector/import.dart';
import 'package:siketan/app/helper/date_format_helper.dart';
import 'package:siketan/app/helper/html_to_text_helper.dart';
import 'package:siketan/app/helper/kegiatan_status_helper.dart';
import 'package:siketan/features/home/presentation/widget/search_widget.dart';
import 'package:siketan/features/search_global/domain/repository/search_global_repository.dart';
import 'package:siketan/features/toko/presentation/widget/product_card_widget.dart';
import 'package:siketan/features/toko/presentation/widget/store_card_widget.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/widget/acara_card_widget.dart';
import 'package:siketan/shared/widget/news_card_widget.dart';
import 'package:siketan/features/search_global/presentation/bloc/search_global_bloc.dart';
import 'package:siketan/features/search_global/domain/model/search_global_response_model.dart'
    as search_global_model;
import 'package:siketan/shared/widget/shimmer_container_widget.dart';

class SearchGlobalPage extends StatelessWidget {
  final String searchQuery;
  const SearchGlobalPage({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchGlobalBloc(
        searchGlobalRepository: getIt<SearchGlobalRepository>(),
      ),
      child: SearchGlobalView(searchQuery: searchQuery),
    );
  }
}

class SearchGlobalView extends StatefulWidget {
  final String searchQuery;
  const SearchGlobalView({super.key, required this.searchQuery});

  @override
  State<SearchGlobalView> createState() => _SearchGlobalViewState();
}

class _SearchGlobalViewState extends State<SearchGlobalView> {
  ScrollController _scroll = ScrollController();
  TextEditingController _searchController = TextEditingController();
  bool isScrolled = false;

  int _selectedIndex = 0; // Index untuk chip yang aktif

  final List<String> _chipLabels = [
    "Semua (0)",
    "Produk (0)",
    "Toko (0)",
    "Berita (0)",
    "Kegiatan/Event (0)",
  ];

  @override
  void initState() {
    _searchController.text = widget.searchQuery;

    // first load
    context.read<SearchGlobalBloc>().add(
      SearchGlobalStarted(widget.searchQuery),
    );
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
                        context.read<SearchGlobalBloc>().add(
                          SearchGlobalQueryChanged(_searchController.text),
                        );
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
                                context.read<SearchGlobalBloc>().add(
                                  SearchGlobalFilterChanged(_chipLabels[index]),
                                );
                              },
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  BlocBuilder<SearchGlobalBloc, SearchGlobalState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return _buildLoading();
                      }

                      final products =
                          state.result?.data?.products?.items ?? [];
                      final tokos = state.result?.data?.tokos?.items ?? [];
                      final berita = state.result?.data?.berita?.items ?? [];
                      final events = state.result?.data?.events?.items ?? [];
                      _chipLabels[0] =
                          "Semua (${products.length + tokos.length + berita.length + events.length})";
                      _chipLabels[1] = "Produk (${products.length})";
                      _chipLabels[2] = "Toko (${tokos.length})";
                      _chipLabels[3] = "Berita (${berita.length})";
                      _chipLabels[4] = "Kegiatan/Event (${events.length})";

                      if (products.isEmpty &&
                          tokos.isEmpty &&
                          berita.isEmpty &&
                          events.isEmpty)
                        return const Center(
                          child: Text('Tidak ada hasil pencarian'),
                        );
                      final totalResults =
                          products.length +
                          tokos.length +
                          berita.length +
                          events.length;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Text(
                              'Ditemukan $totalResults hasil pencarian untuk “${state.query}”',
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
                              'Menampilkan 1-10 dari $totalResults hasil',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.gray600,
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          _buildSectionProduct(
                            products: state.result?.data?.products?.items ?? [],
                          ),
                          SizedBox(height: 24.h),
                          _buildSectionToko(
                            tokos: state.result?.data?.tokos?.items ?? [],
                          ),
                          SizedBox(height: 24.h),
                          _buildSectionBerita(
                            berita: state.result?.data?.berita?.items ?? [],
                          ),
                          SizedBox(height: 24.h),
                          _buildSectionAcara(
                            events: state.result?.data?.events?.items ?? [],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionProduct({
    required List<search_global_model.ProductsItem> products,
  }) {
    return products.isEmpty
        ? Container()
        : Container(
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
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCardWidget(
                      imageUrl: product.image ?? "",
                      name: product.namaProducts ?? "",
                      price: product.price ?? "",
                      id: product.id.toString(),
                    );
                  },
                ),
              ],
            ),
          );
  }

  Widget _buildSectionToko({
    required List<search_global_model.TokosItem> tokos,
  }) {
    return tokos.isEmpty
        ? Container()
        : Container(
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
                    childAspectRatio: 0.6, // Rasio untuk card produk
                  ),
                  itemCount: tokos.length,
                  itemBuilder: (context, index) {
                    final store = tokos[index];
                    return StoreCardWidget(
                      name: store.nama ?? "",
                      location: store.alamat ?? "",
                      id: store.id.toString(),
                    );
                  },
                ),
              ],
            ),
          );
  }

  Widget _buildSectionBerita({
    required List<search_global_model.BeritaItem> berita,
  }) {
    return berita.isEmpty
        ? Container()
        : Container(
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
                  itemCount: berita.length,
                  itemBuilder: (context, index) {
                    final beritaItem = berita[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: BeritaCard(
                        id: beritaItem.id.toString(),
                        imageUrl: beritaItem.image ?? "",
                        author: beritaItem.author ?? "",
                        title: beritaItem.title ?? "",
                        description: htmlToPlainText(beritaItem.isi ?? ""),
                        date: formatDateNullable(beritaItem.createdAt),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
  }

  Widget _buildSectionAcara({
    required List<search_global_model.EventsItem> events,
  }) {
    return events.isEmpty
        ? Container()
        : Container(
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
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final acara = events[index];
                    final status = getEventStatus(acara.eventDate);
                    final statusColor = getEventStatusColor(status);
                    final statusText = getEventStatusText(status);

                    return AcaraCard(
                      imageUrl: acara.image ?? "",
                      status: statusText,
                      statusColor: statusColor,
                      title: acara.title ?? "",
                      date: acara.eventTime ?? "",
                      time: formatDateNullable(acara.eventDate),
                      location: acara.tempat ?? "",
                    );
                  },
                ),
              ],
            ),
          );
  }

  Widget _buildLoading() {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // chip
          ShimmerContainerWidget(width: double.infinity, height: 32.h),
          SizedBox(height: 4.h),
          ShimmerContainerWidget(width: 200, height: 18.h),
          SizedBox(height: 16.h),
          // produk
          ShimmerContainerWidget(width: 120, height: 24.h),
          SizedBox(height: 12.h),
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
            itemCount: 6,
            itemBuilder: (context, index) {
              return ShimmerContainerWidget(
                width: double.infinity,
                height: 120.h,
              );
            },
          ),
          SizedBox(height: 24.h), //jarak card
          //toko
          ShimmerContainerWidget(width: 120, height: 24.h),
          SizedBox(height: 12.h),
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
            itemCount: 6,
            itemBuilder: (context, index) {
              return ShimmerContainerWidget(
                width: double.infinity,
                height: 120.h,
              );
            },
          ),
          SizedBox(height: 24.h), //jarak card
          //berita
          ShimmerContainerWidget(width: 120, height: 24.h),
          SizedBox(height: 12.h),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: ShimmerContainerWidget(
                  width: double.infinity,
                  height: 160.h,
                ),
              );
            },
          ),
          SizedBox(height: 24.h), //jarak card
          // event
          ShimmerContainerWidget(width: 120, height: 24.h),
          SizedBox(height: 12.h),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: ShimmerContainerWidget(
                  width: double.infinity,
                  height: 120.h,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
