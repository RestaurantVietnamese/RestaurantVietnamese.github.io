import 'package:equatable/equatable.dart';
import '../model/recruitment_apply_model.dart';

class RecruitmentApplyState extends Equatable {
  final RecruitmentApplyModel model;
  final bool isSubmitting;
  final String? errorMessage;
  final bool isSuccess;
  final bool? activeButton;

  const RecruitmentApplyState({
    required this.model,
    this.isSubmitting = false,
    this.errorMessage,
    this.isSuccess = false,
    this.activeButton,
  });

  factory RecruitmentApplyState.initial() {
    return RecruitmentApplyState(
      model: RecruitmentApplyModel(), // tất cả null
      isSubmitting: false,
      errorMessage: null,
      isSuccess: false,
      activeButton: true,
    );
  }

  RecruitmentApplyState copyWith({
    RecruitmentApplyModel? model,
    bool? isSubmitting,
    String? errorMessage,
    bool? isSuccess,
    bool? activeButton,
  }) {
    return RecruitmentApplyState(
      model: model ?? this.model,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
      activeButton: activeButton ?? this.activeButton,
    );
  }

  @override
  List<Object?> get props =>
      [model, isSubmitting, errorMessage, isSuccess, activeButton];
}
