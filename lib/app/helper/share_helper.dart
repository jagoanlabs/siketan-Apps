import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';


void shareContent(String title, String url) async {
  // Share ke semua platform
  await SharePlus.instance.share(ShareParams(
    text:'$title\n\nBaca selengkapnya di: $url',
    subject: title, // Opsional: untuk judul di share sheet
  ));
}

void shareToWhatsApp(BuildContext context, String title, String url) async {
  // Buka WhatsApp dengan pesan otomatis
  final String message = Uri.encodeComponent('$title\n\nBaca selengkapnya di: $url');
  final String whatsappUrl = 'https://wa.me/?text=$message';

  if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
    await launchUrl(Uri.parse(whatsappUrl));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('WhatsApp tidak terinstal')),
    );
  }
}

void shareToInstagram(BuildContext context, String title, String url) async {
  // Instagram tidak mendukung deep link share langsung
  // Alternatif: salin teks
  final String message = '$title\n\nBaca selengkapnya di: $url';
  await Clipboard.setData(ClipboardData(text: message));

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Teks telah disalin. Tempel ke Instagram Story/DM')),
  );
}