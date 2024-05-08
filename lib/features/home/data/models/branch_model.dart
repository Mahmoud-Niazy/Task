class BranchModel {
  int? id;

  String? branch;
  String? customerNo;
  String? arabicName;
  String? arabicDescription;

  String? englishName;
  String? englishDescription;

  String? note;
  String? address;

  BranchModel({
    required this.arabicDescription,
    required this.arabicName,
    this.id,
    required this.customerNo,
    required this.address,
    required this.branch,
    required this.englishDescription,
    required this.englishName,
    required this.note,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
      id: json['id'],
      arabicDescription: json['arabicDescription'],
      arabicName: json['arabicName'],
      customerNo: json['customerNo'],
      address: json['address'],
      branch: json['branch'],
      englishDescription: json['englishDescription'],
      englishName: json['englishName'],
      note: json['note'],
    );
  }
}
