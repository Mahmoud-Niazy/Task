import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:task3/features/home/presentation/manager/home_cubit/home_states.dart';

import '../../../../../core/utils/app_constance.dart';
import '../../../../../core/widgets/custom_icon_button.dart';

class BranchesController extends StatelessWidget{
  const BranchesController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
  builder: (context, state) {
    var cubit = HomeCubit.get(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            onPressed: () {
              cubit.goToStart();
            },
            icon: Icons.keyboard_double_arrow_left,
            color: cubit.checkIsTheFirstBranch() ? Colors.grey : AppConstance.primaryColor,

          ),
          CustomIconButton(
            onPressed: () {
              cubit.goBack();
            },
            icon: Icons.skip_previous,
            color: cubit.checkIsTheFirstBranch() ? Colors.grey : AppConstance.primaryColor,

          ),
          Text(
              '${cubit.currentIndex + 1}/${cubit.allBranches.length}'),
          CustomIconButton(
            onPressed: () {
              cubit.goForward();
            },

            icon: Icons.skip_next,
            color: cubit.checkIsTheLastBranch() ? Colors.grey : AppConstance.primaryColor,
          ),
          CustomIconButton(
            onPressed: () {
              cubit.goToEnd();
            },
            icon: Icons.keyboard_double_arrow_right_outlined,
            color: cubit.checkIsTheLastBranch() ? Colors.grey : AppConstance.primaryColor,
          ),
        ],
      ),
    );
  },
);
  }
}