import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:task3/features/home/presentation/manager/home_cubit/home_states.dart';

import '../../../../../core/widgets/custom_icon_button.dart';
import '../../../data/models/branch_model.dart';

class SaveIcon extends StatelessWidget {
  const SaveIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return CustomIconButton(
          onPressed: () {
            if (cubit.formKey.currentState!.validate()) {
              cubit.updateBranch(
                id: cubit.allBranches[cubit.currentIndex].id!,
                branch: BranchModel(
                  arabicDescription: cubit.arabicDescription.text,
                  arabicName: cubit.arabicName.text,
                  customerNo: cubit.customerNo.text,
                  address: cubit.addressController.text,
                  branch: cubit.branchController.text,
                  englishDescription: cubit.englishDescription.text,
                  englishName: cubit.englishName.text,
                  note: cubit.noteController.text,
                ),
              );
            }
          },
          icon: Icons.save,
          color: Colors.white,
        );
      },
    );
  }
}