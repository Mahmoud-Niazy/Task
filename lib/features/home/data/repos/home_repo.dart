import '../models/branch_model.dart';

abstract class HomeRepo{
  Future<List<BranchModel>>getAllBranches();
  Future<void>addNewBranch({
    required BranchModel branch,
});
  Future<void>updateBranch({
    required int id,
    required BranchModel branch,
});
}