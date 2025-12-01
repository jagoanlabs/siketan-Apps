class ApiEndpoints {
  // env dev

  // static const String base = 'http://10.0.0.1:3003/';
  // static const String base = 'https://backend_siketan.jagoansatudata.com/';

  // env prod
  // static const String base = 'https://backend_siketan.jagoansatudata.com/';

  // Auth
  static const String login = '/auth/login';
  static const String register = '/auth/register-penyuluh';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh-token';
  static const String verifyToken = '/auth/verify-token';

  // register
  static const String kecamatan = "/wilayah/kecamatan";
  static const String kelompok = "/kelompok-all";
  static const String desa = "/wilayah/desa";

  //home
  static const String productHome = "/product-petani-no-auth";
  static const String beritaHome = "/info-tani";
  static const String kegiatanHome = "/event-tani";

  //data
  static const String dataStatistik = "/landing-statistik";
  static const String chartStatistik =
      "/tanaman-petani/statistik?"; //tanaman-petani/statistik?month=6&year=2023&lineType=komoditas&pieType=kategori
  static const String komoditasStatistik =
      "/tanaman-petani"; //tanaman-petani?page=1&limit=10&sortOrder=ASC

  // informasi
  static const String beritaInformasi = "/info-tani";
  static const String kegiatanInformasi = "/event-tani";

  // detail product
  static const String detailProduct = "/product-petani";

  // detail toko
  static const String detailToko = "/list-product";

  //cek NIK
  static const String cekNik = "/cek-nik";

  //search
  static const String search = "/search";
}
