import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseNotifier extends StateNotifier<BaseState> {
  BaseNotifier() : super(BaseState());

  CancelToken cancelToken = CancelToken();

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  bool get isLoading => state.isLoading;
}

class BaseState {
  final bool isLoading;

  BaseState({this.isLoading = false});

  BaseState copyWith({bool? isLoading}) {
    return BaseState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

final baseNotifierProvider =
    StateNotifierProvider<BaseNotifier, BaseState>((ref) {
  return BaseNotifier();
});
