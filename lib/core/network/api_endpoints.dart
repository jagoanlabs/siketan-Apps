class ApiEndpoints {

  // env dev

  static const String base = 'http://10.0.0.1:3003/';

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


}