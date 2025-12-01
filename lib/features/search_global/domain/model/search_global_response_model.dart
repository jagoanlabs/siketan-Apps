import 'package:json_annotation/json_annotation.dart';

part 'search_global_response_model.g.dart';

@JsonSerializable()
class SearchGlobalResponseModel {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "query")
  String? query;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "sortBy")
  String? sortBy;
  @JsonKey(name: "data")
  Data? data;
  @JsonKey(name: "pagination")
  Pagination? pagination;
  @JsonKey(name: "allResults")
  AllResults? allResults;

  SearchGlobalResponseModel({
    this.message,
    this.query,
    this.type,
    this.sortBy,
    this.data,
    this.pagination,
    this.allResults,
  });

  SearchGlobalResponseModel copyWith({
    String? message,
    String? query,
    String? type,
    String? sortBy,
    Data? data,
    Pagination? pagination,
    AllResults? allResults,
  }) => SearchGlobalResponseModel(
    message: message ?? this.message,
    query: query ?? this.query,
    type: type ?? this.type,
    sortBy: sortBy ?? this.sortBy,
    data: data ?? this.data,
    pagination: pagination ?? this.pagination,
    allResults: allResults ?? this.allResults,
  );

  factory SearchGlobalResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SearchGlobalResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchGlobalResponseModelToJson(this);
}

@JsonSerializable()
class AllResults {
  @JsonKey(name: "items")
  List<AllResultsItem>? items;
  @JsonKey(name: "total")
  int? total;
  @JsonKey(name: "showing")
  int? showing;

  AllResults({this.items, this.total, this.showing});

  AllResults copyWith({
    List<AllResultsItem>? items,
    int? total,
    int? showing,
  }) => AllResults(
    items: items ?? this.items,
    total: total ?? this.total,
    showing: showing ?? this.showing,
  );

  factory AllResults.fromJson(Map<String, dynamic> json) =>
      _$AllResultsFromJson(json);

  Map<String, dynamic> toJson() => _$AllResultsToJson(this);
}

@JsonSerializable()
class AllResultsItem {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "price")
  String? price;
  @JsonKey(name: "satuan")
  String? satuan;
  @JsonKey(name: "stock")
  int? stock;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "seller")
  Seller? seller;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "namaProducts")
  String? namaProducts;
  @JsonKey(name: "deskripsi")
  String? deskripsi;
  @JsonKey(name: "relevanceScore")
  int? relevanceScore;
  @JsonKey(name: "searchType")
  String? searchType;
  @JsonKey(name: "location")
  String? location;
  @JsonKey(name: "participants")
  String? participants;
  @JsonKey(name: "eventDate")
  DateTime? eventDate;
  @JsonKey(name: "eventTime")
  String? eventTime;
  @JsonKey(name: "author")
  String? author;
  @JsonKey(name: "namaKegiatan")
  String? namaKegiatan;
  @JsonKey(name: "isi")
  String? isi;
  @JsonKey(name: "tempat")
  String? tempat;
  @JsonKey(name: "peserta")
  String? peserta;
  @JsonKey(name: "content")
  String? content;
  @JsonKey(name: "excerpt")
  String? excerpt;
  @JsonKey(name: "category")
  String? category;
  @JsonKey(name: "publishedAt")
  DateTime? publishedAt;
  @JsonKey(name: "judul")
  String? judul;
  @JsonKey(name: "kategori")
  String? kategori;
  @JsonKey(name: "createdBy")
  String? createdBy;

  AllResultsItem({
    this.id,
    this.type,
    this.title,
    this.description,
    this.price,
    this.satuan,
    this.stock,
    this.status,
    this.image,
    this.seller,
    this.createdAt,
    this.updatedAt,
    this.namaProducts,
    this.deskripsi,
    this.relevanceScore,
    this.searchType,
    this.location,
    this.participants,
    this.eventDate,
    this.eventTime,
    this.author,
    this.namaKegiatan,
    this.isi,
    this.tempat,
    this.peserta,
    this.content,
    this.excerpt,
    this.category,
    this.publishedAt,
    this.judul,
    this.kategori,
    this.createdBy,
  });

  AllResultsItem copyWith({
    int? id,
    String? type,
    String? title,
    String? description,
    String? price,
    String? satuan,
    int? stock,
    String? status,
    String? image,
    Seller? seller,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? namaProducts,
    String? deskripsi,
    int? relevanceScore,
    String? searchType,
    String? location,
    String? participants,
    DateTime? eventDate,
    String? eventTime,
    String? author,
    String? namaKegiatan,
    String? isi,
    String? tempat,
    String? peserta,
    String? content,
    String? excerpt,
    String? category,
    DateTime? publishedAt,
    String? judul,
    String? kategori,
    String? createdBy,
  }) => AllResultsItem(
    id: id ?? this.id,
    type: type ?? this.type,
    title: title ?? this.title,
    description: description ?? this.description,
    price: price ?? this.price,
    satuan: satuan ?? this.satuan,
    stock: stock ?? this.stock,
    status: status ?? this.status,
    image: image ?? this.image,
    seller: seller ?? this.seller,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    namaProducts: namaProducts ?? this.namaProducts,
    deskripsi: deskripsi ?? this.deskripsi,
    relevanceScore: relevanceScore ?? this.relevanceScore,
    searchType: searchType ?? this.searchType,
    location: location ?? this.location,
    participants: participants ?? this.participants,
    eventDate: eventDate ?? this.eventDate,
    eventTime: eventTime ?? this.eventTime,
    author: author ?? this.author,
    namaKegiatan: namaKegiatan ?? this.namaKegiatan,
    isi: isi ?? this.isi,
    tempat: tempat ?? this.tempat,
    peserta: peserta ?? this.peserta,
    content: content ?? this.content,
    excerpt: excerpt ?? this.excerpt,
    category: category ?? this.category,
    publishedAt: publishedAt ?? this.publishedAt,
    judul: judul ?? this.judul,
    kategori: kategori ?? this.kategori,
    createdBy: createdBy ?? this.createdBy,
  );

  factory AllResultsItem.fromJson(Map<String, dynamic> json) =>
      _$AllResultsItemFromJson(json);

  Map<String, dynamic> toJson() => _$AllResultsItemToJson(this);
}

