// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DownloadEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url, String? fileName,
            String? fileExtension, int? downloadIndex)
        startDownload,
    required TResult Function(String taskId) pauseDownload,
    required TResult Function(String taskId) resumeDownload,
    required TResult Function(String taskId) cancelDownload,
    required TResult Function(String taskId, int status, int progress)
        downloadProgressUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url, String? fileName, String? fileExtension,
            int? downloadIndex)?
        startDownload,
    TResult? Function(String taskId)? pauseDownload,
    TResult? Function(String taskId)? resumeDownload,
    TResult? Function(String taskId)? cancelDownload,
    TResult? Function(String taskId, int status, int progress)?
        downloadProgressUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url, String? fileName, String? fileExtension,
            int? downloadIndex)?
        startDownload,
    TResult Function(String taskId)? pauseDownload,
    TResult Function(String taskId)? resumeDownload,
    TResult Function(String taskId)? cancelDownload,
    TResult Function(String taskId, int status, int progress)?
        downloadProgressUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartDownload value) startDownload,
    required TResult Function(_PauseDownload value) pauseDownload,
    required TResult Function(_ResumeDownload value) resumeDownload,
    required TResult Function(_CancelDownload value) cancelDownload,
    required TResult Function(_DownloadProgressUpdate value)
        downloadProgressUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartDownload value)? startDownload,
    TResult? Function(_PauseDownload value)? pauseDownload,
    TResult? Function(_ResumeDownload value)? resumeDownload,
    TResult? Function(_CancelDownload value)? cancelDownload,
    TResult? Function(_DownloadProgressUpdate value)? downloadProgressUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartDownload value)? startDownload,
    TResult Function(_PauseDownload value)? pauseDownload,
    TResult Function(_ResumeDownload value)? resumeDownload,
    TResult Function(_CancelDownload value)? cancelDownload,
    TResult Function(_DownloadProgressUpdate value)? downloadProgressUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadEventCopyWith<$Res> {
  factory $DownloadEventCopyWith(
          DownloadEvent value, $Res Function(DownloadEvent) then) =
      _$DownloadEventCopyWithImpl<$Res, DownloadEvent>;
}

/// @nodoc
class _$DownloadEventCopyWithImpl<$Res, $Val extends DownloadEvent>
    implements $DownloadEventCopyWith<$Res> {
  _$DownloadEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartDownloadImplCopyWith<$Res> {
  factory _$$StartDownloadImplCopyWith(
          _$StartDownloadImpl value, $Res Function(_$StartDownloadImpl) then) =
      __$$StartDownloadImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String url,
      String? fileName,
      String? fileExtension,
      int? downloadIndex});
}

