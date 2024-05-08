import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task3/core/utils/app_constance.dart';
import 'package:task3/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:task3/features/home/presentation/manager/home_cubit/home_states.dart';
import 'package:task3/features/home/presentation/view/widgets/add_icon.dart';
import 'package:task3/features/home/presentation/view/widgets/branches_controller.dart';
import 'package:task3/features/home/presentation/view/widgets/data_insertion_sec.dart';
import 'package:task3/features/home/presentation/view/widgets/save_icon.dart';

import '../../../../core/utils/app_styles.dart';

class HomeView extends StatelessWidget {

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        if (cubit.allBranches.isNotEmpty) {
          cubit.fillFormFields();
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppConstance.primaryColor,
            title: Text(
              'Branch/Store/Cashier',
              style: AppStyles.style17.copyWith(
                color: Colors.white,
              ),
            ),
            actions: const [
              AddIcon(),
              SizedBox(
                width: 10,
              ),
              SaveIcon(),
            ],
          ),
          body: cubit.allBranches.isNotEmpty
              ? Stack(
                  children: [
                    state is GetAllBranchesLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : Padding(
                          padding: EdgeInsets.only(
                            bottom: 15.h,
                          ),
                          child: const DatInsertionSec(),
                        ),
                    const BranchesController(),
                  ],
                )
              : Center(
                child: SingleChildScrollView(
                  child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                  Image.asset('assets/images/empty.jpg'),
                  SizedBox(
                    height: 20,
                  ),
                  // const Text(
                  //   'Empty',
                  //   style: AppStyles.style20,
                  // ),
                              ],
                            ),
                ),
              ),
        );
      },
    );
  }
}