@JsonSerializable()
class Seller {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "role")
  String? role;

  Seller({this.name, this.role});

  Seller copyWith({String? name, String? role}) =>
      Seller(name: name ?? this.name, role: role ?? this.role);

  factory Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);

  Map<String, dynamic> toJson() => _$SellerToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "products")
  Products? products;
  @JsonKey(name: "tokos")
  Tokos? tokos;
  @JsonKey(name: "berita")
  Berita? berita;
  @JsonKey(name: "events")
  Events? events;

  Data({this.products, this.tokos, this.berita, this.events});

  Data copyWith({
    Products? products,
    Tokos? tokos,
    Berita? berita,
    Events? events,
  }) => Data(
    products: products ?? this.products,
    tokos: tokos ?? this.tokos,
    berita: berita ?? this.berita,
    events: events ?? this.events,
  );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Berita {
  @JsonKey(name: "items")
  List<BeritaItem>? items;
  @JsonKey(name: "total")
  int? total;
  @JsonKey(name: "showing")
  int? showing;

  Berita({this.items, this.total, this.showing});

  Berita copyWith({List<BeritaItem>? items, int? total, int? showing}) =>
      Berita(
        items: items ?? this.items,
        total: total ?? this.total,
        showing: showing ?? this.showing,
      );

  factory Berita.fromJson(Map<String, dynamic> json) => _$BeritaFromJson(json);

  Map<String, dynamic> toJson() => _$BeritaToJson(this);
}

@JsonSerializable()
class BeritaItem {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "content")
  String? content;
  @JsonKey(name: "excerpt")
  String? excerpt;
  @JsonKey(name: "category")
  String? category;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "author")
  String? author;
  @JsonKey(name: "publishedAt")
  DateTime? publishedAt;
  @JsonKey(name: "status")
  dynamic status;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "judul")
  String? judul;
  @JsonKey(name: "isi")
  String? isi;
  @JsonKey(name: "kategori")
  String? kategori;
  @JsonKey(name: "createdBy")
  String? createdBy;
  @JsonKey(name: "relevanceScore")
  int? relevanceScore;
  @JsonKey(name: "searchType")
  String? searchType;

  BeritaItem({
    this.id,
    this.type,
    this.title,
    this.content,
    this.excerpt,
    this.category,
    this.image,
    this.author,
    this.publishedAt,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.judul,
    this.isi,
    this.kategori,
    this.createdBy,
    this.relevanceScore,
    this.searchType,
  });

  BeritaItem copyWith({
    int? id,
    String? type,
    String? title,
    String? content,
    String? excerpt,
    String? category,
    String? image,
    String? author,
    DateTime? publishedAt,
    dynamic status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? judul,
    String? isi,
    String? kategori,
    String? createdBy,
    int? relevanceScore,
    String? searchType,
  }) => BeritaItem(
    id: id ?? this.id,
    type: type ?? this.type,
    title: title ?? this.title,
    content: content ?? this.content,
    excerpt: excerpt ?? this.excerpt,
    category: category ?? this.category,
    image: image ?? this.image,
    author: author ?? this.author,
    publishedAt: publishedAt ?? this.publishedAt,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    judul: judul ?? this.judul,
    isi: isi ?? this.isi,
    kategori: kategori ?? this.kategori,
    createdBy: createdBy ?? this.createdBy,
    relevanceScore: relevanceScore ?? this.relevanceScore,
    searchType: searchType ?? this.searchType,
  );

  factory BeritaItem.fromJson(Map<String, dynamic> json) =>
      _$BeritaItemFromJson(json);

  Map<String, dynamic> toJson() => _$BeritaItemToJson(this);
}

