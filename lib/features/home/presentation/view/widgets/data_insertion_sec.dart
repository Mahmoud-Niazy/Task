import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task3/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:task3/features/home/presentation/manager/home_cubit/home_states.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class DatInsertionSec extends StatelessWidget {

  const DatInsertionSec({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return OrientationBuilder(
          builder: (context, orientation) {
            if(orientation == Orientation.portrait){
              return Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomTextFormField(
                                title: 'Branch',
                                readOnly: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Branch can\'t be empty';
                                  }
                                  return null;
                                },
                                controller:
                                cubit.branchController,
                              ),
                            ),
                            SizedBox(
                              width: 20.h,
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                title: 'Customer No.',
                                keyboardType: TextInputType.number,

                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Customer Num can\'t be empty';
                                  }
                                  return null;
                                },
                                controller: cubit.customerNo,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          title: 'Arabic Name',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Name can\'t be empty';
                            }
                            return null;
                          },
                          controller: cubit.arabicName,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          title: 'Arabic Description',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Description can\'t be empty';
                            }
                            return null;
                          },
                          controller: cubit.arabicDescription,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          title: 'English Name',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Name can\'t be empty';
                            }
                            return null;
                          },
                          controller: cubit.englishName,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          title: 'English Description',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Description can\'t be empty';
                            }
                            return null;
                          },
                          controller: cubit.englishDescription,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          title: 'Note',
                          maxLines: 60,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Note can\'t be empty';
                            }
                            return null;
                          },
                          height: 100,
                          controller: cubit.noteController,
                          keyboardType: TextInputType.multiline,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          title: 'Address',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Address can\'t be empty';
                            }
                            return null;
                          },
                          controller: cubit.addressController,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              CustomTextFormField(
                                title: 'Branch',
                                readOnly: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Branch can\'t be empty';
                                  }
                                  return null;
                                },
                                controller:
                                cubit.branchController,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              CustomTextFormField(
                                title: 'Arabic Name',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Name can\'t be empty';
                                  }
                                  return null;
                                },
                                controller: cubit.arabicName,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              CustomTextFormField(
                                title: 'English Name',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Name can\'t be empty';
                                  }
                                  return null;
                                },
                                controller: cubit.englishName,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              CustomTextFormField(
                                title: 'Note',
                                maxLines: 60,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Note can\'t be empty';
                                  }
                                  return null;
                                },
                                height: 100,
                                controller: cubit.noteController,
                                keyboardType: TextInputType.multiline,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20.h,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              CustomTextFormField(
                                title: 'Customer No.',
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Customer Num can\'t be empty';
                                  }
                                  return null;
                                },
                                controller: cubit.customerNo,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              CustomTextFormField(
                                title: 'Arabic Description',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Description can\'t be empty';
                                  }
                                  return null;
                                },
                                controller: cubit.arabicDescription,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              CustomTextFormField(
                                title: 'English Description',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Description can\'t be empty';
                                  }
                                  return null;
                                },
                                controller: cubit.englishDescription,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              CustomTextFormField(
                                title: 'Address',
                                maxLines: 60,
                                height: 100,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Address can\'t be empty';
                                  }
                                  return null;
                                },
                                controller: cubit.addressController,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );

          },
        );
      },
    );
  }
}