/// @nodoc
class __$$StartDownloadImplCopyWithImpl<$Res>
    extends _$DownloadEventCopyWithImpl<$Res, _$StartDownloadImpl>
    implements _$$StartDownloadImplCopyWith<$Res> {
  __$$StartDownloadImplCopyWithImpl(
      _$StartDownloadImpl _value, $Res Function(_$StartDownloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? fileName = freezed,
    Object? fileExtension = freezed,
    Object? downloadIndex = freezed,
  }) {
    return _then(_$StartDownloadImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      fileExtension: freezed == fileExtension
          ? _value.fileExtension
          : fileExtension // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadIndex: freezed == downloadIndex
          ? _value.downloadIndex
          : downloadIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$StartDownloadImpl
    with DiagnosticableTreeMixin
    implements _StartDownload {
  const _$StartDownloadImpl(
      {required this.url,
      this.fileName,
      this.fileExtension,
      this.downloadIndex});

  @override
  final String url;
  @override
  final String? fileName;
  @override
  final String? fileExtension;
  @override
  final int? downloadIndex;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadEvent.startDownload(url: $url, fileName: $fileName, fileExtension: $fileExtension, downloadIndex: $downloadIndex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DownloadEvent.startDownload'))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('fileName', fileName))
      ..add(DiagnosticsProperty('fileExtension', fileExtension))
      ..add(DiagnosticsProperty('downloadIndex', downloadIndex));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartDownloadImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileExtension, fileExtension) ||
                other.fileExtension == fileExtension) &&
            (identical(other.downloadIndex, downloadIndex) ||
                other.downloadIndex == downloadIndex));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, url, fileName, fileExtension, downloadIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartDownloadImplCopyWith<_$StartDownloadImpl> get copyWith =>
      __$$StartDownloadImplCopyWithImpl<_$StartDownloadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url, String? fileName,
            String? fileExtension, int? downloadIndex)
        startDownload,
    required TResult Function(String taskId) pauseDownload,
    required TResult Function(String taskId) resumeDownload,
    required TResult Function(String taskId) cancelDownload,
    required TResult Function(String taskId, int status, int progress)
        downloadProgressUpdate,
  }) {
    return startDownload(url, fileName, fileExtension, downloadIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url, String? fileName, String? fileExtension,
            int? downloadIndex)?
        startDownload,
    TResult? Function(String taskId)? pauseDownload,
    TResult? Function(String taskId)? resumeDownload,
    TResult? Function(String taskId)? cancelDownload,
    TResult? Function(String taskId, int status, int progress)?
        downloadProgressUpdate,
  }) {
    return startDownload?.call(url, fileName, fileExtension, downloadIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url, String? fileName, String? fileExtension,
            int? downloadIndex)?
        startDownload,
    TResult Function(String taskId)? pauseDownload,
    TResult Function(String taskId)? resumeDownload,
    TResult Function(String taskId)? cancelDownload,
    TResult Function(String taskId, int status, int progress)?
        downloadProgressUpdate,
    required TResult orElse(),
  }) {
    if (startDownload != null) {
      return startDownload(url, fileName, fileExtension, downloadIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartDownload value) startDownload,
    required TResult Function(_PauseDownload value) pauseDownload,
    required TResult Function(_ResumeDownload value) resumeDownload,
    required TResult Function(_CancelDownload value) cancelDownload,
    required TResult Function(_DownloadProgressUpdate value)
        downloadProgressUpdate,
  }) {
    return startDownload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartDownload value)? startDownload,
    TResult? Function(_PauseDownload value)? pauseDownload,
    TResult? Function(_ResumeDownload value)? resumeDownload,
    TResult? Function(_CancelDownload value)? cancelDownload,
    TResult? Function(_DownloadProgressUpdate value)? downloadProgressUpdate,
  }) {
    return startDownload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartDownload value)? startDownload,
    TResult Function(_PauseDownload value)? pauseDownload,
    TResult Function(_ResumeDownload value)? resumeDownload,
    TResult Function(_CancelDownload value)? cancelDownload,
    TResult Function(_DownloadProgressUpdate value)? downloadProgressUpdate,
    required TResult orElse(),
  }) {
    if (startDownload != null) {
      return startDownload(this);
    }
    return orElse();
  }
}

abstract class _StartDownload implements DownloadEvent {
  const factory _StartDownload(
      {required final String url,
      final String? fileName,
      final String? fileExtension,
      final int? downloadIndex}) = _$StartDownloadImpl;

