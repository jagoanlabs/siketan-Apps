// // Contoh penggunaan API dengan dan tanpa autentikasi

// // 1. Untuk API yang TIDAK PERLU LOGIN (Public API)
// import 'package:siketan/app/dependency_injector/di.dart';

// // Dapatkan instance dari PublicService
// final publicService = getIt<PublicService>();

// // Panggil API publik
// try {
//   final response = await publicService.getPublicData();
//   print('Data publik: ${response.data}');
// } on Exception catch (e) {
//   print('Error: $e');
// }

// // 2. Untuk API yang PERLU LOGIN (Authenticated API)
// // Dapatkan instance dari AuthService atau service lain yang memerlukan autentikasi
// final authService = getIt<AuthService>();

// // Pastikan pengguna sudah login sebelum memanggil API yang memerlukan autentikasi
// try {
//   // Login terlebih dahulu
//   final loginResponse = await authService.login('email@example.com', 'password');
  
//   if (loginResponse.statusCode == 200) {
//     // Simpan token setelah login berhasil
//     await getIt<NetworkService>().setToken(loginResponse.data['token']);
    
//     // Sekarang bisa memanggil API yang memerlukan autentikasi
//     // Misalnya jika kita punya service lain:
//     // final userService = getIt<UserService>();
//     // final profile = await userService.getProfile();
//   }
// } on Exception catch (e) {
//   print('Login error: $e');
// }

// // 3. Atau bisa juga langsung menggunakan AuthBaseService untuk API kustom
// final authBaseService = getIt<AuthBaseService>();

// try {
//   final response = await authBaseService.get('/user/profile');
//   print('Profile: ${response.data}');
// } on Exception catch (e) {
//   print('Error fetching profile: $e');
// }

// // 4. Atau menggunakan PublicBaseService untuk API publik kustom
// final publicBaseService = getIt<PublicBaseService>();

// try {
//   final response = await publicBaseService.get('/info/app');
//   print('App info: ${response.data}');
// } on Exception catch (e) {
//   print('Error fetching app info: $e');
// }

// // Catatan penting:
// // - PublicApiClient tidak akan menambahkan header Authorization ke request
// // - AuthApiClient akan otomatis menambahkan header Authorization dengan token terbaru
// // - Jika token kadaluarsa, interceptor akan menangani refresh token otomatis
// // - Jika refresh token gagal, interceptor akan mengarahkan ke halaman login