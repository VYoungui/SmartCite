part of 'agent_cubit.dart';

@freezed
class AgentState with _$AgentState {
  const factory AgentState.initial() = _Initial;
  const factory AgentState.loading() = _Loading;
  const factory AgentState.success() = _Success;
  const factory AgentState.error({required String error}) = _Error;
  const factory AgentState.notConnected() = _NotConnected;
}
