import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siketan/shared/style/color.dart';

class CommodityTableSource extends AsyncDataTableSource {
  int totalRows = 100; // nanti diganti totalRows dari API backend

  @override
  Future<AsyncRowsResponse> getRows(int startIndex, int rowsPerPage) async {
    // Simulasi delay API
    await Future.delayed(const Duration(milliseconds: 500));

    // --- PANGGIL API DI SINI ---
    // contoh:
    // final response = await ApiService.getCommodity(
    //      page: (startIndex ~/ rowsPerPage) + 1,
    //      limit: rowsPerPage,
    // );
    // totalRows = response.total;
    // final fetched = response.data;

    // Dummy data:
    final fetched = List.generate(rowsPerPage, (i) {
      final no = startIndex + i + 1;
      return {
        'no': no,
        'komoditas': 'Komoditas $no',
        'produksi': '${no * 10} ton',
        'luas': '${no * 2} ha',
        'nilai': 'Rp ${no * 100} Jt',
      };
    });

    return AsyncRowsResponse(
      totalRows,
      fetched.map((data) {
        return DataRow(
          cells: [
            DataCell(Text(data['no'].toString())),
            DataCell(Text(data['komoditas'].toString())),
            DataCell(Text(data['produksi'].toString())),
            DataCell(Text(data['luas'].toString())),
            DataCell(Text(data['nilai'].toString())),
          ],
        );
      }).toList(),
    );
  }

  @override
  int get rowCount => totalRows;

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
  late CommodityTableSource _source;
  int _rowsPerPage = 10;

  @override
  void initState() {
    super.initState();
    _source = CommodityTableSource();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Data Produk Komoditas Tertinggi',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.gray900,
            ),
          ),
          SizedBox(height: 16.h),

          // === TABLE ===
          SizedBox(
            height: 500.h,
            child: AsyncPaginatedDataTable2(
              minWidth: 600.w,
              wrapInCard: false,
              columnSpacing: 16,
              horizontalMargin: 12,
              showFirstLastButtons: true,

              columns: const [
                DataColumn(label: Text('No')),
                DataColumn(label: Text('Komoditas')),
                DataColumn(label: Text('Produksi')),
                DataColumn(label: Text('Luas (ha)')),
                DataColumn(label: Text('Nilai')),
              ],

              source: _source,
              rowsPerPage: _rowsPerPage,

              onRowsPerPageChanged: (value) {
                setState(() => _rowsPerPage = value ?? 10);
              },
            ),
          )
        ],
      ),
    );
  }
}
