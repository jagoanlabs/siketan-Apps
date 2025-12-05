import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:siketan/core/utils/error_handler.dart';
import 'package:siketan/features/toko/domain/model/product_item_dto.dart';
import 'package:siketan/features/toko/domain/model/product_response_model.dart';
import 'package:siketan/features/toko/domain/model/store_item_dto.dart';
import 'package:siketan/features/toko/domain/repository/product_repository.dart';

part 'product_toko_event.dart';
part 'product_toko_state.dart';

class ProductTokoBloc extends Bloc<ProductTokoEvent, ProductTokoState> {
  final ProductRepository productRepository;
  ProductTokoBloc({required this.productRepository})
    : super(ProductTokoInitial()) {
    on<ProductTokoEvent>((event, emit) {});
    on<ProductTokoEventGetProduct>(_onProductTokoEventGetProduct);
  }

  Future<void> _onProductTokoEventGetProduct(
    ProductTokoEventGetProduct event,
    Emitter<ProductTokoState> emit,
  ) async {
    emit(ProductTokoLoading());

    try {
      final result = await productRepository.getProduct(
        event.page,
        event.limit,
      );

      // ====== Pisahkan Produk ======
      final products =
          result.data?.map((p) {
            return ProductItem(
              id: p.id ?? 0,
              name: p.namaProducts ?? "-",
              price: p.harga ?? "0",
              imageUrl: p.fotoTanaman ?? "",
            );
          }).toList() ??
          [];

      // ====== Pisahkan Toko (unique) ======
      final Map<int, StoreItem> storeMap = {};

      for (final p in result.data ?? []) {
        final akun = p.tblAkun;
        if (akun == null) continue;

        final ownerId = akun.id;
        if (ownerId == null) continue;

        String ownerName = akun.nama ?? "-";
        String? address;

        // ambil alamat dari petani atau penyuluh
        if (akun.petani != null) {
          address = akun.petani!.alamat;
        } else if (akun.penyuluh != null) {
          address = akun.penyuluh!.alamat;
        }

        if (!storeMap.containsKey(ownerId)) {
          storeMap[ownerId] = StoreItem(
            id: ownerId,
            name: ownerName,
            location: address,
            photoUrl: akun.foto,
          );
        }
      }

      final stores = storeMap.values.toList();

      // Emit state loaded
      emit(ProductTokoLoaded(products: products, stores: stores, raw: result));
    } catch (e) {
      emit(ProductTokoError(message: handleAppError(e)));
    }
  }
}