@JsonSerializable()
class Events {
  @JsonKey(name: "items")
  List<EventsItem>? items;
  @JsonKey(name: "total")
  int? total;
  @JsonKey(name: "showing")
  int? showing;

  Events({this.items, this.total, this.showing});

  Events copyWith({List<EventsItem>? items, int? total, int? showing}) =>
      Events(
        items: items ?? this.items,
        total: total ?? this.total,
        showing: showing ?? this.showing,
      );

  factory Events.fromJson(Map<String, dynamic> json) => _$EventsFromJson(json);

  Map<String, dynamic> toJson() => _$EventsToJson(this);
}

@JsonSerializable()
class EventsItem {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  dynamic description;
  @JsonKey(name: "location")
  String? location;
  @JsonKey(name: "participants")
  String? participants;
  @JsonKey(name: "eventDate")
  DateTime? eventDate;
  @JsonKey(name: "eventTime")
  String? eventTime;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "author")
  String? author;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "namaKegiatan")
  String? namaKegiatan;
  @JsonKey(name: "isi")
  dynamic isi;
  @JsonKey(name: "tempat")
  String? tempat;
  @JsonKey(name: "peserta")
  String? peserta;
  @JsonKey(name: "relevanceScore")
  int? relevanceScore;
  @JsonKey(name: "searchType")
  String? searchType;

  EventsItem({
    this.id,
    this.type,
    this.title,
    this.description,
    this.location,
    this.participants,
    this.eventDate,
    this.eventTime,
    this.image,
    this.author,
    this.createdAt,
    this.updatedAt,
    this.namaKegiatan,
    this.isi,
    this.tempat,
    this.peserta,
    this.relevanceScore,
    this.searchType,
  });

  EventsItem copyWith({
    int? id,
    String? type,
    String? title,
    dynamic description,
    String? location,
    String? participants,
    DateTime? eventDate,
    String? eventTime,
    String? image,
    String? author,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? namaKegiatan,
    dynamic isi,
    String? tempat,
    String? peserta,
    int? relevanceScore,
    String? searchType,
  }) => EventsItem(
    id: id ?? this.id,
    type: type ?? this.type,
    title: title ?? this.title,
    description: description ?? this.description,
    location: location ?? this.location,
    participants: participants ?? this.participants,
    eventDate: eventDate ?? this.eventDate,
    eventTime: eventTime ?? this.eventTime,
    image: image ?? this.image,
    author: author ?? this.author,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    namaKegiatan: namaKegiatan ?? this.namaKegiatan,
    isi: isi ?? this.isi,
    tempat: tempat ?? this.tempat,
    peserta: peserta ?? this.peserta,
    relevanceScore: relevanceScore ?? this.relevanceScore,
    searchType: searchType ?? this.searchType,
  );

  factory EventsItem.fromJson(Map<String, dynamic> json) =>
      _$EventsItemFromJson(json);

  Map<String, dynamic> toJson() => _$EventsItemToJson(this);
}

@JsonSerializable()
class Products {
  @JsonKey(name: "items")
  List<ProductsItem>? items;
  @JsonKey(name: "total")
  int? total;
  @JsonKey(name: "showing")
  int? showing;

  Products({this.items, this.total, this.showing});

  Products copyWith({List<ProductsItem>? items, int? total, int? showing}) =>
      Products(
        items: items ?? this.items,
        total: total ?? this.total,
        showing: showing ?? this.showing,
      );

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}

