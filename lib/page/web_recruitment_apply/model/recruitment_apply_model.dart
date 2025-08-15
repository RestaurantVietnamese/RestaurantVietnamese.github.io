class RecruitmentApplyModel {
  final String? fullName;
  final String? phoneNumber;
  final String? position;
  final String? note;
  final String? captcha;

  RecruitmentApplyModel({
    this.fullName,
    this.phoneNumber,
    this.position,
    this.note,
    this.captcha,
  });

  factory RecruitmentApplyModel.fromJson(Map<String, dynamic> json) {
    return RecruitmentApplyModel(
      fullName: json['full_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      position: json['position'] as String?,
      note: json['note'] as String?,
      captcha: json['captcha'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'phone_number': phoneNumber,
      'position': position,
      'note': note,
      'captcha': captcha,
    };
  }
}
