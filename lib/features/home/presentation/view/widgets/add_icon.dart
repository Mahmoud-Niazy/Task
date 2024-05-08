import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:task3/features/home/presentation/manager/home_cubit/home_states.dart';

import '../../../../../core/utils/app_constance.dart';
import '../../../data/models/branch_model.dart';

class AddIcon extends StatelessWidget {
  const AddIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return GestureDetector(
          onTap: () {
            BranchModel newBranch = BranchModel(
              arabicDescription: '',
              arabicName: '',
              customerNo: '',
              address: '',
              branch: '',
              englishDescription: '',
              englishName: '',
              note: '',
            );
            cubit.addNewBranch(branch: newBranch);
          },
          child: Container(
            alignment: Alignment.center,
            height: 25,
            width: 25,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: const Icon(
              Icons.add,
              color: AppConstance.primaryColor,
            ),
          ),
        );
      },
    );
  }
}