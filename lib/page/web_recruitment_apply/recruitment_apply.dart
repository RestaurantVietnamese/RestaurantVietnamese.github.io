import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_with_frog_api/page/web_recruitment_apply/bloc/recruitment_apply_cubit.dart';
import 'package:restaurant_with_frog_api/page/web_recruitment_apply/widget_page/recruitment_apply_mobile.dart';
import 'package:restaurant_with_frog_api/page/web_recruitment_apply/widget_page/recruitment_apply_table.dart';
import 'package:restaurant_with_frog_api/page/web_recruitment_apply/widget_page/recruitment_apply_web.dart';
import 'package:restaurant_with_frog_api/utils/responsive.dart';

class RecruitmentApply extends StatelessWidget {
  const RecruitmentApply({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RecruitmentApplyCubit(),
      child: ResponsiveBuilder(
        mobile: RecruitmentApplyMobile(),
        tablet: RecruitmentApplyTable(),
        web: RecruitmentApplyWeb(),
      ),
    );
  }
}

