// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_blinds_device_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GenericBlindsDeviceDtos _$_$_GenericBlindsDeviceDtosFromJson(
    Map<String, dynamic> json) {
  return _$_GenericBlindsDeviceDtos(
    deviceDtoClass: json['deviceDtoClass'] as String?,
    id: json['id'] as String?,
    defaultName: json['defaultName'] as String?,
    roomId: json['roomId'] as String?,
    roomName: json['roomName'] as String?,
    deviceStateGRPC: json['deviceStateGRPC'] as String?,
    stateMassage: json['stateMassage'] as String?,
    senderDeviceOs: json['senderDeviceOs'] as String?,
    senderDeviceModel: json['senderDeviceModel'] as String?,
    senderId: json['senderId'] as String?,
    blindsSwitchState: json['blindsSwitchState'] as String?,
    deviceTypes: json['deviceTypes'] as String?,
    compUuid: json['compUuid'] as String?,
    deviceVendor: json['deviceVendor'] as String?,
  );
}

Map<String, dynamic> _$_$_GenericBlindsDeviceDtosToJson(
        _$_GenericBlindsDeviceDtos instance) =>
    <String, dynamic>{
      'deviceDtoClass': instance.deviceDtoClass,
      'id': instance.id,
      'defaultName': instance.defaultName,
      'roomId': instance.roomId,
      'roomName': instance.roomName,
      'deviceStateGRPC': instance.deviceStateGRPC,
      'stateMassage': instance.stateMassage,
      'senderDeviceOs': instance.senderDeviceOs,
      'senderDeviceModel': instance.senderDeviceModel,
      'senderId': instance.senderId,
      'blindsSwitchState': instance.blindsSwitchState,
      'deviceTypes': instance.deviceTypes,
      'compUuid': instance.compUuid,
      'deviceVendor': instance.deviceVendor,
    };
