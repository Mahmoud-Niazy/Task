import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task3/features/home/data/repos/home_repo_imp.dart';
import 'package:task3/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:task3/features/home/presentation/view/home_view.dart';

import 'core/sql_db/sql_db.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await SqfliteDb().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> HomeCubit(HomeRepoImp())..getAllBranches(),
      child: const ScreenUtilInit(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeView(),
        ),
      ),
    );
  }
}
