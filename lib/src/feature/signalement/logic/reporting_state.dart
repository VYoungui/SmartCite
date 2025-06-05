part of 'reporting_cubit.dart';

@freezed
class ReportingState with _$ReportingState {
  const factory ReportingState.initial() = _Initial;
  const factory ReportingState.loading() = _Loading;
  const factory ReportingState.empty() = _Empty;
  const factory ReportingState.success({required List<Problems> reports}) = _Success;
  const factory ReportingState.error({required String error}) = _Error;
  const factory ReportingState.notConnected() = _NotConnected;
}