  String get url;
  String? get fileName;
  String? get fileExtension;
  int? get downloadIndex;
  @JsonKey(ignore: true)
  _$$StartDownloadImplCopyWith<_$StartDownloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PauseDownloadImplCopyWith<$Res> {
  factory _$$PauseDownloadImplCopyWith(
          _$PauseDownloadImpl value, $Res Function(_$PauseDownloadImpl) then) =
      __$$PauseDownloadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class __$$PauseDownloadImplCopyWithImpl<$Res>
    extends _$DownloadEventCopyWithImpl<$Res, _$PauseDownloadImpl>
    implements _$$PauseDownloadImplCopyWith<$Res> {
  __$$PauseDownloadImplCopyWithImpl(
      _$PauseDownloadImpl _value, $Res Function(_$PauseDownloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
  }) {
    return _then(_$PauseDownloadImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PauseDownloadImpl
    with DiagnosticableTreeMixin
    implements _PauseDownload {
  const _$PauseDownloadImpl({required this.taskId});

  @override
  final String taskId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadEvent.pauseDownload(taskId: $taskId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DownloadEvent.pauseDownload'))
      ..add(DiagnosticsProperty('taskId', taskId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PauseDownloadImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PauseDownloadImplCopyWith<_$PauseDownloadImpl> get copyWith =>
      __$$PauseDownloadImplCopyWithImpl<_$PauseDownloadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url, String? fileName,
            String? fileExtension, int? downloadIndex)
        startDownload,
    required TResult Function(String taskId) pauseDownload,
    required TResult Function(String taskId) resumeDownload,
    required TResult Function(String taskId) cancelDownload,
    required TResult Function(String taskId, int status, int progress)
        downloadProgressUpdate,
  }) {
    return pauseDownload(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url, String? fileName, String? fileExtension,
            int? downloadIndex)?
        startDownload,
    TResult? Function(String taskId)? pauseDownload,
    TResult? Function(String taskId)? resumeDownload,
    TResult? Function(String taskId)? cancelDownload,
    TResult? Function(String taskId, int status, int progress)?
        downloadProgressUpdate,
  }) {
    return pauseDownload?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url, String? fileName, String? fileExtension,
            int? downloadIndex)?
        startDownload,
    TResult Function(String taskId)? pauseDownload,
    TResult Function(String taskId)? resumeDownload,
    TResult Function(String taskId)? cancelDownload,
    TResult Function(String taskId, int status, int progress)?
        downloadProgressUpdate,
    required TResult orElse(),
  }) {
    if (pauseDownload != null) {
      return pauseDownload(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartDownload value) startDownload,
    required TResult Function(_PauseDownload value) pauseDownload,
    required TResult Function(_ResumeDownload value) resumeDownload,
    required TResult Function(_CancelDownload value) cancelDownload,
    required TResult Function(_DownloadProgressUpdate value)
        downloadProgressUpdate,
  }) {
    return pauseDownload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartDownload value)? startDownload,
    TResult? Function(_PauseDownload value)? pauseDownload,
    TResult? Function(_ResumeDownload value)? resumeDownload,
    TResult? Function(_CancelDownload value)? cancelDownload,
    TResult? Function(_DownloadProgressUpdate value)? downloadProgressUpdate,
  }) {
    return pauseDownload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartDownload value)? startDownload,
    TResult Function(_PauseDownload value)? pauseDownload,
    TResult Function(_ResumeDownload value)? resumeDownload,
    TResult Function(_CancelDownload value)? cancelDownload,
    TResult Function(_DownloadProgressUpdate value)? downloadProgressUpdate,
    required TResult orElse(),
  }) {
    if (pauseDownload != null) {
      return pauseDownload(this);
    }
    return orElse();
  }
}

abstract class _PauseDownload implements DownloadEvent {
  const factory _PauseDownload({required final String taskId}) =
      _$PauseDownloadImpl;

