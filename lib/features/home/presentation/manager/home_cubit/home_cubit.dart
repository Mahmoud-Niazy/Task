import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task3/features/home/data/models/branch_model.dart';
import 'package:task3/features/home/presentation/manager/home_cubit/home_states.dart';

import '../../../data/repos/home_repo.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  TextEditingController branchController = TextEditingController(
    text: '0',
  );
  TextEditingController customerNo = TextEditingController();
  TextEditingController arabicName = TextEditingController();
  TextEditingController arabicDescription = TextEditingController();
  TextEditingController englishName = TextEditingController();
  TextEditingController englishDescription = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  fillFormFields() {
    if(allBranches.isNotEmpty){
      customerNo.text = allBranches[currentIndex].customerNo ?? '';
      arabicName.text = allBranches[currentIndex].arabicName ?? '';
      arabicDescription.text = allBranches[currentIndex].arabicDescription ?? '';
      englishName.text = allBranches[currentIndex].englishName ?? '';
      englishDescription.text =
          allBranches[currentIndex].englishDescription ?? '';
      noteController.text = allBranches[currentIndex].note ?? '';
      addressController.text = allBranches[currentIndex].address ?? '';
    }
  }

  int currentIndex = 0;
  List<BranchModel> allBranches = [];

  getAllBranches() async {
    allBranches = await homeRepo.getAllBranches();
    emit(GetAllBranchesSuccessfullyState());
    // fillFormFields();
  }

  addNewBranch({required BranchModel branch}) async {
    await homeRepo.addNewBranch(branch: branch);
    await getAllBranches();
    emit(AddNewBranchSuccessfullyState());
    currentIndex = allBranches.length-1;
    // fillFormFields();

  }

  updateBranch({
    required int id,
    required BranchModel branch,
  })async{
    emit(UpdateBranchLoadingState());
    await homeRepo.updateBranch(id: id, branch: branch);
    emit(UpdateBranchSuccessfullyState());
    getAllBranches();
  }


  goForward(){
    if(currentIndex < allBranches.length-1){
      currentIndex++;
      fillFormFields();
      emit(NavigateState());
    }
  }
  goBack(){
    if(currentIndex>=1){
      currentIndex--;
      fillFormFields();
      emit(NavigateState());
    }
  }

  goToEnd(){
    currentIndex = allBranches.length-1;
    fillFormFields();
    emit(NavigateState());
  }
  goToStart(){
    currentIndex = 0;
    fillFormFields();
    emit(NavigateState());
  }

  checkIsTheLastBranch(){
   if( currentIndex== allBranches.length-1){
     return true;
   }
   return false;
  }
  checkIsTheFirstBranch(){
    if(currentIndex ==0){
      return true;
    }
    return false;
  }

}
