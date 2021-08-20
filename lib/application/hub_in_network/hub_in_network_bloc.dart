import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cybear_jinni/domain/devices/abstract_device/device_entity_abstract.dart';
import 'package:cybear_jinni/domain/devices/device/devices_failures.dart';
import 'package:cybear_jinni/domain/hub/hub_failures.dart';
import 'package:cybear_jinni/domain/hub/i_hub_connection_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

part 'hub_in_network_bloc.freezed.dart';
part 'hub_in_network_event.dart';
part 'hub_in_network_state.dart';

@injectable
class HubInNetworkBloc extends Bloc<HubInNetworkEvent, HubInNetworkState> {
  HubInNetworkBloc(this._hubConnectionRepository)
      : super(HubInNetworkState.initial());

  final IHubConnectionRepository _hubConnectionRepository;
  StreamSubscription<Either<DevicesFailure, KtList<DeviceEntityAbstract?>>>?
      _deviceStreamSubscription;

  @override
  Stream<HubInNetworkState> mapEventToState(
    HubInNetworkEvent event,
  ) async* {
    yield* event.map(
      searchHubInNetwork: (e) async* {
        yield const HubInNetworkState.loadInProgress();
        yield (await _hubConnectionRepository.searchForHub()).fold(
            (l) => HubInNetworkState.loadFailure(l),
            (r) => const HubInNetworkState.loadSuccess());
      },
    );
  }

  @override
  Future<void> close() async {
    await _deviceStreamSubscription?.cancel();
    return super.close();
  }
}