  String get taskId;
  @JsonKey(ignore: true)
  _$$PauseDownloadImplCopyWith<_$PauseDownloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResumeDownloadImplCopyWith<$Res> {
  factory _$$ResumeDownloadImplCopyWith(_$ResumeDownloadImpl value,
          $Res Function(_$ResumeDownloadImpl) then) =
      __$$ResumeDownloadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class __$$ResumeDownloadImplCopyWithImpl<$Res>
    extends _$DownloadEventCopyWithImpl<$Res, _$ResumeDownloadImpl>
    implements _$$ResumeDownloadImplCopyWith<$Res> {
  __$$ResumeDownloadImplCopyWithImpl(
      _$ResumeDownloadImpl _value, $Res Function(_$ResumeDownloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
  }) {
    return _then(_$ResumeDownloadImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ResumeDownloadImpl
    with DiagnosticableTreeMixin
    implements _ResumeDownload {
  const _$ResumeDownloadImpl({required this.taskId});

  @override
  final String taskId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadEvent.resumeDownload(taskId: $taskId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DownloadEvent.resumeDownload'))
      ..add(DiagnosticsProperty('taskId', taskId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResumeDownloadImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResumeDownloadImplCopyWith<_$ResumeDownloadImpl> get copyWith =>
      __$$ResumeDownloadImplCopyWithImpl<_$ResumeDownloadImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url, String? fileName,
            String? fileExtension, int? downloadIndex)
        startDownload,
    required TResult Function(String taskId) pauseDownload,
    required TResult Function(String taskId) resumeDownload,
    required TResult Function(String taskId) cancelDownload,
    required TResult Function(String taskId, int status, int progress)
        downloadProgressUpdate,
  }) {
    return resumeDownload(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url, String? fileName, String? fileExtension,
            int? downloadIndex)?
        startDownload,
    TResult? Function(String taskId)? pauseDownload,
    TResult? Function(String taskId)? resumeDownload,
    TResult? Function(String taskId)? cancelDownload,
    TResult? Function(String taskId, int status, int progress)?
        downloadProgressUpdate,
  }) {
    return resumeDownload?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url, String? fileName, String? fileExtension,
            int? downloadIndex)?
        startDownload,
    TResult Function(String taskId)? pauseDownload,
    TResult Function(String taskId)? resumeDownload,
    TResult Function(String taskId)? cancelDownload,
    TResult Function(String taskId, int status, int progress)?
        downloadProgressUpdate,
    required TResult orElse(),
  }) {
    if (resumeDownload != null) {
      return resumeDownload(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartDownload value) startDownload,
    required TResult Function(_PauseDownload value) pauseDownload,
    required TResult Function(_ResumeDownload value) resumeDownload,
    required TResult Function(_CancelDownload value) cancelDownload,
    required TResult Function(_DownloadProgressUpdate value)
        downloadProgressUpdate,
  }) {
    return resumeDownload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartDownload value)? startDownload,
    TResult? Function(_PauseDownload value)? pauseDownload,
    TResult? Function(_ResumeDownload value)? resumeDownload,
    TResult? Function(_CancelDownload value)? cancelDownload,
    TResult? Function(_DownloadProgressUpdate value)? downloadProgressUpdate,
  }) {
    return resumeDownload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartDownload value)? startDownload,
    TResult Function(_PauseDownload value)? pauseDownload,
    TResult Function(_ResumeDownload value)? resumeDownload,
    TResult Function(_CancelDownload value)? cancelDownload,
    TResult Function(_DownloadProgressUpdate value)? downloadProgressUpdate,
    required TResult orElse(),
  }) {
    if (resumeDownload != null) {
      return resumeDownload(this);
    }
    return orElse();
  }
}

abstract class _ResumeDownload implements DownloadEvent {
  const factory _ResumeDownload({required final String taskId}) =
      _$ResumeDownloadImpl;

