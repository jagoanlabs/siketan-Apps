import 'dart:ui';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:siketan/app/helper/format_whatsapp_helper.dart';
import 'package:siketan/core/utils/error_handler.dart';
import 'package:siketan/features/data/presentation/bloc/komoditas_table_bloc.dart';
import 'package:siketan/shared/style/shadow.dart';
import 'package:siketan/shared/widget/error_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:colorful_iconify_flutter/icons/logos.dart';

class KomoditasDataTableSource extends AsyncDataTableSource {
  final KomoditasTableBloc bloc;

  KomoditasDataTableSource(this.bloc);

  @override
  Future<AsyncRowsResponse> getRows(int start, int limit) async {
    final page = (start ~/ limit) + 1;

    bloc.add(FetchKomoditasTable(page, limit, "ASC"));

    final state = await bloc.stream.firstWhere((s) => !s.loading);

    final rows = state.rows;

    return AsyncRowsResponse(
      state.total,
      rows.asMap().entries.map((entry) {
        final index = entry.key;
        final data = entry.value;

        return DataRow(
          cells: [
            DataCell(
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text((start + index + 1).toString()),
                ),
              ),
            ), //no
            DataCell(Text(data.kategori ?? "-")), //kategori
            DataCell(Text(data.komoditas ?? "-")), //komoditas
            DataCell(Text(data.periodeBulanTanam ?? "-")), //bulan tanam
            DataCell(
              Text("${data.prakiraanBulanPanen ?? 0} Ton"),
            ), //prakiraan bulan panen
            DataCell(
              Text("${data.prakiraanLuasPanen ?? 0} Ha"),
            ), //prakiraan luas panen
            DataCell(
              Text("${data.prakiraanProduksiPanen ?? 0} Ton"),
            ), //prakiraan produksi panen
            DataCell(Text(data.dataPetani?.kelompok?.namaKelompok ?? "-")),
            DataCell(Text(data.dataPetani?.kecamatan ?? "-")),
            DataCell(
              onTap: () {
                final noWa = data.dataPetani?.noTelp ?? "-";
                if (noWa != "-" && noWa.isNotEmpty) {
                  launchUrl(
                    Uri.parse("https://wa.me/${formatWhatsAppNumber(noWa)}"),
                  );
                }
              },
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min, // ⭐ ADD THIS
                  children: [
                    Iconify(
                      Logos.whatsapp_icon,
                      size: 24, // kecilkan biar aman
                    ),
                    SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        data.dataPetani?.noTelp ?? "-",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  @override
  int get rowCount => bloc.state.total;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}

class TableWidget extends StatefulWidget {
  const TableWidget({super.key});

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  late KomoditasDataTableSource _source;
  int _rowsPerPage = 10;

  @override
  void initState() {
    super.initState();
    _source = KomoditasDataTableSource(context.read<KomoditasTableBloc>());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 8.h,
      ), // Add padding around the table
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.zero,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              // 👈 nonaktifkan drag untuk mouse/pointer di tabel
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: SizedBox(
            height: 600, // wajib fixed
            child: AsyncPaginatedDataTable2(
              errorBuilder: (error) {
                return ErrorMessageWidget(
                  message: handleAppError(error),
                  size: ErrorSize.M,
                );
              },
              loading: Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: shadowSm,
                    ),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),

              empty: Center(child: Text("Data Tidak Ditemukan")),
              isVerticalScrollBarVisible: false,
              wrapInCard: false,
              minWidth: 1200,
              // minWidth: 1200, // sangat penting untuk table banyak kolom
              horizontalMargin: 12,
              columnSpacing: 16,
              showFirstLastButtons: true,
              availableRowsPerPage: [10], // Fixed to 10 rows only
              // physics: const NeverScrollableScrollPhysics(), // Disable table's scroll to prevent pull-to-refresh conflict
              columns: const [
                DataColumn2(
                  size: ColumnSize.S, // Smaller width for No column
                  label: Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text("No"),
                  ),
                ),

                DataColumn(label: Text("Kategori")),
                DataColumn(label: Text("Komoditas")),
                DataColumn(label: Text("Bulan Tanam")),
                DataColumn(label: Text("Prakiraan Bulan Panen")),
                DataColumn(label: Text("Prakiraan Luas Panen")),
                DataColumn(label: Text("Prakiraan Produksi Panen")),
                DataColumn(label: Text("Kelompok Tani")),
                DataColumn(label: Text("Kecamatan")),
                DataColumn2(
                  size: ColumnSize.L, // More reasonable width for No WA column
                  label: Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Text("No WA"),
                  ),
                ),
              ],

              source: _source,
              rowsPerPage: _rowsPerPage,
              onRowsPerPageChanged: null, // Disable changing rows per page
            ),
          ),
        ),
      ),
    );
  }
}
