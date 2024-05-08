import 'package:task3/core/sql_db/sql_db.dart';
import 'package:task3/features/home/data/models/branch_model.dart';

import 'home_repo.dart';

class HomeRepoImp extends HomeRepo{

  @override
  Future<List<BranchModel>> getAllBranches() async{
    var data = await SqfliteDb().getData();
    List<BranchModel> allBranches =[];
    for (var branch in data) {
      allBranches.add(BranchModel.fromJson(branch));
    }
    return allBranches;
  }


  @override
  Future<void> addNewBranch({
    required BranchModel branch,
}) async{
    await SqfliteDb().insertData(branch: branch);
  }


  @override
  Future<void> updateBranch({
    required int id,
    required BranchModel branch,
  }) async{
    await SqfliteDb().update(branch: branch, id: id);
  }
}