  String get taskId;
  @JsonKey(ignore: true)
  _$$ResumeDownloadImplCopyWith<_$ResumeDownloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelDownloadImplCopyWith<$Res> {
  factory _$$CancelDownloadImplCopyWith(_$CancelDownloadImpl value,
          $Res Function(_$CancelDownloadImpl) then) =
      __$$CancelDownloadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class __$$CancelDownloadImplCopyWithImpl<$Res>
    extends _$DownloadEventCopyWithImpl<$Res, _$CancelDownloadImpl>
    implements _$$CancelDownloadImplCopyWith<$Res> {
  __$$CancelDownloadImplCopyWithImpl(
      _$CancelDownloadImpl _value, $Res Function(_$CancelDownloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
  }) {
    return _then(_$CancelDownloadImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CancelDownloadImpl
    with DiagnosticableTreeMixin
    implements _CancelDownload {
  const _$CancelDownloadImpl({required this.taskId});

  @override
  final String taskId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadEvent.cancelDownload(taskId: $taskId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DownloadEvent.cancelDownload'))
      ..add(DiagnosticsProperty('taskId', taskId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelDownloadImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelDownloadImplCopyWith<_$CancelDownloadImpl> get copyWith =>
      __$$CancelDownloadImplCopyWithImpl<_$CancelDownloadImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url, String? fileName,
            String? fileExtension, int? downloadIndex)
        startDownload,
    required TResult Function(String taskId) pauseDownload,
    required TResult Function(String taskId) resumeDownload,
    required TResult Function(String taskId) cancelDownload,
    required TResult Function(String taskId, int status, int progress)
        downloadProgressUpdate,
  }) {
    return cancelDownload(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url, String? fileName, String? fileExtension,
            int? downloadIndex)?
        startDownload,
    TResult? Function(String taskId)? pauseDownload,
    TResult? Function(String taskId)? resumeDownload,
    TResult? Function(String taskId)? cancelDownload,
    TResult? Function(String taskId, int status, int progress)?
        downloadProgressUpdate,
  }) {
    return cancelDownload?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url, String? fileName, String? fileExtension,
            int? downloadIndex)?
        startDownload,
    TResult Function(String taskId)? pauseDownload,
    TResult Function(String taskId)? resumeDownload,
    TResult Function(String taskId)? cancelDownload,
    TResult Function(String taskId, int status, int progress)?
        downloadProgressUpdate,
    required TResult orElse(),
  }) {
    if (cancelDownload != null) {
      return cancelDownload(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartDownload value) startDownload,
    required TResult Function(_PauseDownload value) pauseDownload,
    required TResult Function(_ResumeDownload value) resumeDownload,
    required TResult Function(_CancelDownload value) cancelDownload,
    required TResult Function(_DownloadProgressUpdate value)
        downloadProgressUpdate,
  }) {
    return cancelDownload(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartDownload value)? startDownload,
    TResult? Function(_PauseDownload value)? pauseDownload,
    TResult? Function(_ResumeDownload value)? resumeDownload,
    TResult? Function(_CancelDownload value)? cancelDownload,
    TResult? Function(_DownloadProgressUpdate value)? downloadProgressUpdate,
  }) {
    return cancelDownload?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartDownload value)? startDownload,
    TResult Function(_PauseDownload value)? pauseDownload,
    TResult Function(_ResumeDownload value)? resumeDownload,
    TResult Function(_CancelDownload value)? cancelDownload,
    TResult Function(_DownloadProgressUpdate value)? downloadProgressUpdate,
    required TResult orElse(),
  }) {
    if (cancelDownload != null) {
      return cancelDownload(this);
    }
    return orElse();
  }
}

abstract class _CancelDownload implements DownloadEvent {
  const factory _CancelDownload({required final String taskId}) =
      _$CancelDownloadImpl;

  String get taskId;
  @JsonKey(ignore: true)
  _$$CancelDownloadImplCopyWith<_$CancelDownloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownloadProgressUpdateImplCopyWith<$Res> {
  factory _$$DownloadProgressUpdateImplCopyWith(
          _$DownloadProgressUpdateImpl value,
          $Res Function(_$DownloadProgressUpdateImpl) then) =
      __$$DownloadProgressUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taskId, int status, int progress});
}

