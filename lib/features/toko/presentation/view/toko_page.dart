import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/app/dependency_injector/import.dart';
import 'package:siketan/core/utils/logger/logger.dart';
import 'package:siketan/features/toko/domain/model/product_item_dto.dart';
import 'package:siketan/features/toko/domain/model/store_item_dto.dart';

import 'package:siketan/features/toko/domain/repository/product_repository.dart';
import 'package:siketan/features/toko/presentation/bloc/product_toko_bloc.dart';
import 'package:siketan/features/toko/presentation/widget/product_card_widget.dart';
import 'package:siketan/features/toko/presentation/widget/store_card_widget.dart';

import 'package:siketan/shared/style/color.dart';
import 'package:siketan/shared/widget/banner_home_widget.dart';
import 'package:siketan/shared/widget/error_widget.dart';
import 'package:siketan/shared/widget/shimmer_container_widget.dart';

class TokoPage extends StatelessWidget {
  const TokoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ProductTokoBloc(productRepository: getIt<ProductRepository>())
            ..add(ProductTokoEventGetProduct(page: 1, limit: 100)),
      child: const TokoPageView(),
    );
  }
}

class TokoPageView extends StatefulWidget {
  const TokoPageView({super.key});

  @override
  State<TokoPageView> createState() => _TokoPageViewState();
}

class _TokoPageViewState extends State<TokoPageView>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;

  String _searchQueryProduct = '';
  String _searchQueryStore = '';

  @override
  bool get wantKeepAlive => true;

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
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.gray50,
      body: EasyRefresh(
        header: const ClassicHeader(
          showMessage: false,
          armedText: 'Lepaskan',
          dragText: 'Tarik ke bawah untuk refresh',
          failedText: 'Refresh gagal',
          readyText: 'Merefresh...',
          processingText: "Merefresh...",
          processedText: "Refresh berhasil",
        ),
        triggerAxis: Axis.vertical,
        onRefresh: () {
          logger.d('refresh');
          // aksi ketika icon search ditekan
          context.read<ProductTokoBloc>().add(
            ProductTokoEventGetProduct(page: 1, limit: 100),
          );
        },
        child: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
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
                      "Produk Pertanian",
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

                  _buildTabBar(),

                  BlocBuilder<ProductTokoBloc, ProductTokoState>(
                    builder: (context, state) {
                      if (state is ProductTokoLoading) {
                        return _buildLoading();
                      }

                      if (state is ProductTokoError) {
                        return ErrorMessageWidget(
                          message: state.message,
                          size: ErrorSize.L,
                          padding: EdgeInsets.only(
                            left: 24.w,
                            right: 24.w,
                            top: MediaQuery.of(context).size.height * 0.15,
                          ),
                        );
                      }

                      if (state is ProductTokoLoaded) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 24.w),
                          child: AnimatedBuilder(
                            animation: _tabController,
                            builder: (context, child) {
                              if (_tabController.index == 0) {
                                return _ProductTabContent(
                                  searchQuery: _searchQueryProduct,
                                  products: state.products,
                                  onSearchChanged: (value) {
                                    setState(() => _searchQueryProduct = value);
                                  },
                                );
                              } else {
                                return _StoreTabContent(
                                  searchQuery: _searchQueryStore,
                                  stores: state.stores,
                                  onSearchChanged: (value) {
                                    setState(() => _searchQueryStore = value);
                                  },
                                );
                              }
                            },
                          ),
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
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
            child: Text("Produk", style: TextStyle(fontSize: 14.sp)),
          ),
          Tab(
            child: Text("Toko", style: TextStyle(fontSize: 14.sp)),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Column(
        children: [
          ShimmerContainerWidget(height: 40.h, width: double.infinity),
          SizedBox(height: 16.h),
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 0.6,
            ),
            itemCount: 6,
            itemBuilder: (_, __) =>
                ShimmerContainerWidget(height: 120.h, width: double.infinity),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
///////////////////////// TAB VIEW PRODUK  ////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

class _ProductTabContent extends StatelessWidget {
  final String searchQuery;
  final List<ProductItem> products;
  final Function(String) onSearchChanged;

  const _ProductTabContent({
    super.key,
    required this.searchQuery,
    required this.products,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    final filtered = products.where((p) {
      return p.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Column(
      children: [
        SizedBox(height: 16.h),
        _buildSearchBar("Cari Produk...", onSearchChanged),
        SizedBox(height: 16.h),

        filtered.isEmpty
            ? _buildEmpty("Produk tidak ditemukan")
            : GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 0.60,
                ),
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final item = filtered[index];
                  return ProductCardWidget(
                    id: item.id.toString(),
                    name: item.name,
                    price: item.price,
                    imageUrl: item.imageUrl,
                  );
                },
              ),
      ],
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
///////////////////////// TAB VIEW TOKO  //////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

class _StoreTabContent extends StatelessWidget {
  final String searchQuery;
  final List<StoreItem> stores;
  final Function(String) onSearchChanged;

  const _StoreTabContent({
    super.key,
    required this.searchQuery,
    required this.stores,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    final filtered = stores.where((s) {
      final q = searchQuery.toLowerCase();
      return s.name.toLowerCase().contains(q) ||
          (s.location ?? "").toLowerCase().contains(q);
    }).toList();

    return Column(
      children: [
        SizedBox(height: 16.h),
        _buildSearchBar("Cari Toko...", onSearchChanged),
        SizedBox(height: 16.h),

        filtered.isEmpty
            ? _buildEmpty("Toko tidak ditemukan")
            : GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 0.58,
                ),
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final item = filtered[index];
                  return StoreCardWidget(
                    id: item.id.toString(),
                    name: item.name,
                    location: item.location.toString(),
                  );
                },
              ),
      ],
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
///////////////////////////// HELPER UI ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

Widget _buildSearchBar(String hint, Function(String) onChanged) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(color: AppColors.gray200),
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
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildEmpty(String text) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 40.h),
    child: Column(
      children: [
        Iconify(
          MaterialSymbols.inbox_rounded,
          size: 48.w,
          color: AppColors.gray300,
        ),
        SizedBox(height: 12.h),
        Text(text, style: TextStyle(color: AppColors.gray500)),
      ],
    ),
  );
}
