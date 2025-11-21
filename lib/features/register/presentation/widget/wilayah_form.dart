import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:siketan/core/utils/logger/logger.dart';
import 'package:siketan/features/register/presentation/bloc/register_wilayah_bloc.dart';
import 'package:siketan/shared/style/color.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:siketan/shared/widget/text_field_widget.dart';

class WilayahForm extends StatefulWidget {
  final Function(Map<String, dynamic>)? onCollectData;
  const WilayahForm({super.key, this.onCollectData});

  @override
  State<WilayahForm> createState() => WilayahFormState();
}

class WilayahFormState extends State<WilayahForm> {
  bool _isExpanded = false;

  int? selectedKecamatanId;
  int? selectedDesaId;

  void collectFormData() {
    if (widget.onCollectData != null) {
      widget.onCollectData!({
        'kecamatanId': selectedKecamatanId,
        'desaId': selectedDesaId,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<RegisterWilayahBloc>().add(GetAllKecamatanEvent());
  }

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
              spacing: 13.w,
              children: [
                Iconify(
                  MaterialSymbols.location_on_outline,
                  color: AppColors.green4,
                ),
                Text(
                  "Wilayah Tempat Tinggal",
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
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8.h,
              children: [
                Text(
                  'Kecamatan',
                  style: TextStyle(fontSize: 13.sp, color: AppColors.gray900),
                ),
                BlocBuilder<RegisterWilayahBloc, RegisterWilayahState>(
                  buildWhen: (prev, curr) =>
                      prev.loadingKecamatan != curr.loadingKecamatan ||
                      prev.kecamatanList != curr.kecamatanList,
                  builder: (context, state) {
                    if (state.loadingKecamatan) {
                      return CircularProgressIndicator();
                    }

                    return DropdownButtonFormField<int>(
                      value: selectedKecamatanId,
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
                          borderSide: BorderSide(width: 1.w, color: Colors.red),
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
                          borderSide: BorderSide(width: 1.w, color: Colors.red),
                        ),
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'Wajib dipilih';
                        }
                        return null;
                      },
                      items: state.kecamatanList?.data?.map((e) {
                        return DropdownMenuItem(
                          value: e.id,
                          child: Text(e.nama!),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedKecamatanId = value;
                          selectedDesaId = null;
                        });

                        context.read<RegisterWilayahBloc>().add(
                          GetDesaByKecamatanEvent(value!),
                        );
                      },
                    );
                  },
                ),

                /// ============================
                /// DROPDOWN DESA
                /// ============================
                Text(
                  'Desa',
                  style: TextStyle(fontSize: 13.sp, color: AppColors.gray900),
                ),
                BlocBuilder<RegisterWilayahBloc, RegisterWilayahState>(
                  buildWhen: (prev, curr) =>
                      prev.loadingDesa != curr.loadingDesa ||
                      prev.desaList != curr.desaList,
                  builder: (context, state) {
                    if (state.loadingDesa) {
                      return const CircularProgressIndicator();
                    }

                    if (state.desaList != null) {
                      return DropdownButtonFormField<int>(
                        value: selectedDesaId,
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
                        validator: (value) {
                          if (value == null) {
                            return 'Wajib dipilih';
                          }
                          return null;
                        },
                        items: state.desaList?.data?.map((desa) {
                          return DropdownMenuItem(
                            value: desa.id,
                            child: Text(desa.nama ?? ''),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() => selectedDesaId = value);
                        },
                      );
                    }

                    return DropdownButtonFormField<int>(
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
                          borderSide: BorderSide(width: 1.w, color: Colors.red),
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
                          borderSide: BorderSide(width: 1.w, color: Colors.red),
                        ),
                      ),
                      validator: (value) {
                        if (selectedKecamatanId != null && value == null) {
                          return 'Wajib dipilih';
                        }
                        return null;
                      },
                      items: const [],
                      onChanged: null, // disabled until kecamatan dipilih
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