/// @nodoc
class __$$DownloadProgressUpdateImplCopyWithImpl<$Res>
    extends _$DownloadEventCopyWithImpl<$Res, _$DownloadProgressUpdateImpl>
    implements _$$DownloadProgressUpdateImplCopyWith<$Res> {
  __$$DownloadProgressUpdateImplCopyWithImpl(
      _$DownloadProgressUpdateImpl _value,
      $Res Function(_$DownloadProgressUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? status = null,
    Object? progress = null,
  }) {
    return _then(_$DownloadProgressUpdateImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DownloadProgressUpdateImpl
    with DiagnosticableTreeMixin
    implements _DownloadProgressUpdate {
  const _$DownloadProgressUpdateImpl(
      {required this.taskId, required this.status, required this.progress});

  @override
  final String taskId;
  @override
  final int status;
  @override
  final int progress;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadEvent.downloadProgressUpdate(taskId: $taskId, status: $status, progress: $progress)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DownloadEvent.downloadProgressUpdate'))
      ..add(DiagnosticsProperty('taskId', taskId))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('progress', progress));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadProgressUpdateImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId, status, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadProgressUpdateImplCopyWith<_$DownloadProgressUpdateImpl>
      get copyWith => __$$DownloadProgressUpdateImplCopyWithImpl<
          _$DownloadProgressUpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url, String? fileName,
            String? fileExtension, int? downloadIndex)
        startDownload,
    required TResult Function(String taskId) pauseDownload,
    required TResult Function(String taskId) resumeDownload,
    required TResult Function(String taskId) cancelDownload,
    required TResult Function(String taskId, int status, int progress)
        downloadProgressUpdate,
  }) {
    return downloadProgressUpdate(taskId, status, progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url, String? fileName, String? fileExtension,
            int? downloadIndex)?
        startDownload,
    TResult? Function(String taskId)? pauseDownload,
    TResult? Function(String taskId)? resumeDownload,
    TResult? Function(String taskId)? cancelDownload,
    TResult? Function(String taskId, int status, int progress)?
        downloadProgressUpdate,
  }) {
    return downloadProgressUpdate?.call(taskId, status, progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url, String? fileName, String? fileExtension,
            int? downloadIndex)?
        startDownload,
    TResult Function(String taskId)? pauseDownload,
    TResult Function(String taskId)? resumeDownload,
    TResult Function(String taskId)? cancelDownload,
    TResult Function(String taskId, int status, int progress)?
        downloadProgressUpdate,
    required TResult orElse(),
  }) {
    if (downloadProgressUpdate != null) {
      return downloadProgressUpdate(taskId, status, progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartDownload value) startDownload,
    required TResult Function(_PauseDownload value) pauseDownload,
    required TResult Function(_ResumeDownload value) resumeDownload,
    required TResult Function(_CancelDownload value) cancelDownload,
    required TResult Function(_DownloadProgressUpdate value)
        downloadProgressUpdate,
  }) {
    return downloadProgressUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartDownload value)? startDownload,
    TResult? Function(_PauseDownload value)? pauseDownload,
    TResult? Function(_ResumeDownload value)? resumeDownload,
    TResult? Function(_CancelDownload value)? cancelDownload,
    TResult? Function(_DownloadProgressUpdate value)? downloadProgressUpdate,
  }) {
    return downloadProgressUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartDownload value)? startDownload,
    TResult Function(_PauseDownload value)? pauseDownload,
    TResult Function(_ResumeDownload value)? resumeDownload,
    TResult Function(_CancelDownload value)? cancelDownload,
    TResult Function(_DownloadProgressUpdate value)? downloadProgressUpdate,
    required TResult orElse(),
  }) {
    if (downloadProgressUpdate != null) {
      return downloadProgressUpdate(this);
    }
    return orElse();
  }
}

abstract class _DownloadProgressUpdate implements DownloadEvent {
  const factory _DownloadProgressUpdate(
      {required final String taskId,
      required final int status,
      required final int progress}) = _$DownloadProgressUpdateImpl;

