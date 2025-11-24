import 'package:html/parser.dart' as html_parser;

String htmlToPlainText(String html) {
  final document = html_parser.parse(html);
  return document.body?.text ?? '';
}
