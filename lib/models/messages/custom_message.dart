import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../message.dart';
import '../user.dart' show User;
import 'partial_custom.dart';

part 'custom_message.g.dart';

/// A class that represents custom message. Use [metadata] to store anything
/// you want.
@JsonSerializable()
@immutable
abstract class CustomMessage extends Message {
  /// Creates a custom message.
  const CustomMessage._({
    required super.author,
    super.createdAt,
    required super.id,
    super.metadata,
    super.remoteId,
    super.repliedMessage,
    super.roomId,
    super.showStatus,
    super.status,
    MessageType? type,
    super.updatedAt,
    super.isEdited,
    super.isDeleted,
    super.reactions,
  }) : super(type: type ?? MessageType.custom);

  const factory CustomMessage({
    required User author,
    int? createdAt,
    required String id,
    Map<String, dynamic>? metadata,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    bool? showStatus,
    Status? status,
    MessageType? type,
    int? updatedAt,
    bool? isEdited,
    bool? isDeleted,
    Map<String, String>? reactions,
  }) = _CustomMessage;

  /// Creates a custom message from a map (decoded JSON).
  factory CustomMessage.fromJson(Map<String, dynamic> json) =>
      _$CustomMessageFromJson(json);

  /// Creates a full custom message from a partial one.
  factory CustomMessage.fromPartial({
    required User author,
    int? createdAt,
    required String id,
    required PartialCustom partialCustom,
    String? remoteId,
    String? roomId,
    bool? showStatus,
    Status? status,
    int? updatedAt,
    bool? isEdited,
    bool? isDeleted,
    Map<String, String>? reactions,
  }) =>
      _CustomMessage(
        author: author,
        createdAt: createdAt,
        id: id,
        metadata: partialCustom.metadata,
        remoteId: remoteId,
        repliedMessage: partialCustom.repliedMessage,
        roomId: roomId,
        showStatus: showStatus,
        status: status,
        type: MessageType.custom,
        updatedAt: updatedAt,
        isEdited: isEdited ?? false,
        isDeleted: isDeleted ?? false,
        reactions: reactions ?? const {},
      );

  /// Equatable props.
  @override
  List<Object?> get props => [
        author,
        createdAt,
        id,
        metadata,
        remoteId,
        repliedMessage,
        roomId,
        showStatus,
        status,
        updatedAt,
        isEdited,
        isDeleted,
        reactions,
      ];

  @override
  Message copyWith({
    User? author,
    int? createdAt,
    String? id,
    Map<String, dynamic>? metadata,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    bool? showStatus,
    Status? status,
    int? updatedAt,
    bool? isEdited,
    bool? isDeleted,
    Map<String, String>? reactions,
  });

  /// Converts a custom message to the map representation,
  /// encodable to JSON.
  @override
  Map<String, dynamic> toJson() => _$CustomMessageToJson(this);
}

/// A utility class to enable better copyWith.
class _CustomMessage extends CustomMessage {
  const _CustomMessage({
    required super.author,
    super.createdAt,
    required super.id,
    super.metadata,
    super.remoteId,
    super.repliedMessage,
    super.roomId,
    super.showStatus,
    super.status,
    super.type,
    super.updatedAt,
    super.isEdited,
    super.isDeleted,
    super.reactions,
  }) : super._();

  @override
  Message copyWith({
    User? author,
    dynamic createdAt = _Unset,
    String? id,
    dynamic metadata = _Unset,
    dynamic remoteId = _Unset,
    dynamic repliedMessage = _Unset,
    dynamic roomId = _Unset,
    dynamic showStatus = _Unset,
    dynamic status = _Unset,
    dynamic updatedAt = _Unset,
    dynamic isEdited = _Unset,
    dynamic isDeleted = _Unset,
    dynamic reactions = _Unset,
  }) =>
      _CustomMessage(
        author: author ?? this.author,
        createdAt: createdAt == _Unset ? this.createdAt : createdAt as int?,
        id: id ?? this.id,
        metadata: metadata == _Unset
            ? this.metadata
            : metadata as Map<String, dynamic>?,
        remoteId: remoteId == _Unset ? this.remoteId : remoteId as String?,
        repliedMessage: repliedMessage == _Unset
            ? this.repliedMessage
            : repliedMessage as Message?,
        roomId: roomId == _Unset ? this.roomId : roomId as String?,
        showStatus:
            showStatus == _Unset ? this.showStatus : showStatus as bool?,
        status: status == _Unset ? this.status : status as Status?,
        updatedAt: updatedAt == _Unset ? this.updatedAt : updatedAt as int?,
        isEdited: isEdited == _Unset ? this.isEdited : isEdited as bool?,
        isDeleted: isDeleted == _Unset ? this.isDeleted : isDeleted as bool?,
        reactions: reactions == _Unset
            ? this.reactions
            : reactions as Map<String, String>?,
      );
}

class _Unset {}