  String get taskId;
  int get status;
  int get progress;
  @JsonKey(ignore: true)
  _$$DownloadProgressUpdateImplCopyWith<_$DownloadProgressUpdateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DownloadState {
  DownloadRepository get downloadRepository =>
      throw _privateConstructorUsedError;
  DownloadStatus get downloadStatus => throw _privateConstructorUsedError;
  String get taskId => throw _privateConstructorUsedError;
  int get progress => throw _privateConstructorUsedError;
  int? get activeDownloadId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadStateCopyWith<DownloadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadStateCopyWith<$Res> {
  factory $DownloadStateCopyWith(
          DownloadState value, $Res Function(DownloadState) then) =
      _$DownloadStateCopyWithImpl<$Res, DownloadState>;
  @useResult
  $Res call(
      {DownloadRepository downloadRepository,
      DownloadStatus downloadStatus,
      String taskId,
      int progress,
      int? activeDownloadId});
}

/// @nodoc
class _$DownloadStateCopyWithImpl<$Res, $Val extends DownloadState>
    implements $DownloadStateCopyWith<$Res> {
  _$DownloadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadRepository = null,
    Object? downloadStatus = null,
    Object? taskId = null,
    Object? progress = null,
    Object? activeDownloadId = freezed,
  }) {
    return _then(_value.copyWith(
      downloadRepository: null == downloadRepository
          ? _value.downloadRepository
          : downloadRepository // ignore: cast_nullable_to_non_nullable
              as DownloadRepository,
      downloadStatus: null == downloadStatus
          ? _value.downloadStatus
          : downloadStatus // ignore: cast_nullable_to_non_nullable
              as DownloadStatus,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      activeDownloadId: freezed == activeDownloadId
          ? _value.activeDownloadId
          : activeDownloadId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DownloadStateImplCopyWith<$Res>
    implements $DownloadStateCopyWith<$Res> {
  factory _$$DownloadStateImplCopyWith(
          _$DownloadStateImpl value, $Res Function(_$DownloadStateImpl) then) =
      __$$DownloadStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DownloadRepository downloadRepository,
      DownloadStatus downloadStatus,
      String taskId,
      int progress,
      int? activeDownloadId});
}

/// @nodoc
class __$$DownloadStateImplCopyWithImpl<$Res>
    extends _$DownloadStateCopyWithImpl<$Res, _$DownloadStateImpl>
    implements _$$DownloadStateImplCopyWith<$Res> {
  __$$DownloadStateImplCopyWithImpl(
      _$DownloadStateImpl _value, $Res Function(_$DownloadStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? downloadRepository = null,
    Object? downloadStatus = null,
    Object? taskId = null,
    Object? progress = null,
    Object? activeDownloadId = freezed,
  }) {
    return _then(_$DownloadStateImpl(
      downloadRepository: null == downloadRepository
          ? _value.downloadRepository
          : downloadRepository // ignore: cast_nullable_to_non_nullable
              as DownloadRepository,
      downloadStatus: null == downloadStatus
          ? _value.downloadStatus
          : downloadStatus // ignore: cast_nullable_to_non_nullable
              as DownloadStatus,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      activeDownloadId: freezed == activeDownloadId
          ? _value.activeDownloadId
          : activeDownloadId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$DownloadStateImpl
    with DiagnosticableTreeMixin
    implements _DownloadState {
  const _$DownloadStateImpl(
      {required this.downloadRepository,
      this.downloadStatus = DownloadStatus.downloadInitial,
      this.taskId = "",
      this.progress = 0,
      this.activeDownloadId});

  @override
  final DownloadRepository downloadRepository;
  @override
  @JsonKey()
  final DownloadStatus downloadStatus;
  @override
  @JsonKey()
  final String taskId;
  @override
  @JsonKey()
  final int progress;
  @override
  final int? activeDownloadId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadState(downloadRepository: $downloadRepository, downloadStatus: $downloadStatus, taskId: $taskId, progress: $progress, activeDownloadId: $activeDownloadId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DownloadState'))
      ..add(DiagnosticsProperty('downloadRepository', downloadRepository))
      ..add(DiagnosticsProperty('downloadStatus', downloadStatus))
      ..add(DiagnosticsProperty('taskId', taskId))
      ..add(DiagnosticsProperty('progress', progress))
      ..add(DiagnosticsProperty('activeDownloadId', activeDownloadId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadStateImpl &&
            (identical(other.downloadRepository, downloadRepository) ||
                other.downloadRepository == downloadRepository) &&
            (identical(other.downloadStatus, downloadStatus) ||
                other.downloadStatus == downloadStatus) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.activeDownloadId, activeDownloadId) ||
                other.activeDownloadId == activeDownloadId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, downloadRepository,
      downloadStatus, taskId, progress, activeDownloadId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadStateImplCopyWith<_$DownloadStateImpl> get copyWith =>
      __$$DownloadStateImplCopyWithImpl<_$DownloadStateImpl>(this, _$identity);
}

abstract class _DownloadState implements DownloadState {
  const factory _DownloadState(
      {required final DownloadRepository downloadRepository,
      final DownloadStatus downloadStatus,
      final String taskId,
      final int progress,
      final int? activeDownloadId}) = _$DownloadStateImpl;

  @override
  DownloadRepository get downloadRepository;
  @override
  DownloadStatus get downloadStatus;
  @override
  String get taskId;
  @override
  int get progress;
  @override
  int? get activeDownloadId;
  @override
  @JsonKey(ignore: true)
  _$$DownloadStateImplCopyWith<_$DownloadStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
