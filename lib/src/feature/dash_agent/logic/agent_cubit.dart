import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_state.dart';
part 'agent_cubit.freezed.dart';

class AgentCubit extends Cubit<AgentState> {
  AgentCubit() : super(const AgentState.initial());
}
