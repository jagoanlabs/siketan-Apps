import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:siketan/features/register/presentation/bloc/register_wilayah_binaan_bloc.dart';
import 'package:siketan/shared/style/color.dart';

class WilayahBinaanForm extends StatefulWidget {
  final Function(Map<String, dynamic>)? onCollectData;
  const WilayahBinaanForm({super.key, this.onCollectData});

  @override
  State<WilayahBinaanForm> createState() => WilayahBinaanFormState();
}

class WilayahBinaanFormState extends State<WilayahBinaanForm> {
  bool _isExpanded = false;

  void collectFormData() {
    if (widget.onCollectData != null) {
      final wilayahBinaanBloc = context.read<RegisterWilayahBinaanBloc>();
      widget.onCollectData!({
        'kecamatanBinaanId': wilayahBinaanBloc.state.selectedKecamatanId,
        'desaBinaanId': wilayahBinaanBloc.state.selectedDesaIds.isNotEmpty
            ? wilayahBinaanBloc.state.selectedDesaIds.first
            : null,
        'kelompokBinaanIds': wilayahBinaanBloc.state.selectedKelompokIds,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RegisterWilayahBinaanBloc>().add(LoadInitialWilayah());
    });
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      elevation: 0,
      dividerColor: Colors.transparent,
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
                        Text(
                          'Kecamatan',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColors.gray900,
                          ),
                        ),
                        DropdownButtonFormField<int>(
                          value: state.selectedKecamatanId,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12.h,
                              horizontal: 14.w,
                            ),
                            hintText: "Kecamatan",
                            hintStyle: Theme.of(context).textTheme.bodySmall!
                                .copyWith(fontSize: 12.sp, color: Colors.grey),
                            filled: true,
                            fillColor: AppColors.gray100,

                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: Colors.red,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: AppColors.green4,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: AppColors.gray400,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: AppColors.blue4,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                width: 1.w,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return 'Wajib dipilih';
                            }
                            return null;
                          },
                          items: (state.kecamatanList?.data ?? [])
                              .map(
                                (kec) => DropdownMenuItem(
                                  value: kec.id,
                                  child: Text(kec.nama ?? ''),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              context.read<RegisterWilayahBinaanBloc>().add(
                                SelectKecamatanEvent(value),
                              );
                            }
                          },
                        ),

                        /// ===========================
                        /// MULTI SELECT DESA
                        /// ===========================
                        Text(
                          'Desa Binaan',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColors.gray900,
                          ),
                        ),
                        MultiSelectDialogField(
                          checkColor: Colors.white,
                          selectedColor: AppColors.green4,

                          title: const Text("Pilih Desa Binaan"),
                          items: (state.desaList?.data ?? [])
                              .map(
                                (desa) =>
                                    MultiSelectItem(desa.id!, desa.nama ?? ""),
                              )
                              .toList(),
                          decoration: BoxDecoration(
                            color: AppColors.gray100,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.5.w,
                            ),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          buttonText: const Text("Pilih Desa Binaan"),
                          initialValue: state.selectedDesaIds,
                          onConfirm: (values) {
                            context.read<RegisterWilayahBinaanBloc>().add(
                              SelectDesaEvent(values.cast<int>().toList()),
                            );
                          },
                        ),

                        /// ===========================
                        /// MULTI SELECT KELOMPOK
                        /// ===========================
                        Text(
                          'Kelompok Binaan',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColors.gray900,
                          ),
                        ),
                        MultiSelectDialogField(
                          selectedColor: AppColors.green4,
                          title: const Text("Pilih Kelompok"),
                          items:
                              (state.kelompokList?.dataKelompok?.values ?? [])
                                  .map(
                                    (kel) => MultiSelectItem(
                                      kel.id!,
                                      kel.namaKelompok ?? "",
                                    ),
                                  )
                                  .toList(),
                          decoration: BoxDecoration(
                            color: AppColors.gray100,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.5.w,
                            ),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          buttonText: const Text("Kelompok Binaan"),
                          initialValue: state.selectedKelompokIds,
                          onConfirm: (values) {
                            context.read<RegisterWilayahBinaanBloc>().add(
                              SelectKelompokEvent(values.cast<int>().toList()),
                            );
                          },
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
