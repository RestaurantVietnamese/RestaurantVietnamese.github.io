import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gcaptcha_v3/recaptca_config.dart';
import 'package:restaurant_with_frog_api/page/web_recruitment_apply/bloc/recruitment_apply_cubit.dart';
import 'package:restaurant_with_frog_api/page/web_recruitment_apply/bloc/recruitment_apply_state.dart';
import 'package:restaurant_with_frog_api/page/web_recruitment_apply/widget_page/widget/get_recaptcha_token_web.dart';
import 'package:restaurant_with_frog_api/utils/responsive.dart';
import 'package:restaurant_with_frog_api/utils/widgets/common_button.dart';
import 'package:restaurant_with_frog_api/utils/widgets/input_text.dart';
import 'package:restaurant_with_frog_api/utils/widgets/text_required.dart';

class RecruitmentApplyMobile extends StatelessWidget {
  const RecruitmentApplyMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RecruitmentApplyCubit>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<RecruitmentApplyCubit, RecruitmentApplyState>(
          listener: (context, state) {
            if (state.isSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ứng tuyển thành công!')),
              );
            }
            if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage!)),
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Header
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextNoneRequired(
                            text: 'a',
                            fontSize: 20.sp(context),
                          ),
                        ),
                        // Scroll content
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TextRequired(text: 'Họ và tên'),
                                SizedBox(height: 2.h(context)),
                                InputText(
                                  hintText: 'Họ và tên',
                                  controller: cubit.fullNameController,
                                ),
                                SizedBox(height: 12.h(context)),
                                const TextRequired(text: 'Số điện thoại'),
                                SizedBox(height: 2.h(context)),
                                InputText(
                                  hintText: 'Số điện thoại',
                                  controller: cubit.phoneNumberController,
                                  textInputType: TextInputType.number,
                                ),
                                SizedBox(height: 12.h(context)),
                                const TextRequired(text: 'Vị trí ứng tuyển'),
                                SizedBox(height: 2.h(context)),
                                InputText(
                                  hintText: 'Vị trí ứng tuyển',
                                  controller: cubit.positionController,
                                ),
                                SizedBox(height: 12.h(context)),
                                const TextNoneRequired(text: 'Ghi chú'),
                                SizedBox(height: 2.h(context)),
                                InputText(
                                  hintText: 'Ghi chú',
                                  controller: cubit.noteController,
                                  maxLines: 10,
                                  minLines: 1,
                                  textInputType: TextInputType.multiline,
                                  textInputAction: TextInputAction.newline,
                                ),
                                SizedBox(height: 12.h(context)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 6.h(context)),
                        BottomButton(
                          disable: state.activeButton ?? false,
                          onTap: state.isSubmitting
                              ? () {}
                              : () async {
                                  String? token;

                                  if (kIsWeb) {
                                    token = await getRecaptchaToken();
                                  } else {
                                    await RecaptchaHandler.executeV3(
                                        action: 'submit');
                                    token =
                                        RecaptchaHandler.instance.captchaToken;
                                  }

                                  if (token != null && token.isNotEmpty) {
                                    cubit.submitApplication(token);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Xác thực thất bại!')),
                                    );
                                  }
                                },
                          title: 'Gửi ứng tuyển',
                        ),
                      ],
                    ),
                  ),
                  if (state.isSubmitting)
                    const Center(child: CircularProgressIndicator()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
