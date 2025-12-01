// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_global_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchGlobalResponseModel _$SearchGlobalResponseModelFromJson(
  Map<String, dynamic> json,
) => SearchGlobalResponseModel(
  message: json['message'] as String?,
  query: json['query'] as String?,
  type: json['type'] as String?,
  sortBy: json['sortBy'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
  pagination: json['pagination'] == null
      ? null
      : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
  allResults: json['allResults'] == null
      ? null
      : AllResults.fromJson(json['allResults'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SearchGlobalResponseModelToJson(
  SearchGlobalResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'query': instance.query,
  'type': instance.type,
  'sortBy': instance.sortBy,
  'data': instance.data,
  'pagination': instance.pagination,
  'allResults': instance.allResults,
};

AllResults _$AllResultsFromJson(Map<String, dynamic> json) => AllResults(
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => AllResultsItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num?)?.toInt(),
  showing: (json['showing'] as num?)?.toInt(),
);

Map<String, dynamic> _$AllResultsToJson(AllResults instance) =>
    <String, dynamic>{
      'items': instance.items,
      'total': instance.total,
      'showing': instance.showing,
    };

AllResultsItem _$AllResultsItemFromJson(Map<String, dynamic> json) =>
    AllResultsItem(
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      satuan: json['satuan'] as String?,
      stock: (json['stock'] as num?)?.toInt(),
      status: json['status'] as String?,
      image: json['image'] as String?,
      seller: json['seller'] == null
          ? null
          : Seller.fromJson(json['seller'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      namaProducts: json['namaProducts'] as String?,
      deskripsi: json['deskripsi'] as String?,
      relevanceScore: (json['relevanceScore'] as num?)?.toInt(),
      searchType: json['searchType'] as String?,
      location: json['location'] as String?,
      participants: json['participants'] as String?,
      eventDate: json['eventDate'] == null
          ? null
          : DateTime.parse(json['eventDate'] as String),
      eventTime: json['eventTime'] as String?,
      author: json['author'] as String?,
      namaKegiatan: json['namaKegiatan'] as String?,
      isi: json['isi'] as String?,
      tempat: json['tempat'] as String?,
      peserta: json['peserta'] as String?,
      content: json['content'] as String?,
      excerpt: json['excerpt'] as String?,
      category: json['category'] as String?,
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      judul: json['judul'] as String?,
      kategori: json['kategori'] as String?,
      createdBy: json['createdBy'] as String?,
    );

Map<String, dynamic> _$AllResultsItemToJson(AllResultsItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'satuan': instance.satuan,
      'stock': instance.stock,
      'status': instance.status,
      'image': instance.image,
      'seller': instance.seller,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'namaProducts': instance.namaProducts,
      'deskripsi': instance.deskripsi,
      'relevanceScore': instance.relevanceScore,
      'searchType': instance.searchType,
      'location': instance.location,
      'participants': instance.participants,
      'eventDate': instance.eventDate?.toIso8601String(),
      'eventTime': instance.eventTime,
      'author': instance.author,
      'namaKegiatan': instance.namaKegiatan,
      'isi': instance.isi,
      'tempat': instance.tempat,
      'peserta': instance.peserta,
      'content': instance.content,
      'excerpt': instance.excerpt,
      'category': instance.category,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'judul': instance.judul,
      'kategori': instance.kategori,
      'createdBy': instance.createdBy,
    };

Seller _$SellerFromJson(Map<String, dynamic> json) =>
    Seller(name: json['name'] as String?, role: json['role'] as String?);

Map<String, dynamic> _$SellerToJson(Seller instance) => <String, dynamic>{
  'name': instance.name,
  'role': instance.role,
};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  products: json['products'] == null
      ? null
      : Products.fromJson(json['products'] as Map<String, dynamic>),
  tokos: json['tokos'] == null
      ? null
      : Tokos.fromJson(json['tokos'] as Map<String, dynamic>),
  berita: json['berita'] == null
      ? null
      : Berita.fromJson(json['berita'] as Map<String, dynamic>),
  events: json['events'] == null
      ? null
      : Events.fromJson(json['events'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'products': instance.products,
  'tokos': instance.tokos,
  'berita': instance.berita,
  'events': instance.events,
};

Berita _$BeritaFromJson(Map<String, dynamic> json) => Berita(
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => BeritaItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num?)?.toInt(),
  showing: (json['showing'] as num?)?.toInt(),
);

Map<String, dynamic> _$BeritaToJson(Berita instance) => <String, dynamic>{
  'items': instance.items,
  'total': instance.total,
  'showing': instance.showing,
};

BeritaItem _$BeritaItemFromJson(Map<String, dynamic> json) => BeritaItem(
  id: (json['id'] as num?)?.toInt(),
  type: json['type'] as String?,
  title: json['title'] as String?,
  content: json['content'] as String?,
  excerpt: json['excerpt'] as String?,
  category: json['category'] as String?,
  image: json['image'] as String?,
  author: json['author'] as String?,
  publishedAt: json['publishedAt'] == null
      ? null
      : DateTime.parse(json['publishedAt'] as String),
  status: json['status'],
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  judul: json['judul'] as String?,
  isi: json['isi'] as String?,
  kategori: json['kategori'] as String?,
  createdBy: json['createdBy'] as String?,
  relevanceScore: (json['relevanceScore'] as num?)?.toInt(),
  searchType: json['searchType'] as String?,
);

Map<String, dynamic> _$BeritaItemToJson(BeritaItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'content': instance.content,
      'excerpt': instance.excerpt,
      'category': instance.category,
      'image': instance.image,
      'author': instance.author,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'judul': instance.judul,
      'isi': instance.isi,
      'kategori': instance.kategori,
      'createdBy': instance.createdBy,
      'relevanceScore': instance.relevanceScore,
      'searchType': instance.searchType,
    };

Events _$EventsFromJson(Map<String, dynamic> json) => Events(
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => EventsItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num?)?.toInt(),
  showing: (json['showing'] as num?)?.toInt(),
);

Map<String, dynamic> _$EventsToJson(Events instance) => <String, dynamic>{
  'items': instance.items,
  'total': instance.total,
  'showing': instance.showing,
};

EventsItem _$EventsItemFromJson(Map<String, dynamic> json) => EventsItem(
  id: (json['id'] as num?)?.toInt(),
  type: json['type'] as String?,
  title: json['title'] as String?,
  description: json['description'],
  location: json['location'] as String?,
  participants: json['participants'] as String?,
  eventDate: json['eventDate'] == null
      ? null
      : DateTime.parse(json['eventDate'] as String),
  eventTime: json['eventTime'] as String?,
  image: json['image'] as String?,
  author: json['author'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  namaKegiatan: json['namaKegiatan'] as String?,
  isi: json['isi'],
  tempat: json['tempat'] as String?,
  peserta: json['peserta'] as String?,
  relevanceScore: (json['relevanceScore'] as num?)?.toInt(),
  searchType: json['searchType'] as String?,
);

Map<String, dynamic> _$EventsItemToJson(EventsItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'location': instance.location,
      'participants': instance.participants,
      'eventDate': instance.eventDate?.toIso8601String(),
      'eventTime': instance.eventTime,
      'image': instance.image,
      'author': instance.author,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'namaKegiatan': instance.namaKegiatan,
      'isi': instance.isi,
      'tempat': instance.tempat,
      'peserta': instance.peserta,
      'relevanceScore': instance.relevanceScore,
      'searchType': instance.searchType,
    };

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => ProductsItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num?)?.toInt(),
  showing: (json['showing'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
  'items': instance.items,
  'total': instance.total,
  'showing': instance.showing,
};

ProductsItem _$ProductsItemFromJson(Map<String, dynamic> json) => ProductsItem(
  id: (json['id'] as num?)?.toInt(),
  type: json['type'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  price: json['price'] as String?,
  satuan: json['satuan'] as String?,
  stock: (json['stock'] as num?)?.toInt(),
  status: json['status'] as String?,
  image: json['image'] as String?,
  seller: json['seller'] == null
      ? null
      : Seller.fromJson(json['seller'] as Map<String, dynamic>),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  namaProducts: json['namaProducts'] as String?,
  deskripsi: json['deskripsi'] as String?,
  relevanceScore: (json['relevanceScore'] as num?)?.toInt(),
  searchType: json['searchType'] as String?,
);

Map<String, dynamic> _$ProductsItemToJson(ProductsItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'satuan': instance.satuan,
      'stock': instance.stock,
      'status': instance.status,
      'image': instance.image,
      'seller': instance.seller,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'namaProducts': instance.namaProducts,
      'deskripsi': instance.deskripsi,
      'relevanceScore': instance.relevanceScore,
      'searchType': instance.searchType,
    };

Tokos _$TokosFromJson(Map<String, dynamic> json) => Tokos(
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => TokosItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num?)?.toInt(),
  showing: (json['showing'] as num?)?.toInt(),
);

Map<String, dynamic> _$TokosToJson(Tokos instance) => <String, dynamic>{
  'items': instance.items,
  'total': instance.total,
  'showing': instance.showing,
};

TokosItem _$TokosItemFromJson(Map<String, dynamic> json) => TokosItem(
  id: (json['id'] as num?)?.toInt(),
  type: json['type'] as String?,
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  role: json['role'] as String?,
  isVerified: json['isVerified'] as bool?,
  avatar: json['avatar'] as String?,
  productCount: (json['productCount'] as num?)?.toInt(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  nama: json['nama'] as String?,
  peran: json['peran'] as String?,
  relevanceScore: (json['relevanceScore'] as num?)?.toInt(),
  searchType: json['searchType'] as String?,
  alamat: json['alamat'] as String?,
);

Map<String, dynamic> _$TokosItemToJson(TokosItem instance) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'role': instance.role,
  'isVerified': instance.isVerified,
  'avatar': instance.avatar,
  'productCount': instance.productCount,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'nama': instance.nama,
  'peran': instance.peran,
  'relevanceScore': instance.relevanceScore,
  'searchType': instance.searchType,
  'alamat': instance.alamat,
};

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
  currentPage: (json['currentPage'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
  totalResults: (json['totalResults'] as num?)?.toInt(),
  totalPages: (json['totalPages'] as num?)?.toInt(),
  from: (json['from'] as num?)?.toInt(),
  to: (json['to'] as num?)?.toInt(),
);

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'limit': instance.limit,
      'totalResults': instance.totalResults,
      'totalPages': instance.totalPages,
      'from': instance.from,
      'to': instance.to,
    };
