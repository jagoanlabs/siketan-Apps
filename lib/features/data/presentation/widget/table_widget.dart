import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siketan/features/data/presentation/bloc/komoditas_table_bloc.dart';
import 'package:siketan/shared/style/color.dart';

class KomoditasDataTableSource extends AsyncDataTableSource {
  final KomoditasTableBloc bloc;
  final BuildContext context;

  KomoditasDataTableSource(this.context, this.bloc);

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
            DataCell(Text((start + index + 1).toString())),
            DataCell(Text(data.komoditas ?? "-")),
            DataCell(Text("${data.prakiraanProduksiPanen ?? 0} Ton")),
            DataCell(Text("${data.prakiraanLuasPanen ?? 0} Ha")),
            DataCell(Text(data.dataPetani?.nama ?? "-")),
            DataCell(Text(data.dataPetani?.kecamatan ?? "-")),
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

    final bloc = context.read<KomoditasTableBloc>();
    _source = KomoditasDataTableSource(context, bloc);
  }

  @override
  Widget build(BuildContext context) {
    return AsyncPaginatedDataTable2(
      wrapInCard: false,
      showFirstLastButtons: true,

      columns: const [
        DataColumn(label: Text("No")),
        DataColumn(label: Text("Komoditas")),
        DataColumn(label: Text("Produksi")),
        DataColumn(label: Text("Luas Panen")),
        DataColumn(label: Text("Petani")),
        DataColumn(label: Text("Kecamatan")),
      ],

      source: _source,
      rowsPerPage: _rowsPerPage,

      onRowsPerPageChanged: (value) {
        setState(() => _rowsPerPage = value ?? 10);
      },
    );
  }
}
