import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_cite/src/feature/dto/request/problems_request.dart';
import 'package:smart_cite/src/feature/signalement/model/problems_model.dart';
import 'package:smart_cite/src/feature/signalement/repositories/problemes_repository.dart';

part 'reporting_state.dart';
part 'reporting_cubit.freezed.dart';

class ReportingCubit extends Cubit<ReportingState> {
  final ProblemsRepository problemsRepository = ProblemsRepository();
  ReportingCubit() : super(const ReportingState.initial());

  Future<void> getReports() async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      emit(const ReportingState.notConnected());

    } else {
      emit(const ReportingState.loading());
      try {
        List<Problems>? problems =
        await problemsRepository.getProblems();
        if (problems == []) {
          emit(const ReportingState.empty());
        } else {
          emit(ReportingState.success(reports: problems));
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        emit(const ReportingState.error(error: 'Une erreur est survenue'));
      }
    }
  }

  Future<void> createReport(ProblemsRequest problem, File image) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      emit(const ReportingState.notConnected());

    } else {
      emit(const ReportingState.loading());
      try {
        await problemsRepository.createProblems(problem);
        /*
        if (problems == []) {
          emit(const ReportingState.empty());
        } else {
          emit(ReportingState.success(reports: problems));
        }
         */
        emit(const ReportingState.success(reports: []));
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        emit(const ReportingState.error(error: 'Une erreur est survenue'));
      }
    }
  }

  Future<void> modifyReport(Problems problem) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      emit(const ReportingState.notConnected());

    } else {
      emit(const ReportingState.loading());
      try {
        await problemsRepository.updateProblems(problem);
        /*
        if (problems == []) {
          emit(const ReportingState.empty());
        } else {
          emit(ReportingState.success(reports: problems));
        }
         */
        emit(const ReportingState.success(reports: []));
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        emit(const ReportingState.error(error: 'Une erreur est survenue'));
      }
    }
  }

  Future<void> changeStatus(Problems problem, String newStatus) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      emit(const ReportingState.notConnected());

    } else {
      emit(const ReportingState.loading());
      try {
        await problemsRepository.changeProblemStatus(problem, newStatus);
        /*
        if (problems == []) {
          emit(const ReportingState.empty());
        } else {
          emit(ReportingState.success(reports: problems));
        }
         */
        emit(const ReportingState.success(reports: []));
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        emit(const ReportingState.error(error: 'Une erreur est survenue'));
      }
    }
  }

  Future<void> deleteReport(Problems problem) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      emit(const ReportingState.notConnected());

    } else {
      emit(const ReportingState.loading());
      try {
        await problemsRepository.deleteProblems(problem.id);
        /*
        if (problems == []) {
          emit(const ReportingState.empty());
        } else {
          emit(ReportingState.success(reports: problems));
        }
         */
        emit(const ReportingState.success(reports: []));
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        emit(const ReportingState.error(error: 'Une erreur est survenue'));
      }
    }
  }
}
