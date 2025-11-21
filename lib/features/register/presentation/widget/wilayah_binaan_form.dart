import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
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
                          initialValue: state.selectedKecamatanId,
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
                        /// DROPDOWN DESA (SINGLE SELECT)
                        /// ===========================
                        Text(
                          'Desa',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColors.gray900,
                          ),
                        ),
                        DropdownButtonFormField<int>(
                          value: state.selectedDesaIds.isNotEmpty
                              ? state.selectedDesaIds.first
                              : null,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12.h,
                              horizontal: 14.w,
                            ),
                            hintText: "Desa",
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
                          items: (state.desaList?.data ?? [])
                              .map(
                                (desa) => DropdownMenuItem(
                                  value: desa.id,
                                  child: Text(desa.nama ?? ''),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              context.read<RegisterWilayahBinaanBloc>().add(
                                SelectDesaEvent(value),
                              );
                            }
                          },
                        ),

                        /// ===========================
                        /// MULTI SELECT KELOMPOK
                        /// ===========================
                        Text(
                          'Kelompok Binaan',
                          style: TextStyle(fontSize: 13.sp, color: AppColors.gray900),
                        ),
                        MultiSelectDialogField(
                          title: const Text("Pilih Kelompok"),
                          items:
                              (state.kelompokList?.dataKelompok?.values ?? [])
                                  .map(
                                    (kel) => MultiSelectItem(
                                      kel.id,
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