@JsonSerializable()
class ProductsItem {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "price")
  String? price;
  @JsonKey(name: "satuan")
  String? satuan;
  @JsonKey(name: "stock")
  int? stock;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "seller")
  Seller? seller;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "namaProducts")
  String? namaProducts;
  @JsonKey(name: "deskripsi")
  String? deskripsi;
  @JsonKey(name: "relevanceScore")
  int? relevanceScore;
  @JsonKey(name: "searchType")
  String? searchType;

  ProductsItem({
    this.id,
    this.type,
    this.title,
    this.description,
    this.price,
    this.satuan,
    this.stock,
    this.status,
    this.image,
    this.seller,
    this.createdAt,
    this.updatedAt,
    this.namaProducts,
    this.deskripsi,
    this.relevanceScore,
    this.searchType,
  });

  ProductsItem copyWith({
    int? id,
    String? type,
    String? title,
    String? description,
    String? price,
    String? satuan,
    int? stock,
    String? status,
    String? image,
    Seller? seller,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? namaProducts,
    String? deskripsi,
    int? relevanceScore,
    String? searchType,
  }) => ProductsItem(
    id: id ?? this.id,
    type: type ?? this.type,
    title: title ?? this.title,
    description: description ?? this.description,
    price: price ?? this.price,
    satuan: satuan ?? this.satuan,
    stock: stock ?? this.stock,
    status: status ?? this.status,
    image: image ?? this.image,
    seller: seller ?? this.seller,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    namaProducts: namaProducts ?? this.namaProducts,
    deskripsi: deskripsi ?? this.deskripsi,
    relevanceScore: relevanceScore ?? this.relevanceScore,
    searchType: searchType ?? this.searchType,
  );

  factory ProductsItem.fromJson(Map<String, dynamic> json) =>
      _$ProductsItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsItemToJson(this);
}

@JsonSerializable()
class Tokos {
  @JsonKey(name: "items")
  List<TokosItem>? items;
  @JsonKey(name: "total")
  int? total;
  @JsonKey(name: "showing")
  int? showing;

  Tokos({this.items, this.total, this.showing});

  Tokos copyWith({List<TokosItem>? items, int? total, int? showing}) => Tokos(
    items: items ?? this.items,
    total: total ?? this.total,
    showing: showing ?? this.showing,
  );

  factory Tokos.fromJson(Map<String, dynamic> json) => _$TokosFromJson(json);

  Map<String, dynamic> toJson() => _$TokosToJson(this);
}

@JsonSerializable()
class TokosItem {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "isVerified")
  bool? isVerified;
  @JsonKey(name: "avatar")
  String? avatar;
  @JsonKey(name: "productCount")
  int? productCount;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;
  @JsonKey(name: "nama")
  String? nama;
  @JsonKey(name: "peran")
  String? peran;
  @JsonKey(name: "relevanceScore")
  int? relevanceScore;
  @JsonKey(name: "searchType")
  String? searchType;
  @JsonKey(name: "alamat")
  String? alamat;

  TokosItem({
    this.id,
    this.type,
    this.name,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.avatar,
    this.productCount,
    this.createdAt,
    this.updatedAt,
    this.nama,
    this.peran,
    this.relevanceScore,
    this.searchType,
    this.alamat,
  });

  TokosItem copyWith({
    int? id,
    String? type,
    String? name,
    String? email,
    String? phone,
    String? role,
    bool? isVerified,
    String? avatar,
    int? productCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? nama,
    String? peran,
    int? relevanceScore,
    String? searchType,
    String? alamat,
  }) => TokosItem(
    id: id ?? this.id,
    type: type ?? this.type,
    name: name ?? this.name,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    role: role ?? this.role,
    isVerified: isVerified ?? this.isVerified,
    avatar: avatar ?? this.avatar,
    productCount: productCount ?? this.productCount,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    nama: nama ?? this.nama,
    peran: peran ?? this.peran,
    relevanceScore: relevanceScore ?? this.relevanceScore,
    searchType: searchType ?? this.searchType,
    alamat: alamat ?? this.alamat,
  );

  factory TokosItem.fromJson(Map<String, dynamic> json) =>
      _$TokosItemFromJson(json);

  Map<String, dynamic> toJson() => _$TokosItemToJson(this);
}

@JsonSerializable()
class Pagination {
  @JsonKey(name: "currentPage")
  int? currentPage;
  @JsonKey(name: "limit")
  int? limit;
  @JsonKey(name: "totalResults")
  int? totalResults;
  @JsonKey(name: "totalPages")
  int? totalPages;
  @JsonKey(name: "from")
  int? from;
  @JsonKey(name: "to")
  int? to;

  Pagination({
    this.currentPage,
    this.limit,
    this.totalResults,
    this.totalPages,
    this.from,
    this.to,
  });

  Pagination copyWith({
    int? currentPage,
    int? limit,
    int? totalResults,
    int? totalPages,
    int? from,
    int? to,
  }) => Pagination(
    currentPage: currentPage ?? this.currentPage,
    limit: limit ?? this.limit,
    totalResults: totalResults ?? this.totalResults,
    totalPages: totalPages ?? this.totalPages,
    from: from ?? this.from,
    to: to ?? this.to,
  );

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
