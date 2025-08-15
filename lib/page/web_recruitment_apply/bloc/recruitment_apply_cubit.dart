import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_with_frog_api/server/restaurant_service.dart';
import 'recruitment_apply_state.dart';

import '../model/recruitment_apply_model.dart';

class RecruitmentApplyCubit extends Cubit<RecruitmentApplyState> {
  RecruitmentApplyCubit() : super(RecruitmentApplyState.initial()) {
    _initListeners();
  }

  void _initListeners() {
    fullNameController.addListener(_onFieldsChanged);
    phoneNumberController.addListener(_onFieldsChanged);
    positionController.addListener(_onFieldsChanged);
    noteController.addListener(_onFieldsChanged);
  }

  void _onFieldsChanged() {
    final isAllFilled = fullNameController.text.trim().isEmpty ||
            phoneNumberController.text.trim().isEmpty ||
            positionController.text.trim().isEmpty
        //   
        ;

    emit(state.copyWith(activeButton: isAllFilled));
  }

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  Future<void> submitApplication(String captchaTokenValue) async {
    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    try {
      if (captchaTokenValue.isEmpty) {
        emit(state.copyWith(
          isSubmitting: false,
          errorMessage: 'Không lấy được captcha token',
          isSuccess: false,
        ));
        return;
      }

      final model = RecruitmentApplyModel(
        fullName: fullNameController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        position: positionController.text.trim(),
        note: noteController.text.trim(),
        captcha: captchaTokenValue,
      );

      await RestaurantService.submitRecruitmentService(model);

      emit(state.copyWith(
        model: model,
        isSubmitting: false,
        isSuccess: true,
      ));
    } catch (error) {
      emit(state.copyWith(
        isSubmitting: false,
        errorMessage: error.toString(),
        isSuccess: false,
      ));
    }
  }

  @override
  Future<void> close() {
    fullNameController.dispose();
    phoneNumberController.dispose();
    positionController.dispose();
    noteController.dispose();
    return super.close();
  }
}
