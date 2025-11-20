import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:siketan/features/register/presentation/bloc/register_wilayah_binaan_bloc.dart';
import 'package:siketan/shared/style/color.dart';

class WilayahBinaanForm extends StatefulWidget {
  const WilayahBinaanForm({super.key});

  @override
  State<WilayahBinaanForm> createState() => _WilayahBinaanFormState();
}

class _WilayahBinaanFormState extends State<WilayahBinaanForm> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      elevation: 0, // hilangkan shadow jika mau flat
      dividerColor: Colors.transparent, // hilangkan garis antar panel
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (_, isExpanded) {
        setState(() => _isExpanded = !_isExpanded);
      },
      children: [
        ExpansionPanel(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          backgroundColor: AppColors.gray50,
          isExpanded: _isExpanded,
          canTapOnHeader: true,
          headerBuilder: (context, isExpanded) {
            return Row(
              spacing: 16.w,
              children: [
                Iconify(Bx.group, color: AppColors.green4),

                Text(
                  "Wilayah Binaan",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.gray900,
                  ),
                ),
              ],
            );
          },
          body: Padding(
            padding: EdgeInsets.all(12.w),
            child:
                BlocBuilder<
                  RegisterWilayahBinaanBloc,
                  RegisterWilayahBinaanState
                >(
                  builder: (context, state) {
                    return Column(
                      spacing: 12.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// ===========================
                        /// DROPDOWN KECAMATAN
                        /// ===========================
                        BlocBuilder<
                          RegisterWilayahBinaanBloc,
                          RegisterWilayahBinaanState
                        >(
                          builder: (context, state) {
                            if (state.loadingKecamatan) {
                              return const CircularProgressIndicator();
                            }

                            final items = state.kecamatanList?.data ?? [];

                            return DropdownButtonFormField<int>(
                              value: state.selectedKecamatanId,
                              decoration: const InputDecoration(
                                labelText: "Kecamatan",
                                border: OutlineInputBorder(),
                              ),
                              items: items.map((kec) {
                                return DropdownMenuItem(
                                  value: kec.id,
                                  child: Text(kec.nama ?? ''),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  context.read<RegisterWilayahBinaanBloc>().add(
                                    SelectKecamatanEvent(value),
                                  );
                                }
                              },
                            );
                          },
                        ),

                        /// ===========================
                        /// DROPDOWN DESA (MULTI SELECT)
                        /// ===========================
                        IgnorePointer(
                          ignoring: state.selectedKecamatanId == null,
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Desa',
                              border: OutlineInputBorder(),
                            ),
                            child: state.loadingDesa
                                ? Center(child: CircularProgressIndicator())
                                : Wrap(
                                    spacing: 8.w,
                                    children: (state.desaList?.data ?? [])
                                        .map(
                                          (desa) => FilterChip(
                                            label: Text(desa.nama ?? ''),
                                            selected: state.selectedDesaIds
                                                .contains(desa.id),
                                            onSelected: (selected) {
                                              context
                                                  .read<
                                                    RegisterWilayahBinaanBloc
                                                  >()
                                                  .add(
                                                    SelectDesaEvent(desa.id!),
                                                  );
                                            },
                                          ),
                                        )
                                        .toList(),
                                  ),
                          ),
                        ),

                        /// ===========================
                        /// DROPDOWN KELOMPOK (MULTI SELECT)
                        /// ===========================
                        IgnorePointer(
                          ignoring: state.selectedKecamatanId == null,
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Kelompok',
                              border: OutlineInputBorder(),
                            ),
                            child: state.loadingKelompok
                                ? Center(child: CircularProgressIndicator())
                                : Wrap(
                                    spacing: 8.w,
                                    children:
                                        (state
                                                    .kelompokList
                                                    ?.dataKelompok
                                                    ?.entries ??
                                                [])
                                            .map(
                                              (entry) => FilterChip(
                                                label: Text(
                                                  entry.value.namaKelompok ??
                                                      '',
                                                ),
                                                selected: state
                                                    .selectedKelompokIds
                                                    .contains(entry.value.id),
                                                onSelected: (selected) {
                                                  context
                                                      .read<
                                                        RegisterWilayahBinaanBloc
                                                      >()
                                                      .add(
                                                        SelectKelompokEvent(
                                                          entry.value.id!,
                                                        ),
                                                      );
                                                },
                                              ),
                                            )
                                            .toList(),
                                  ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
          ),
        ),
      ],
    );
  }
}
