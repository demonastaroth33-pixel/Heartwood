// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $JournalEntriesTable extends JournalEntries
    with TableInfo<$JournalEntriesTable, JournalEntryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _areaMeta = const VerificationMeta('area');
  @override
  late final GeneratedColumn<String> area = GeneratedColumn<String>(
    'area',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagsJsonMeta = const VerificationMeta(
    'tagsJson',
  );
  @override
  late final GeneratedColumn<String> tagsJson = GeneratedColumn<String>(
    'tags_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _importedMeta = const VerificationMeta(
    'imported',
  );
  @override
  late final GeneratedColumn<bool> imported = GeneratedColumn<bool>(
    'imported',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("imported" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _importHashMeta = const VerificationMeta(
    'importHash',
  );
  @override
  late final GeneratedColumn<String> importHash = GeneratedColumn<String>(
    'import_hash',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    body,
    area,
    tagsJson,
    createdAt,
    updatedAt,
    deletedAt,
    imported,
    importHash,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journal_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<JournalEntryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('area')) {
      context.handle(
        _areaMeta,
        area.isAcceptableOrUnknown(data['area']!, _areaMeta),
      );
    }
    if (data.containsKey('tags_json')) {
      context.handle(
        _tagsJsonMeta,
        tagsJson.isAcceptableOrUnknown(data['tags_json']!, _tagsJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_tagsJsonMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('imported')) {
      context.handle(
        _importedMeta,
        imported.isAcceptableOrUnknown(data['imported']!, _importedMeta),
      );
    }
    if (data.containsKey('import_hash')) {
      context.handle(
        _importHashMeta,
        importHash.isAcceptableOrUnknown(data['import_hash']!, _importHashMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JournalEntryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JournalEntryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      area: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}area'],
      ),
      tagsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags_json'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      imported: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}imported'],
      )!,
      importHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}import_hash'],
      ),
    );
  }

  @override
  $JournalEntriesTable createAlias(String alias) {
    return $JournalEntriesTable(attachedDatabase, alias);
  }
}

class JournalEntryRow extends DataClass implements Insertable<JournalEntryRow> {
  final String id;
  final String? title;
  final String body;
  final String? area;
  final String tagsJson;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final bool imported;
  final String? importHash;
  const JournalEntryRow({
    required this.id,
    this.title,
    required this.body,
    this.area,
    required this.tagsJson,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.imported,
    this.importHash,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    map['body'] = Variable<String>(body);
    if (!nullToAbsent || area != null) {
      map['area'] = Variable<String>(area);
    }
    map['tags_json'] = Variable<String>(tagsJson);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['imported'] = Variable<bool>(imported);
    if (!nullToAbsent || importHash != null) {
      map['import_hash'] = Variable<String>(importHash);
    }
    return map;
  }

  JournalEntriesCompanion toCompanion(bool nullToAbsent) {
    return JournalEntriesCompanion(
      id: Value(id),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
      body: Value(body),
      area: area == null && nullToAbsent ? const Value.absent() : Value(area),
      tagsJson: Value(tagsJson),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      imported: Value(imported),
      importHash: importHash == null && nullToAbsent
          ? const Value.absent()
          : Value(importHash),
    );
  }

  factory JournalEntryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalEntryRow(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      area: serializer.fromJson<String?>(json['area']),
      tagsJson: serializer.fromJson<String>(json['tagsJson']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      imported: serializer.fromJson<bool>(json['imported']),
      importHash: serializer.fromJson<String?>(json['importHash']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String?>(title),
      'body': serializer.toJson<String>(body),
      'area': serializer.toJson<String?>(area),
      'tagsJson': serializer.toJson<String>(tagsJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'imported': serializer.toJson<bool>(imported),
      'importHash': serializer.toJson<String?>(importHash),
    };
  }

  JournalEntryRow copyWith({
    String? id,
    Value<String?> title = const Value.absent(),
    String? body,
    Value<String?> area = const Value.absent(),
    String? tagsJson,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    bool? imported,
    Value<String?> importHash = const Value.absent(),
  }) => JournalEntryRow(
    id: id ?? this.id,
    title: title.present ? title.value : this.title,
    body: body ?? this.body,
    area: area.present ? area.value : this.area,
    tagsJson: tagsJson ?? this.tagsJson,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    imported: imported ?? this.imported,
    importHash: importHash.present ? importHash.value : this.importHash,
  );
  JournalEntryRow copyWithCompanion(JournalEntriesCompanion data) {
    return JournalEntryRow(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      area: data.area.present ? data.area.value : this.area,
      tagsJson: data.tagsJson.present ? data.tagsJson.value : this.tagsJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      imported: data.imported.present ? data.imported.value : this.imported,
      importHash: data.importHash.present
          ? data.importHash.value
          : this.importHash,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntryRow(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('area: $area, ')
          ..write('tagsJson: $tagsJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('imported: $imported, ')
          ..write('importHash: $importHash')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    body,
    area,
    tagsJson,
    createdAt,
    updatedAt,
    deletedAt,
    imported,
    importHash,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JournalEntryRow &&
          other.id == this.id &&
          other.title == this.title &&
          other.body == this.body &&
          other.area == this.area &&
          other.tagsJson == this.tagsJson &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.imported == this.imported &&
          other.importHash == this.importHash);
}

class JournalEntriesCompanion extends UpdateCompanion<JournalEntryRow> {
  final Value<String> id;
  final Value<String?> title;
  final Value<String> body;
  final Value<String?> area;
  final Value<String> tagsJson;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<bool> imported;
  final Value<String?> importHash;
  final Value<int> rowid;
  const JournalEntriesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.area = const Value.absent(),
    this.tagsJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.imported = const Value.absent(),
    this.importHash = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  JournalEntriesCompanion.insert({
    required String id,
    this.title = const Value.absent(),
    required String body,
    this.area = const Value.absent(),
    required String tagsJson,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.imported = const Value.absent(),
    this.importHash = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       body = Value(body),
       tagsJson = Value(tagsJson),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<JournalEntryRow> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? body,
    Expression<String>? area,
    Expression<String>? tagsJson,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<bool>? imported,
    Expression<String>? importHash,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (area != null) 'area': area,
      if (tagsJson != null) 'tags_json': tagsJson,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (imported != null) 'imported': imported,
      if (importHash != null) 'import_hash': importHash,
      if (rowid != null) 'rowid': rowid,
    });
  }

  JournalEntriesCompanion copyWith({
    Value<String>? id,
    Value<String?>? title,
    Value<String>? body,
    Value<String?>? area,
    Value<String>? tagsJson,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<bool>? imported,
    Value<String?>? importHash,
    Value<int>? rowid,
  }) {
    return JournalEntriesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      area: area ?? this.area,
      tagsJson: tagsJson ?? this.tagsJson,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      imported: imported ?? this.imported,
      importHash: importHash ?? this.importHash,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (area.present) {
      map['area'] = Variable<String>(area.value);
    }
    if (tagsJson.present) {
      map['tags_json'] = Variable<String>(tagsJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (imported.present) {
      map['imported'] = Variable<bool>(imported.value);
    }
    if (importHash.present) {
      map['import_hash'] = Variable<String>(importHash.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntriesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('area: $area, ')
          ..write('tagsJson: $tagsJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('imported: $imported, ')
          ..write('importHash: $importHash, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MediaAttachmentsTable extends MediaAttachments
    with TableInfo<$MediaAttachmentsTable, MediaAttachmentRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediaAttachmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entryIdMeta = const VerificationMeta(
    'entryId',
  );
  @override
  late final GeneratedColumn<String> entryId = GeneratedColumn<String>(
    'entry_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES journal_entries (id)',
    ),
  );
  static const VerificationMeta _fileNameMeta = const VerificationMeta(
    'fileName',
  );
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
    'file_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mimeTypeMeta = const VerificationMeta(
    'mimeType',
  );
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
    'mime_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sizeBytesMeta = const VerificationMeta(
    'sizeBytes',
  );
  @override
  late final GeneratedColumn<int> sizeBytes = GeneratedColumn<int>(
    'size_bytes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationSecMeta = const VerificationMeta(
    'durationSec',
  );
  @override
  late final GeneratedColumn<int> durationSec = GeneratedColumn<int>(
    'duration_sec',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _capturedAtMeta = const VerificationMeta(
    'capturedAt',
  );
  @override
  late final GeneratedColumn<DateTime> capturedAt = GeneratedColumn<DateTime>(
    'captured_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<String> syncState = GeneratedColumn<String>(
    'sync_state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local-only'),
  );
  static const VerificationMeta _storageRefMeta = const VerificationMeta(
    'storageRef',
  );
  @override
  late final GeneratedColumn<String> storageRef = GeneratedColumn<String>(
    'storage_ref',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _thumbnailRefMeta = const VerificationMeta(
    'thumbnailRef',
  );
  @override
  late final GeneratedColumn<String> thumbnailRef = GeneratedColumn<String>(
    'thumbnail_ref',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentHashMeta = const VerificationMeta(
    'contentHash',
  );
  @override
  late final GeneratedColumn<String> contentHash = GeneratedColumn<String>(
    'content_hash',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _archivedOnDeviceMeta = const VerificationMeta(
    'archivedOnDevice',
  );
  @override
  late final GeneratedColumn<String> archivedOnDevice = GeneratedColumn<String>(
    'archived_on_device',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _adoptedMeta = const VerificationMeta(
    'adopted',
  );
  @override
  late final GeneratedColumn<bool> adopted = GeneratedColumn<bool>(
    'adopted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("adopted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _blobDataMeta = const VerificationMeta(
    'blobData',
  );
  @override
  late final GeneratedColumn<Uint8List> blobData = GeneratedColumn<Uint8List>(
    'blob_data',
    aliasedName,
    true,
    type: DriftSqlType.blob,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entryId,
    fileName,
    mimeType,
    sizeBytes,
    durationSec,
    title,
    capturedAt,
    syncState,
    storageRef,
    thumbnailRef,
    contentHash,
    archivedOnDevice,
    adopted,
    blobData,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_attachments';
  @override
  VerificationContext validateIntegrity(
    Insertable<MediaAttachmentRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('entry_id')) {
      context.handle(
        _entryIdMeta,
        entryId.isAcceptableOrUnknown(data['entry_id']!, _entryIdMeta),
      );
    }
    if (data.containsKey('file_name')) {
      context.handle(
        _fileNameMeta,
        fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('mime_type')) {
      context.handle(
        _mimeTypeMeta,
        mimeType.isAcceptableOrUnknown(data['mime_type']!, _mimeTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_mimeTypeMeta);
    }
    if (data.containsKey('size_bytes')) {
      context.handle(
        _sizeBytesMeta,
        sizeBytes.isAcceptableOrUnknown(data['size_bytes']!, _sizeBytesMeta),
      );
    } else if (isInserting) {
      context.missing(_sizeBytesMeta);
    }
    if (data.containsKey('duration_sec')) {
      context.handle(
        _durationSecMeta,
        durationSec.isAcceptableOrUnknown(
          data['duration_sec']!,
          _durationSecMeta,
        ),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('captured_at')) {
      context.handle(
        _capturedAtMeta,
        capturedAt.isAcceptableOrUnknown(data['captured_at']!, _capturedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_capturedAtMeta);
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    }
    if (data.containsKey('storage_ref')) {
      context.handle(
        _storageRefMeta,
        storageRef.isAcceptableOrUnknown(data['storage_ref']!, _storageRefMeta),
      );
    }
    if (data.containsKey('thumbnail_ref')) {
      context.handle(
        _thumbnailRefMeta,
        thumbnailRef.isAcceptableOrUnknown(
          data['thumbnail_ref']!,
          _thumbnailRefMeta,
        ),
      );
    }
    if (data.containsKey('content_hash')) {
      context.handle(
        _contentHashMeta,
        contentHash.isAcceptableOrUnknown(
          data['content_hash']!,
          _contentHashMeta,
        ),
      );
    }
    if (data.containsKey('archived_on_device')) {
      context.handle(
        _archivedOnDeviceMeta,
        archivedOnDevice.isAcceptableOrUnknown(
          data['archived_on_device']!,
          _archivedOnDeviceMeta,
        ),
      );
    }
    if (data.containsKey('adopted')) {
      context.handle(
        _adoptedMeta,
        adopted.isAcceptableOrUnknown(data['adopted']!, _adoptedMeta),
      );
    }
    if (data.containsKey('blob_data')) {
      context.handle(
        _blobDataMeta,
        blobData.isAcceptableOrUnknown(data['blob_data']!, _blobDataMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MediaAttachmentRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaAttachmentRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      entryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entry_id'],
      ),
      fileName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_name'],
      )!,
      mimeType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mime_type'],
      )!,
      sizeBytes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}size_bytes'],
      )!,
      durationSec: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_sec'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      capturedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}captured_at'],
      )!,
      syncState: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_state'],
      )!,
      storageRef: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}storage_ref'],
      )!,
      thumbnailRef: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail_ref'],
      ),
      contentHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_hash'],
      ),
      archivedOnDevice: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}archived_on_device'],
      ),
      adopted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}adopted'],
      )!,
      blobData: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}blob_data'],
      ),
    );
  }

  @override
  $MediaAttachmentsTable createAlias(String alias) {
    return $MediaAttachmentsTable(attachedDatabase, alias);
  }
}

class MediaAttachmentRow extends DataClass
    implements Insertable<MediaAttachmentRow> {
  final String id;
  final String? entryId;
  final String fileName;
  final String mimeType;
  final int sizeBytes;
  final int? durationSec;
  final String? title;
  final DateTime capturedAt;
  final String syncState;
  final String storageRef;
  final String? thumbnailRef;
  final String? contentHash;
  final String? archivedOnDevice;
  final bool adopted;
  final Uint8List? blobData;
  const MediaAttachmentRow({
    required this.id,
    this.entryId,
    required this.fileName,
    required this.mimeType,
    required this.sizeBytes,
    this.durationSec,
    this.title,
    required this.capturedAt,
    required this.syncState,
    required this.storageRef,
    this.thumbnailRef,
    this.contentHash,
    this.archivedOnDevice,
    required this.adopted,
    this.blobData,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || entryId != null) {
      map['entry_id'] = Variable<String>(entryId);
    }
    map['file_name'] = Variable<String>(fileName);
    map['mime_type'] = Variable<String>(mimeType);
    map['size_bytes'] = Variable<int>(sizeBytes);
    if (!nullToAbsent || durationSec != null) {
      map['duration_sec'] = Variable<int>(durationSec);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    map['captured_at'] = Variable<DateTime>(capturedAt);
    map['sync_state'] = Variable<String>(syncState);
    map['storage_ref'] = Variable<String>(storageRef);
    if (!nullToAbsent || thumbnailRef != null) {
      map['thumbnail_ref'] = Variable<String>(thumbnailRef);
    }
    if (!nullToAbsent || contentHash != null) {
      map['content_hash'] = Variable<String>(contentHash);
    }
    if (!nullToAbsent || archivedOnDevice != null) {
      map['archived_on_device'] = Variable<String>(archivedOnDevice);
    }
    map['adopted'] = Variable<bool>(adopted);
    if (!nullToAbsent || blobData != null) {
      map['blob_data'] = Variable<Uint8List>(blobData);
    }
    return map;
  }

  MediaAttachmentsCompanion toCompanion(bool nullToAbsent) {
    return MediaAttachmentsCompanion(
      id: Value(id),
      entryId: entryId == null && nullToAbsent
          ? const Value.absent()
          : Value(entryId),
      fileName: Value(fileName),
      mimeType: Value(mimeType),
      sizeBytes: Value(sizeBytes),
      durationSec: durationSec == null && nullToAbsent
          ? const Value.absent()
          : Value(durationSec),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
      capturedAt: Value(capturedAt),
      syncState: Value(syncState),
      storageRef: Value(storageRef),
      thumbnailRef: thumbnailRef == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailRef),
      contentHash: contentHash == null && nullToAbsent
          ? const Value.absent()
          : Value(contentHash),
      archivedOnDevice: archivedOnDevice == null && nullToAbsent
          ? const Value.absent()
          : Value(archivedOnDevice),
      adopted: Value(adopted),
      blobData: blobData == null && nullToAbsent
          ? const Value.absent()
          : Value(blobData),
    );
  }

  factory MediaAttachmentRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaAttachmentRow(
      id: serializer.fromJson<String>(json['id']),
      entryId: serializer.fromJson<String?>(json['entryId']),
      fileName: serializer.fromJson<String>(json['fileName']),
      mimeType: serializer.fromJson<String>(json['mimeType']),
      sizeBytes: serializer.fromJson<int>(json['sizeBytes']),
      durationSec: serializer.fromJson<int?>(json['durationSec']),
      title: serializer.fromJson<String?>(json['title']),
      capturedAt: serializer.fromJson<DateTime>(json['capturedAt']),
      syncState: serializer.fromJson<String>(json['syncState']),
      storageRef: serializer.fromJson<String>(json['storageRef']),
      thumbnailRef: serializer.fromJson<String?>(json['thumbnailRef']),
      contentHash: serializer.fromJson<String?>(json['contentHash']),
      archivedOnDevice: serializer.fromJson<String?>(json['archivedOnDevice']),
      adopted: serializer.fromJson<bool>(json['adopted']),
      blobData: serializer.fromJson<Uint8List?>(json['blobData']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'entryId': serializer.toJson<String?>(entryId),
      'fileName': serializer.toJson<String>(fileName),
      'mimeType': serializer.toJson<String>(mimeType),
      'sizeBytes': serializer.toJson<int>(sizeBytes),
      'durationSec': serializer.toJson<int?>(durationSec),
      'title': serializer.toJson<String?>(title),
      'capturedAt': serializer.toJson<DateTime>(capturedAt),
      'syncState': serializer.toJson<String>(syncState),
      'storageRef': serializer.toJson<String>(storageRef),
      'thumbnailRef': serializer.toJson<String?>(thumbnailRef),
      'contentHash': serializer.toJson<String?>(contentHash),
      'archivedOnDevice': serializer.toJson<String?>(archivedOnDevice),
      'adopted': serializer.toJson<bool>(adopted),
      'blobData': serializer.toJson<Uint8List?>(blobData),
    };
  }

  MediaAttachmentRow copyWith({
    String? id,
    Value<String?> entryId = const Value.absent(),
    String? fileName,
    String? mimeType,
    int? sizeBytes,
    Value<int?> durationSec = const Value.absent(),
    Value<String?> title = const Value.absent(),
    DateTime? capturedAt,
    String? syncState,
    String? storageRef,
    Value<String?> thumbnailRef = const Value.absent(),
    Value<String?> contentHash = const Value.absent(),
    Value<String?> archivedOnDevice = const Value.absent(),
    bool? adopted,
    Value<Uint8List?> blobData = const Value.absent(),
  }) => MediaAttachmentRow(
    id: id ?? this.id,
    entryId: entryId.present ? entryId.value : this.entryId,
    fileName: fileName ?? this.fileName,
    mimeType: mimeType ?? this.mimeType,
    sizeBytes: sizeBytes ?? this.sizeBytes,
    durationSec: durationSec.present ? durationSec.value : this.durationSec,
    title: title.present ? title.value : this.title,
    capturedAt: capturedAt ?? this.capturedAt,
    syncState: syncState ?? this.syncState,
    storageRef: storageRef ?? this.storageRef,
    thumbnailRef: thumbnailRef.present ? thumbnailRef.value : this.thumbnailRef,
    contentHash: contentHash.present ? contentHash.value : this.contentHash,
    archivedOnDevice: archivedOnDevice.present
        ? archivedOnDevice.value
        : this.archivedOnDevice,
    adopted: adopted ?? this.adopted,
    blobData: blobData.present ? blobData.value : this.blobData,
  );
  MediaAttachmentRow copyWithCompanion(MediaAttachmentsCompanion data) {
    return MediaAttachmentRow(
      id: data.id.present ? data.id.value : this.id,
      entryId: data.entryId.present ? data.entryId.value : this.entryId,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      mimeType: data.mimeType.present ? data.mimeType.value : this.mimeType,
      sizeBytes: data.sizeBytes.present ? data.sizeBytes.value : this.sizeBytes,
      durationSec: data.durationSec.present
          ? data.durationSec.value
          : this.durationSec,
      title: data.title.present ? data.title.value : this.title,
      capturedAt: data.capturedAt.present
          ? data.capturedAt.value
          : this.capturedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
      storageRef: data.storageRef.present
          ? data.storageRef.value
          : this.storageRef,
      thumbnailRef: data.thumbnailRef.present
          ? data.thumbnailRef.value
          : this.thumbnailRef,
      contentHash: data.contentHash.present
          ? data.contentHash.value
          : this.contentHash,
      archivedOnDevice: data.archivedOnDevice.present
          ? data.archivedOnDevice.value
          : this.archivedOnDevice,
      adopted: data.adopted.present ? data.adopted.value : this.adopted,
      blobData: data.blobData.present ? data.blobData.value : this.blobData,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaAttachmentRow(')
          ..write('id: $id, ')
          ..write('entryId: $entryId, ')
          ..write('fileName: $fileName, ')
          ..write('mimeType: $mimeType, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('durationSec: $durationSec, ')
          ..write('title: $title, ')
          ..write('capturedAt: $capturedAt, ')
          ..write('syncState: $syncState, ')
          ..write('storageRef: $storageRef, ')
          ..write('thumbnailRef: $thumbnailRef, ')
          ..write('contentHash: $contentHash, ')
          ..write('archivedOnDevice: $archivedOnDevice, ')
          ..write('adopted: $adopted, ')
          ..write('blobData: $blobData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    entryId,
    fileName,
    mimeType,
    sizeBytes,
    durationSec,
    title,
    capturedAt,
    syncState,
    storageRef,
    thumbnailRef,
    contentHash,
    archivedOnDevice,
    adopted,
    $driftBlobEquality.hash(blobData),
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaAttachmentRow &&
          other.id == this.id &&
          other.entryId == this.entryId &&
          other.fileName == this.fileName &&
          other.mimeType == this.mimeType &&
          other.sizeBytes == this.sizeBytes &&
          other.durationSec == this.durationSec &&
          other.title == this.title &&
          other.capturedAt == this.capturedAt &&
          other.syncState == this.syncState &&
          other.storageRef == this.storageRef &&
          other.thumbnailRef == this.thumbnailRef &&
          other.contentHash == this.contentHash &&
          other.archivedOnDevice == this.archivedOnDevice &&
          other.adopted == this.adopted &&
          $driftBlobEquality.equals(other.blobData, this.blobData));
}

class MediaAttachmentsCompanion extends UpdateCompanion<MediaAttachmentRow> {
  final Value<String> id;
  final Value<String?> entryId;
  final Value<String> fileName;
  final Value<String> mimeType;
  final Value<int> sizeBytes;
  final Value<int?> durationSec;
  final Value<String?> title;
  final Value<DateTime> capturedAt;
  final Value<String> syncState;
  final Value<String> storageRef;
  final Value<String?> thumbnailRef;
  final Value<String?> contentHash;
  final Value<String?> archivedOnDevice;
  final Value<bool> adopted;
  final Value<Uint8List?> blobData;
  final Value<int> rowid;
  const MediaAttachmentsCompanion({
    this.id = const Value.absent(),
    this.entryId = const Value.absent(),
    this.fileName = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.sizeBytes = const Value.absent(),
    this.durationSec = const Value.absent(),
    this.title = const Value.absent(),
    this.capturedAt = const Value.absent(),
    this.syncState = const Value.absent(),
    this.storageRef = const Value.absent(),
    this.thumbnailRef = const Value.absent(),
    this.contentHash = const Value.absent(),
    this.archivedOnDevice = const Value.absent(),
    this.adopted = const Value.absent(),
    this.blobData = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MediaAttachmentsCompanion.insert({
    required String id,
    this.entryId = const Value.absent(),
    required String fileName,
    required String mimeType,
    required int sizeBytes,
    this.durationSec = const Value.absent(),
    this.title = const Value.absent(),
    required DateTime capturedAt,
    this.syncState = const Value.absent(),
    this.storageRef = const Value.absent(),
    this.thumbnailRef = const Value.absent(),
    this.contentHash = const Value.absent(),
    this.archivedOnDevice = const Value.absent(),
    this.adopted = const Value.absent(),
    this.blobData = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       fileName = Value(fileName),
       mimeType = Value(mimeType),
       sizeBytes = Value(sizeBytes),
       capturedAt = Value(capturedAt);
  static Insertable<MediaAttachmentRow> custom({
    Expression<String>? id,
    Expression<String>? entryId,
    Expression<String>? fileName,
    Expression<String>? mimeType,
    Expression<int>? sizeBytes,
    Expression<int>? durationSec,
    Expression<String>? title,
    Expression<DateTime>? capturedAt,
    Expression<String>? syncState,
    Expression<String>? storageRef,
    Expression<String>? thumbnailRef,
    Expression<String>? contentHash,
    Expression<String>? archivedOnDevice,
    Expression<bool>? adopted,
    Expression<Uint8List>? blobData,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entryId != null) 'entry_id': entryId,
      if (fileName != null) 'file_name': fileName,
      if (mimeType != null) 'mime_type': mimeType,
      if (sizeBytes != null) 'size_bytes': sizeBytes,
      if (durationSec != null) 'duration_sec': durationSec,
      if (title != null) 'title': title,
      if (capturedAt != null) 'captured_at': capturedAt,
      if (syncState != null) 'sync_state': syncState,
      if (storageRef != null) 'storage_ref': storageRef,
      if (thumbnailRef != null) 'thumbnail_ref': thumbnailRef,
      if (contentHash != null) 'content_hash': contentHash,
      if (archivedOnDevice != null) 'archived_on_device': archivedOnDevice,
      if (adopted != null) 'adopted': adopted,
      if (blobData != null) 'blob_data': blobData,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MediaAttachmentsCompanion copyWith({
    Value<String>? id,
    Value<String?>? entryId,
    Value<String>? fileName,
    Value<String>? mimeType,
    Value<int>? sizeBytes,
    Value<int?>? durationSec,
    Value<String?>? title,
    Value<DateTime>? capturedAt,
    Value<String>? syncState,
    Value<String>? storageRef,
    Value<String?>? thumbnailRef,
    Value<String?>? contentHash,
    Value<String?>? archivedOnDevice,
    Value<bool>? adopted,
    Value<Uint8List?>? blobData,
    Value<int>? rowid,
  }) {
    return MediaAttachmentsCompanion(
      id: id ?? this.id,
      entryId: entryId ?? this.entryId,
      fileName: fileName ?? this.fileName,
      mimeType: mimeType ?? this.mimeType,
      sizeBytes: sizeBytes ?? this.sizeBytes,
      durationSec: durationSec ?? this.durationSec,
      title: title ?? this.title,
      capturedAt: capturedAt ?? this.capturedAt,
      syncState: syncState ?? this.syncState,
      storageRef: storageRef ?? this.storageRef,
      thumbnailRef: thumbnailRef ?? this.thumbnailRef,
      contentHash: contentHash ?? this.contentHash,
      archivedOnDevice: archivedOnDevice ?? this.archivedOnDevice,
      adopted: adopted ?? this.adopted,
      blobData: blobData ?? this.blobData,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (entryId.present) {
      map['entry_id'] = Variable<String>(entryId.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (mimeType.present) {
      map['mime_type'] = Variable<String>(mimeType.value);
    }
    if (sizeBytes.present) {
      map['size_bytes'] = Variable<int>(sizeBytes.value);
    }
    if (durationSec.present) {
      map['duration_sec'] = Variable<int>(durationSec.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (capturedAt.present) {
      map['captured_at'] = Variable<DateTime>(capturedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<String>(syncState.value);
    }
    if (storageRef.present) {
      map['storage_ref'] = Variable<String>(storageRef.value);
    }
    if (thumbnailRef.present) {
      map['thumbnail_ref'] = Variable<String>(thumbnailRef.value);
    }
    if (contentHash.present) {
      map['content_hash'] = Variable<String>(contentHash.value);
    }
    if (archivedOnDevice.present) {
      map['archived_on_device'] = Variable<String>(archivedOnDevice.value);
    }
    if (adopted.present) {
      map['adopted'] = Variable<bool>(adopted.value);
    }
    if (blobData.present) {
      map['blob_data'] = Variable<Uint8List>(blobData.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaAttachmentsCompanion(')
          ..write('id: $id, ')
          ..write('entryId: $entryId, ')
          ..write('fileName: $fileName, ')
          ..write('mimeType: $mimeType, ')
          ..write('sizeBytes: $sizeBytes, ')
          ..write('durationSec: $durationSec, ')
          ..write('title: $title, ')
          ..write('capturedAt: $capturedAt, ')
          ..write('syncState: $syncState, ')
          ..write('storageRef: $storageRef, ')
          ..write('thumbnailRef: $thumbnailRef, ')
          ..write('contentHash: $contentHash, ')
          ..write('archivedOnDevice: $archivedOnDevice, ')
          ..write('adopted: $adopted, ')
          ..write('blobData: $blobData, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HabitsTable extends Habits with TableInfo<$HabitsTable, HabitRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _areaMeta = const VerificationMeta('area');
  @override
  late final GeneratedColumn<String> area = GeneratedColumn<String>(
    'area',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, area, createdAt, active];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habits';
  @override
  VerificationContext validateIntegrity(
    Insertable<HabitRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('area')) {
      context.handle(
        _areaMeta,
        area.isAcceptableOrUnknown(data['area']!, _areaMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HabitRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      area: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}area'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
    );
  }

  @override
  $HabitsTable createAlias(String alias) {
    return $HabitsTable(attachedDatabase, alias);
  }
}

class HabitRow extends DataClass implements Insertable<HabitRow> {
  final String id;
  final String name;
  final String? area;
  final DateTime createdAt;
  final bool active;
  const HabitRow({
    required this.id,
    required this.name,
    this.area,
    required this.createdAt,
    required this.active,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || area != null) {
      map['area'] = Variable<String>(area);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['active'] = Variable<bool>(active);
    return map;
  }

  HabitsCompanion toCompanion(bool nullToAbsent) {
    return HabitsCompanion(
      id: Value(id),
      name: Value(name),
      area: area == null && nullToAbsent ? const Value.absent() : Value(area),
      createdAt: Value(createdAt),
      active: Value(active),
    );
  }

  factory HabitRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      area: serializer.fromJson<String?>(json['area']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'area': serializer.toJson<String?>(area),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'active': serializer.toJson<bool>(active),
    };
  }

  HabitRow copyWith({
    String? id,
    String? name,
    Value<String?> area = const Value.absent(),
    DateTime? createdAt,
    bool? active,
  }) => HabitRow(
    id: id ?? this.id,
    name: name ?? this.name,
    area: area.present ? area.value : this.area,
    createdAt: createdAt ?? this.createdAt,
    active: active ?? this.active,
  );
  HabitRow copyWithCompanion(HabitsCompanion data) {
    return HabitRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      area: data.area.present ? data.area.value : this.area,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      active: data.active.present ? data.active.value : this.active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('area: $area, ')
          ..write('createdAt: $createdAt, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, area, createdAt, active);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.area == this.area &&
          other.createdAt == this.createdAt &&
          other.active == this.active);
}

class HabitsCompanion extends UpdateCompanion<HabitRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> area;
  final Value<DateTime> createdAt;
  final Value<bool> active;
  final Value<int> rowid;
  const HabitsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.area = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.active = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HabitsCompanion.insert({
    required String id,
    required String name,
    this.area = const Value.absent(),
    required DateTime createdAt,
    this.active = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<HabitRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? area,
    Expression<DateTime>? createdAt,
    Expression<bool>? active,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (area != null) 'area': area,
      if (createdAt != null) 'created_at': createdAt,
      if (active != null) 'active': active,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HabitsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? area,
    Value<DateTime>? createdAt,
    Value<bool>? active,
    Value<int>? rowid,
  }) {
    return HabitsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      area: area ?? this.area,
      createdAt: createdAt ?? this.createdAt,
      active: active ?? this.active,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (area.present) {
      map['area'] = Variable<String>(area.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('area: $area, ')
          ..write('createdAt: $createdAt, ')
          ..write('active: $active, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HabitCheckinsTable extends HabitCheckins
    with TableInfo<$HabitCheckinsTable, HabitCheckinRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitCheckinsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _habitIdMeta = const VerificationMeta(
    'habitId',
  );
  @override
  late final GeneratedColumn<String> habitId = GeneratedColumn<String>(
    'habit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES habits (id)',
    ),
  );
  static const VerificationMeta _dayKeyMeta = const VerificationMeta('dayKey');
  @override
  late final GeneratedColumn<String> dayKey = GeneratedColumn<String>(
    'day_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    habitId,
    dayKey,
    completedAt,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habit_checkins';
  @override
  VerificationContext validateIntegrity(
    Insertable<HabitCheckinRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('habit_id')) {
      context.handle(
        _habitIdMeta,
        habitId.isAcceptableOrUnknown(data['habit_id']!, _habitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_habitIdMeta);
    }
    if (data.containsKey('day_key')) {
      context.handle(
        _dayKeyMeta,
        dayKey.isAcceptableOrUnknown(data['day_key']!, _dayKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_dayKeyMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completedAtMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {habitId, dayKey},
  ];
  @override
  HabitCheckinRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitCheckinRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      habitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}habit_id'],
      )!,
      dayKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}day_key'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $HabitCheckinsTable createAlias(String alias) {
    return $HabitCheckinsTable(attachedDatabase, alias);
  }
}

class HabitCheckinRow extends DataClass implements Insertable<HabitCheckinRow> {
  final String id;
  final String habitId;
  final String dayKey;
  final DateTime completedAt;
  final String? note;
  const HabitCheckinRow({
    required this.id,
    required this.habitId,
    required this.dayKey,
    required this.completedAt,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['habit_id'] = Variable<String>(habitId);
    map['day_key'] = Variable<String>(dayKey);
    map['completed_at'] = Variable<DateTime>(completedAt);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  HabitCheckinsCompanion toCompanion(bool nullToAbsent) {
    return HabitCheckinsCompanion(
      id: Value(id),
      habitId: Value(habitId),
      dayKey: Value(dayKey),
      completedAt: Value(completedAt),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory HabitCheckinRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitCheckinRow(
      id: serializer.fromJson<String>(json['id']),
      habitId: serializer.fromJson<String>(json['habitId']),
      dayKey: serializer.fromJson<String>(json['dayKey']),
      completedAt: serializer.fromJson<DateTime>(json['completedAt']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'habitId': serializer.toJson<String>(habitId),
      'dayKey': serializer.toJson<String>(dayKey),
      'completedAt': serializer.toJson<DateTime>(completedAt),
      'note': serializer.toJson<String?>(note),
    };
  }

  HabitCheckinRow copyWith({
    String? id,
    String? habitId,
    String? dayKey,
    DateTime? completedAt,
    Value<String?> note = const Value.absent(),
  }) => HabitCheckinRow(
    id: id ?? this.id,
    habitId: habitId ?? this.habitId,
    dayKey: dayKey ?? this.dayKey,
    completedAt: completedAt ?? this.completedAt,
    note: note.present ? note.value : this.note,
  );
  HabitCheckinRow copyWithCompanion(HabitCheckinsCompanion data) {
    return HabitCheckinRow(
      id: data.id.present ? data.id.value : this.id,
      habitId: data.habitId.present ? data.habitId.value : this.habitId,
      dayKey: data.dayKey.present ? data.dayKey.value : this.dayKey,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitCheckinRow(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('dayKey: $dayKey, ')
          ..write('completedAt: $completedAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, habitId, dayKey, completedAt, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitCheckinRow &&
          other.id == this.id &&
          other.habitId == this.habitId &&
          other.dayKey == this.dayKey &&
          other.completedAt == this.completedAt &&
          other.note == this.note);
}

class HabitCheckinsCompanion extends UpdateCompanion<HabitCheckinRow> {
  final Value<String> id;
  final Value<String> habitId;
  final Value<String> dayKey;
  final Value<DateTime> completedAt;
  final Value<String?> note;
  final Value<int> rowid;
  const HabitCheckinsCompanion({
    this.id = const Value.absent(),
    this.habitId = const Value.absent(),
    this.dayKey = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HabitCheckinsCompanion.insert({
    required String id,
    required String habitId,
    required String dayKey,
    required DateTime completedAt,
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       habitId = Value(habitId),
       dayKey = Value(dayKey),
       completedAt = Value(completedAt);
  static Insertable<HabitCheckinRow> custom({
    Expression<String>? id,
    Expression<String>? habitId,
    Expression<String>? dayKey,
    Expression<DateTime>? completedAt,
    Expression<String>? note,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (habitId != null) 'habit_id': habitId,
      if (dayKey != null) 'day_key': dayKey,
      if (completedAt != null) 'completed_at': completedAt,
      if (note != null) 'note': note,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HabitCheckinsCompanion copyWith({
    Value<String>? id,
    Value<String>? habitId,
    Value<String>? dayKey,
    Value<DateTime>? completedAt,
    Value<String?>? note,
    Value<int>? rowid,
  }) {
    return HabitCheckinsCompanion(
      id: id ?? this.id,
      habitId: habitId ?? this.habitId,
      dayKey: dayKey ?? this.dayKey,
      completedAt: completedAt ?? this.completedAt,
      note: note ?? this.note,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (habitId.present) {
      map['habit_id'] = Variable<String>(habitId.value);
    }
    if (dayKey.present) {
      map['day_key'] = Variable<String>(dayKey.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitCheckinsCompanion(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('dayKey: $dayKey, ')
          ..write('completedAt: $completedAt, ')
          ..write('note: $note, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AreasTable extends Areas with TableInfo<$AreasTable, Area> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AreasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userDefinedMeta = const VerificationMeta(
    'userDefined',
  );
  @override
  late final GeneratedColumn<bool> userDefined = GeneratedColumn<bool>(
    'user_defined',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("user_defined" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, label, userDefined];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'areas';
  @override
  VerificationContext validateIntegrity(
    Insertable<Area> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('user_defined')) {
      context.handle(
        _userDefinedMeta,
        userDefined.isAcceptableOrUnknown(
          data['user_defined']!,
          _userDefinedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Area map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Area(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      userDefined: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}user_defined'],
      )!,
    );
  }

  @override
  $AreasTable createAlias(String alias) {
    return $AreasTable(attachedDatabase, alias);
  }
}

class Area extends DataClass implements Insertable<Area> {
  final String id;
  final String label;
  final bool userDefined;
  const Area({
    required this.id,
    required this.label,
    required this.userDefined,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['label'] = Variable<String>(label);
    map['user_defined'] = Variable<bool>(userDefined);
    return map;
  }

  AreasCompanion toCompanion(bool nullToAbsent) {
    return AreasCompanion(
      id: Value(id),
      label: Value(label),
      userDefined: Value(userDefined),
    );
  }

  factory Area.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Area(
      id: serializer.fromJson<String>(json['id']),
      label: serializer.fromJson<String>(json['label']),
      userDefined: serializer.fromJson<bool>(json['userDefined']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'label': serializer.toJson<String>(label),
      'userDefined': serializer.toJson<bool>(userDefined),
    };
  }

  Area copyWith({String? id, String? label, bool? userDefined}) => Area(
    id: id ?? this.id,
    label: label ?? this.label,
    userDefined: userDefined ?? this.userDefined,
  );
  Area copyWithCompanion(AreasCompanion data) {
    return Area(
      id: data.id.present ? data.id.value : this.id,
      label: data.label.present ? data.label.value : this.label,
      userDefined: data.userDefined.present
          ? data.userDefined.value
          : this.userDefined,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Area(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('userDefined: $userDefined')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, label, userDefined);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Area &&
          other.id == this.id &&
          other.label == this.label &&
          other.userDefined == this.userDefined);
}

class AreasCompanion extends UpdateCompanion<Area> {
  final Value<String> id;
  final Value<String> label;
  final Value<bool> userDefined;
  final Value<int> rowid;
  const AreasCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
    this.userDefined = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AreasCompanion.insert({
    required String id,
    required String label,
    this.userDefined = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       label = Value(label);
  static Insertable<Area> custom({
    Expression<String>? id,
    Expression<String>? label,
    Expression<bool>? userDefined,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
      if (userDefined != null) 'user_defined': userDefined,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AreasCompanion copyWith({
    Value<String>? id,
    Value<String>? label,
    Value<bool>? userDefined,
    Value<int>? rowid,
  }) {
    return AreasCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
      userDefined: userDefined ?? this.userDefined,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (userDefined.present) {
      map['user_defined'] = Variable<bool>(userDefined.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AreasCompanion(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('userDefined: $userDefined, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Setting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final String key;
  final String value;
  const Setting({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(key: Value(key), value: Value(value));
  }

  factory Setting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  Setting copyWith({String? key, String? value}) =>
      Setting(key: key ?? this.key, value: value ?? this.value);
  Setting copyWithCompanion(SettingsCompanion data) {
    return Setting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting && other.key == this.key && other.value == this.value);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const SettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<Setting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return SettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EventsTable extends Events with TableInfo<$EventsTable, EventRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _occurredAtMeta = const VerificationMeta(
    'occurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dayKeyMeta = const VerificationMeta('dayKey');
  @override
  late final GeneratedColumn<String> dayKey = GeneratedColumn<String>(
    'day_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _areaMeta = const VerificationMeta('area');
  @override
  late final GeneratedColumn<String> area = GeneratedColumn<String>(
    'area',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadVersionMeta = const VerificationMeta(
    'payloadVersion',
  );
  @override
  late final GeneratedColumn<int> payloadVersion = GeneratedColumn<int>(
    'payload_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _supersedesIdMeta = const VerificationMeta(
    'supersedesId',
  );
  @override
  late final GeneratedColumn<String> supersedesId = GeneratedColumn<String>(
    'supersedes_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    type,
    occurredAt,
    dayKey,
    area,
    entityType,
    entityId,
    payloadVersion,
    payload,
    supersedesId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'events';
  @override
  VerificationContext validateIntegrity(
    Insertable<EventRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
        _occurredAtMeta,
        occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    if (data.containsKey('day_key')) {
      context.handle(
        _dayKeyMeta,
        dayKey.isAcceptableOrUnknown(data['day_key']!, _dayKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_dayKeyMeta);
    }
    if (data.containsKey('area')) {
      context.handle(
        _areaMeta,
        area.isAcceptableOrUnknown(data['area']!, _areaMeta),
      );
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('payload_version')) {
      context.handle(
        _payloadVersionMeta,
        payloadVersion.isAcceptableOrUnknown(
          data['payload_version']!,
          _payloadVersionMeta,
        ),
      );
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('supersedes_id')) {
      context.handle(
        _supersedesIdMeta,
        supersedesId.isAcceptableOrUnknown(
          data['supersedes_id']!,
          _supersedesIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EventRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      occurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}occurred_at'],
      )!,
      dayKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}day_key'],
      )!,
      area: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}area'],
      ),
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      payloadVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}payload_version'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      supersedesId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}supersedes_id'],
      ),
    );
  }

  @override
  $EventsTable createAlias(String alias) {
    return $EventsTable(attachedDatabase, alias);
  }
}

class EventRow extends DataClass implements Insertable<EventRow> {
  final String id;
  final String type;
  final DateTime occurredAt;
  final String dayKey;
  final String? area;
  final String entityType;
  final String entityId;
  final int payloadVersion;
  final String payload;
  final String? supersedesId;
  const EventRow({
    required this.id,
    required this.type,
    required this.occurredAt,
    required this.dayKey,
    this.area,
    required this.entityType,
    required this.entityId,
    required this.payloadVersion,
    required this.payload,
    this.supersedesId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['type'] = Variable<String>(type);
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    map['day_key'] = Variable<String>(dayKey);
    if (!nullToAbsent || area != null) {
      map['area'] = Variable<String>(area);
    }
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['payload_version'] = Variable<int>(payloadVersion);
    map['payload'] = Variable<String>(payload);
    if (!nullToAbsent || supersedesId != null) {
      map['supersedes_id'] = Variable<String>(supersedesId);
    }
    return map;
  }

  EventsCompanion toCompanion(bool nullToAbsent) {
    return EventsCompanion(
      id: Value(id),
      type: Value(type),
      occurredAt: Value(occurredAt),
      dayKey: Value(dayKey),
      area: area == null && nullToAbsent ? const Value.absent() : Value(area),
      entityType: Value(entityType),
      entityId: Value(entityId),
      payloadVersion: Value(payloadVersion),
      payload: Value(payload),
      supersedesId: supersedesId == null && nullToAbsent
          ? const Value.absent()
          : Value(supersedesId),
    );
  }

  factory EventRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventRow(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
      dayKey: serializer.fromJson<String>(json['dayKey']),
      area: serializer.fromJson<String?>(json['area']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      payloadVersion: serializer.fromJson<int>(json['payloadVersion']),
      payload: serializer.fromJson<String>(json['payload']),
      supersedesId: serializer.fromJson<String?>(json['supersedesId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(type),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
      'dayKey': serializer.toJson<String>(dayKey),
      'area': serializer.toJson<String?>(area),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'payloadVersion': serializer.toJson<int>(payloadVersion),
      'payload': serializer.toJson<String>(payload),
      'supersedesId': serializer.toJson<String?>(supersedesId),
    };
  }

  EventRow copyWith({
    String? id,
    String? type,
    DateTime? occurredAt,
    String? dayKey,
    Value<String?> area = const Value.absent(),
    String? entityType,
    String? entityId,
    int? payloadVersion,
    String? payload,
    Value<String?> supersedesId = const Value.absent(),
  }) => EventRow(
    id: id ?? this.id,
    type: type ?? this.type,
    occurredAt: occurredAt ?? this.occurredAt,
    dayKey: dayKey ?? this.dayKey,
    area: area.present ? area.value : this.area,
    entityType: entityType ?? this.entityType,
    entityId: entityId ?? this.entityId,
    payloadVersion: payloadVersion ?? this.payloadVersion,
    payload: payload ?? this.payload,
    supersedesId: supersedesId.present ? supersedesId.value : this.supersedesId,
  );
  EventRow copyWithCompanion(EventsCompanion data) {
    return EventRow(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      occurredAt: data.occurredAt.present
          ? data.occurredAt.value
          : this.occurredAt,
      dayKey: data.dayKey.present ? data.dayKey.value : this.dayKey,
      area: data.area.present ? data.area.value : this.area,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      payloadVersion: data.payloadVersion.present
          ? data.payloadVersion.value
          : this.payloadVersion,
      payload: data.payload.present ? data.payload.value : this.payload,
      supersedesId: data.supersedesId.present
          ? data.supersedesId.value
          : this.supersedesId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventRow(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('dayKey: $dayKey, ')
          ..write('area: $area, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('payloadVersion: $payloadVersion, ')
          ..write('payload: $payload, ')
          ..write('supersedesId: $supersedesId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    type,
    occurredAt,
    dayKey,
    area,
    entityType,
    entityId,
    payloadVersion,
    payload,
    supersedesId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventRow &&
          other.id == this.id &&
          other.type == this.type &&
          other.occurredAt == this.occurredAt &&
          other.dayKey == this.dayKey &&
          other.area == this.area &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.payloadVersion == this.payloadVersion &&
          other.payload == this.payload &&
          other.supersedesId == this.supersedesId);
}

class EventsCompanion extends UpdateCompanion<EventRow> {
  final Value<String> id;
  final Value<String> type;
  final Value<DateTime> occurredAt;
  final Value<String> dayKey;
  final Value<String?> area;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<int> payloadVersion;
  final Value<String> payload;
  final Value<String?> supersedesId;
  final Value<int> rowid;
  const EventsCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.dayKey = const Value.absent(),
    this.area = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.payloadVersion = const Value.absent(),
    this.payload = const Value.absent(),
    this.supersedesId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventsCompanion.insert({
    required String id,
    required String type,
    required DateTime occurredAt,
    required String dayKey,
    this.area = const Value.absent(),
    required String entityType,
    required String entityId,
    this.payloadVersion = const Value.absent(),
    required String payload,
    this.supersedesId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       type = Value(type),
       occurredAt = Value(occurredAt),
       dayKey = Value(dayKey),
       entityType = Value(entityType),
       entityId = Value(entityId),
       payload = Value(payload);
  static Insertable<EventRow> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<DateTime>? occurredAt,
    Expression<String>? dayKey,
    Expression<String>? area,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<int>? payloadVersion,
    Expression<String>? payload,
    Expression<String>? supersedesId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (dayKey != null) 'day_key': dayKey,
      if (area != null) 'area': area,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (payloadVersion != null) 'payload_version': payloadVersion,
      if (payload != null) 'payload': payload,
      if (supersedesId != null) 'supersedes_id': supersedesId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventsCompanion copyWith({
    Value<String>? id,
    Value<String>? type,
    Value<DateTime>? occurredAt,
    Value<String>? dayKey,
    Value<String?>? area,
    Value<String>? entityType,
    Value<String>? entityId,
    Value<int>? payloadVersion,
    Value<String>? payload,
    Value<String?>? supersedesId,
    Value<int>? rowid,
  }) {
    return EventsCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      occurredAt: occurredAt ?? this.occurredAt,
      dayKey: dayKey ?? this.dayKey,
      area: area ?? this.area,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      payloadVersion: payloadVersion ?? this.payloadVersion,
      payload: payload ?? this.payload,
      supersedesId: supersedesId ?? this.supersedesId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (dayKey.present) {
      map['day_key'] = Variable<String>(dayKey.value);
    }
    if (area.present) {
      map['area'] = Variable<String>(area.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (payloadVersion.present) {
      map['payload_version'] = Variable<int>(payloadVersion.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (supersedesId.present) {
      map['supersedes_id'] = Variable<String>(supersedesId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('dayKey: $dayKey, ')
          ..write('area: $area, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('payloadVersion: $payloadVersion, ')
          ..write('payload: $payload, ')
          ..write('supersedesId: $supersedesId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CoachOutputsTable extends CoachOutputs
    with TableInfo<$CoachOutputsTable, CoachOutputRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CoachOutputsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateKeyMeta = const VerificationMeta(
    'dateKey',
  );
  @override
  late final GeneratedColumn<String> dateKey = GeneratedColumn<String>(
    'date_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, kind, dateKey, payload];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'coach_outputs';
  @override
  VerificationContext validateIntegrity(
    Insertable<CoachOutputRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('date_key')) {
      context.handle(
        _dateKeyMeta,
        dateKey.isAcceptableOrUnknown(data['date_key']!, _dateKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_dateKeyMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CoachOutputRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CoachOutputRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      dateKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date_key'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
    );
  }

  @override
  $CoachOutputsTable createAlias(String alias) {
    return $CoachOutputsTable(attachedDatabase, alias);
  }
}

class CoachOutputRow extends DataClass implements Insertable<CoachOutputRow> {
  final String id;
  final String kind;
  final String dateKey;
  final String payload;
  const CoachOutputRow({
    required this.id,
    required this.kind,
    required this.dateKey,
    required this.payload,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['kind'] = Variable<String>(kind);
    map['date_key'] = Variable<String>(dateKey);
    map['payload'] = Variable<String>(payload);
    return map;
  }

  CoachOutputsCompanion toCompanion(bool nullToAbsent) {
    return CoachOutputsCompanion(
      id: Value(id),
      kind: Value(kind),
      dateKey: Value(dateKey),
      payload: Value(payload),
    );
  }

  factory CoachOutputRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CoachOutputRow(
      id: serializer.fromJson<String>(json['id']),
      kind: serializer.fromJson<String>(json['kind']),
      dateKey: serializer.fromJson<String>(json['dateKey']),
      payload: serializer.fromJson<String>(json['payload']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'kind': serializer.toJson<String>(kind),
      'dateKey': serializer.toJson<String>(dateKey),
      'payload': serializer.toJson<String>(payload),
    };
  }

  CoachOutputRow copyWith({
    String? id,
    String? kind,
    String? dateKey,
    String? payload,
  }) => CoachOutputRow(
    id: id ?? this.id,
    kind: kind ?? this.kind,
    dateKey: dateKey ?? this.dateKey,
    payload: payload ?? this.payload,
  );
  CoachOutputRow copyWithCompanion(CoachOutputsCompanion data) {
    return CoachOutputRow(
      id: data.id.present ? data.id.value : this.id,
      kind: data.kind.present ? data.kind.value : this.kind,
      dateKey: data.dateKey.present ? data.dateKey.value : this.dateKey,
      payload: data.payload.present ? data.payload.value : this.payload,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CoachOutputRow(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('dateKey: $dateKey, ')
          ..write('payload: $payload')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, kind, dateKey, payload);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CoachOutputRow &&
          other.id == this.id &&
          other.kind == this.kind &&
          other.dateKey == this.dateKey &&
          other.payload == this.payload);
}

class CoachOutputsCompanion extends UpdateCompanion<CoachOutputRow> {
  final Value<String> id;
  final Value<String> kind;
  final Value<String> dateKey;
  final Value<String> payload;
  final Value<int> rowid;
  const CoachOutputsCompanion({
    this.id = const Value.absent(),
    this.kind = const Value.absent(),
    this.dateKey = const Value.absent(),
    this.payload = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CoachOutputsCompanion.insert({
    required String id,
    required String kind,
    required String dateKey,
    required String payload,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       kind = Value(kind),
       dateKey = Value(dateKey),
       payload = Value(payload);
  static Insertable<CoachOutputRow> custom({
    Expression<String>? id,
    Expression<String>? kind,
    Expression<String>? dateKey,
    Expression<String>? payload,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kind != null) 'kind': kind,
      if (dateKey != null) 'date_key': dateKey,
      if (payload != null) 'payload': payload,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CoachOutputsCompanion copyWith({
    Value<String>? id,
    Value<String>? kind,
    Value<String>? dateKey,
    Value<String>? payload,
    Value<int>? rowid,
  }) {
    return CoachOutputsCompanion(
      id: id ?? this.id,
      kind: kind ?? this.kind,
      dateKey: dateKey ?? this.dateKey,
      payload: payload ?? this.payload,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (dateKey.present) {
      map['date_key'] = Variable<String>(dateKey.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CoachOutputsCompanion(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('dateKey: $dateKey, ')
          ..write('payload: $payload, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MediaManifestTable extends MediaManifest
    with TableInfo<$MediaManifestTable, MediaManifestData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediaManifestTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mediaIdMeta = const VerificationMeta(
    'mediaId',
  );
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
    'media_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sha256Meta = const VerificationMeta('sha256');
  @override
  late final GeneratedColumn<String> sha256 = GeneratedColumn<String>(
    'sha256',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _exportedInMeta = const VerificationMeta(
    'exportedIn',
  );
  @override
  late final GeneratedColumn<bool> exportedIn = GeneratedColumn<bool>(
    'exported_in',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("exported_in" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, mediaId, sha256, exportedIn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_manifest';
  @override
  VerificationContext validateIntegrity(
    Insertable<MediaManifestData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('media_id')) {
      context.handle(
        _mediaIdMeta,
        mediaId.isAcceptableOrUnknown(data['media_id']!, _mediaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    if (data.containsKey('sha256')) {
      context.handle(
        _sha256Meta,
        sha256.isAcceptableOrUnknown(data['sha256']!, _sha256Meta),
      );
    }
    if (data.containsKey('exported_in')) {
      context.handle(
        _exportedInMeta,
        exportedIn.isAcceptableOrUnknown(data['exported_in']!, _exportedInMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MediaManifestData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaManifestData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      mediaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}media_id'],
      )!,
      sha256: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sha256'],
      ),
      exportedIn: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}exported_in'],
      )!,
    );
  }

  @override
  $MediaManifestTable createAlias(String alias) {
    return $MediaManifestTable(attachedDatabase, alias);
  }
}

class MediaManifestData extends DataClass
    implements Insertable<MediaManifestData> {
  final String id;
  final String mediaId;
  final String? sha256;
  final bool exportedIn;
  const MediaManifestData({
    required this.id,
    required this.mediaId,
    this.sha256,
    required this.exportedIn,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['media_id'] = Variable<String>(mediaId);
    if (!nullToAbsent || sha256 != null) {
      map['sha256'] = Variable<String>(sha256);
    }
    map['exported_in'] = Variable<bool>(exportedIn);
    return map;
  }

  MediaManifestCompanion toCompanion(bool nullToAbsent) {
    return MediaManifestCompanion(
      id: Value(id),
      mediaId: Value(mediaId),
      sha256: sha256 == null && nullToAbsent
          ? const Value.absent()
          : Value(sha256),
      exportedIn: Value(exportedIn),
    );
  }

  factory MediaManifestData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaManifestData(
      id: serializer.fromJson<String>(json['id']),
      mediaId: serializer.fromJson<String>(json['mediaId']),
      sha256: serializer.fromJson<String?>(json['sha256']),
      exportedIn: serializer.fromJson<bool>(json['exportedIn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'mediaId': serializer.toJson<String>(mediaId),
      'sha256': serializer.toJson<String?>(sha256),
      'exportedIn': serializer.toJson<bool>(exportedIn),
    };
  }

  MediaManifestData copyWith({
    String? id,
    String? mediaId,
    Value<String?> sha256 = const Value.absent(),
    bool? exportedIn,
  }) => MediaManifestData(
    id: id ?? this.id,
    mediaId: mediaId ?? this.mediaId,
    sha256: sha256.present ? sha256.value : this.sha256,
    exportedIn: exportedIn ?? this.exportedIn,
  );
  MediaManifestData copyWithCompanion(MediaManifestCompanion data) {
    return MediaManifestData(
      id: data.id.present ? data.id.value : this.id,
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      sha256: data.sha256.present ? data.sha256.value : this.sha256,
      exportedIn: data.exportedIn.present
          ? data.exportedIn.value
          : this.exportedIn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaManifestData(')
          ..write('id: $id, ')
          ..write('mediaId: $mediaId, ')
          ..write('sha256: $sha256, ')
          ..write('exportedIn: $exportedIn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, mediaId, sha256, exportedIn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaManifestData &&
          other.id == this.id &&
          other.mediaId == this.mediaId &&
          other.sha256 == this.sha256 &&
          other.exportedIn == this.exportedIn);
}

class MediaManifestCompanion extends UpdateCompanion<MediaManifestData> {
  final Value<String> id;
  final Value<String> mediaId;
  final Value<String?> sha256;
  final Value<bool> exportedIn;
  final Value<int> rowid;
  const MediaManifestCompanion({
    this.id = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.sha256 = const Value.absent(),
    this.exportedIn = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MediaManifestCompanion.insert({
    required String id,
    required String mediaId,
    this.sha256 = const Value.absent(),
    this.exportedIn = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       mediaId = Value(mediaId);
  static Insertable<MediaManifestData> custom({
    Expression<String>? id,
    Expression<String>? mediaId,
    Expression<String>? sha256,
    Expression<bool>? exportedIn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mediaId != null) 'media_id': mediaId,
      if (sha256 != null) 'sha256': sha256,
      if (exportedIn != null) 'exported_in': exportedIn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MediaManifestCompanion copyWith({
    Value<String>? id,
    Value<String>? mediaId,
    Value<String?>? sha256,
    Value<bool>? exportedIn,
    Value<int>? rowid,
  }) {
    return MediaManifestCompanion(
      id: id ?? this.id,
      mediaId: mediaId ?? this.mediaId,
      sha256: sha256 ?? this.sha256,
      exportedIn: exportedIn ?? this.exportedIn,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (mediaId.present) {
      map['media_id'] = Variable<String>(mediaId.value);
    }
    if (sha256.present) {
      map['sha256'] = Variable<String>(sha256.value);
    }
    if (exportedIn.present) {
      map['exported_in'] = Variable<bool>(exportedIn.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaManifestCompanion(')
          ..write('id: $id, ')
          ..write('mediaId: $mediaId, ')
          ..write('sha256: $sha256, ')
          ..write('exportedIn: $exportedIn, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $JournalEntriesTable journalEntries = $JournalEntriesTable(this);
  late final $MediaAttachmentsTable mediaAttachments = $MediaAttachmentsTable(
    this,
  );
  late final $HabitsTable habits = $HabitsTable(this);
  late final $HabitCheckinsTable habitCheckins = $HabitCheckinsTable(this);
  late final $AreasTable areas = $AreasTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $EventsTable events = $EventsTable(this);
  late final $CoachOutputsTable coachOutputs = $CoachOutputsTable(this);
  late final $MediaManifestTable mediaManifest = $MediaManifestTable(this);
  late final Index idxEventsTypeDay = Index(
    'idx_events_type_day',
    'CREATE INDEX idx_events_type_day ON events (type, day_key)',
  );
  late final Index idxEventsAreaDay = Index(
    'idx_events_area_day',
    'CREATE INDEX idx_events_area_day ON events (area, day_key)',
  );
  late final Index idxEventsEntity = Index(
    'idx_events_entity',
    'CREATE INDEX idx_events_entity ON events (entity_type, entity_id)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    journalEntries,
    mediaAttachments,
    habits,
    habitCheckins,
    areas,
    settings,
    events,
    coachOutputs,
    mediaManifest,
    idxEventsTypeDay,
    idxEventsAreaDay,
    idxEventsEntity,
  ];
}

typedef $$JournalEntriesTableCreateCompanionBuilder =
    JournalEntriesCompanion Function({
      required String id,
      Value<String?> title,
      required String body,
      Value<String?> area,
      required String tagsJson,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> deletedAt,
      Value<bool> imported,
      Value<String?> importHash,
      Value<int> rowid,
    });
typedef $$JournalEntriesTableUpdateCompanionBuilder =
    JournalEntriesCompanion Function({
      Value<String> id,
      Value<String?> title,
      Value<String> body,
      Value<String?> area,
      Value<String> tagsJson,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<bool> imported,
      Value<String?> importHash,
      Value<int> rowid,
    });

final class $$JournalEntriesTableReferences
    extends
        BaseReferences<_$AppDatabase, $JournalEntriesTable, JournalEntryRow> {
  $$JournalEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$MediaAttachmentsTable, List<MediaAttachmentRow>>
  _mediaAttachmentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.mediaAttachments,
    aliasName: 'journal_entries__id__media_attachments__entry_id',
  );

  $$MediaAttachmentsTableProcessedTableManager get mediaAttachmentsRefs {
    final manager = $$MediaAttachmentsTableTableManager(
      $_db,
      $_db.mediaAttachments,
    ).filter((f) => f.entryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _mediaAttachmentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$JournalEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagsJson => $composableBuilder(
    column: $table.tagsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get imported => $composableBuilder(
    column: $table.imported,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get importHash => $composableBuilder(
    column: $table.importHash,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> mediaAttachmentsRefs(
    Expression<bool> Function($$MediaAttachmentsTableFilterComposer f) f,
  ) {
    final $$MediaAttachmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mediaAttachments,
      getReferencedColumn: (t) => t.entryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaAttachmentsTableFilterComposer(
            $db: $db,
            $table: $db.mediaAttachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$JournalEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagsJson => $composableBuilder(
    column: $table.tagsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get imported => $composableBuilder(
    column: $table.imported,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get importHash => $composableBuilder(
    column: $table.importHash,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JournalEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $JournalEntriesTable> {
  $$JournalEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<String> get area =>
      $composableBuilder(column: $table.area, builder: (column) => column);

  GeneratedColumn<String> get tagsJson =>
      $composableBuilder(column: $table.tagsJson, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<bool> get imported =>
      $composableBuilder(column: $table.imported, builder: (column) => column);

  GeneratedColumn<String> get importHash => $composableBuilder(
    column: $table.importHash,
    builder: (column) => column,
  );

  Expression<T> mediaAttachmentsRefs<T extends Object>(
    Expression<T> Function($$MediaAttachmentsTableAnnotationComposer a) f,
  ) {
    final $$MediaAttachmentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mediaAttachments,
      getReferencedColumn: (t) => t.entryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MediaAttachmentsTableAnnotationComposer(
            $db: $db,
            $table: $db.mediaAttachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$JournalEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JournalEntriesTable,
          JournalEntryRow,
          $$JournalEntriesTableFilterComposer,
          $$JournalEntriesTableOrderingComposer,
          $$JournalEntriesTableAnnotationComposer,
          $$JournalEntriesTableCreateCompanionBuilder,
          $$JournalEntriesTableUpdateCompanionBuilder,
          (JournalEntryRow, $$JournalEntriesTableReferences),
          JournalEntryRow,
          PrefetchHooks Function({bool mediaAttachmentsRefs})
        > {
  $$JournalEntriesTableTableManager(
    _$AppDatabase db,
    $JournalEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JournalEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JournalEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JournalEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<String?> area = const Value.absent(),
                Value<String> tagsJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<bool> imported = const Value.absent(),
                Value<String?> importHash = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => JournalEntriesCompanion(
                id: id,
                title: title,
                body: body,
                area: area,
                tagsJson: tagsJson,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                imported: imported,
                importHash: importHash,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> title = const Value.absent(),
                required String body,
                Value<String?> area = const Value.absent(),
                required String tagsJson,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<bool> imported = const Value.absent(),
                Value<String?> importHash = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => JournalEntriesCompanion.insert(
                id: id,
                title: title,
                body: body,
                area: area,
                tagsJson: tagsJson,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                imported: imported,
                importHash: importHash,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$JournalEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({mediaAttachmentsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (mediaAttachmentsRefs) db.mediaAttachments,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (mediaAttachmentsRefs)
                    await $_getPrefetchedData<
                      JournalEntryRow,
                      $JournalEntriesTable,
                      MediaAttachmentRow
                    >(
                      currentTable: table,
                      referencedTable: $$JournalEntriesTableReferences
                          ._mediaAttachmentsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$JournalEntriesTableReferences(
                            db,
                            table,
                            p0,
                          ).mediaAttachmentsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.entryId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$JournalEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JournalEntriesTable,
      JournalEntryRow,
      $$JournalEntriesTableFilterComposer,
      $$JournalEntriesTableOrderingComposer,
      $$JournalEntriesTableAnnotationComposer,
      $$JournalEntriesTableCreateCompanionBuilder,
      $$JournalEntriesTableUpdateCompanionBuilder,
      (JournalEntryRow, $$JournalEntriesTableReferences),
      JournalEntryRow,
      PrefetchHooks Function({bool mediaAttachmentsRefs})
    >;
typedef $$MediaAttachmentsTableCreateCompanionBuilder =
    MediaAttachmentsCompanion Function({
      required String id,
      Value<String?> entryId,
      required String fileName,
      required String mimeType,
      required int sizeBytes,
      Value<int?> durationSec,
      Value<String?> title,
      required DateTime capturedAt,
      Value<String> syncState,
      Value<String> storageRef,
      Value<String?> thumbnailRef,
      Value<String?> contentHash,
      Value<String?> archivedOnDevice,
      Value<bool> adopted,
      Value<Uint8List?> blobData,
      Value<int> rowid,
    });
typedef $$MediaAttachmentsTableUpdateCompanionBuilder =
    MediaAttachmentsCompanion Function({
      Value<String> id,
      Value<String?> entryId,
      Value<String> fileName,
      Value<String> mimeType,
      Value<int> sizeBytes,
      Value<int?> durationSec,
      Value<String?> title,
      Value<DateTime> capturedAt,
      Value<String> syncState,
      Value<String> storageRef,
      Value<String?> thumbnailRef,
      Value<String?> contentHash,
      Value<String?> archivedOnDevice,
      Value<bool> adopted,
      Value<Uint8List?> blobData,
      Value<int> rowid,
    });

final class $$MediaAttachmentsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MediaAttachmentsTable,
          MediaAttachmentRow
        > {
  $$MediaAttachmentsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $JournalEntriesTable _entryIdTable(_$AppDatabase db) => db
      .journalEntries
      .createAlias('media_attachments__entry_id__journal_entries__id');

  $$JournalEntriesTableProcessedTableManager? get entryId {
    final $_column = $_itemColumn<String>('entry_id');
    if ($_column == null) return null;
    final manager = $$JournalEntriesTableTableManager(
      $_db,
      $_db.journalEntries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_entryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MediaAttachmentsTableFilterComposer
    extends Composer<_$AppDatabase, $MediaAttachmentsTable> {
  $$MediaAttachmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sizeBytes => $composableBuilder(
    column: $table.sizeBytes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSec => $composableBuilder(
    column: $table.durationSec,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get capturedAt => $composableBuilder(
    column: $table.capturedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get storageRef => $composableBuilder(
    column: $table.storageRef,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnailRef => $composableBuilder(
    column: $table.thumbnailRef,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentHash => $composableBuilder(
    column: $table.contentHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get archivedOnDevice => $composableBuilder(
    column: $table.archivedOnDevice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get adopted => $composableBuilder(
    column: $table.adopted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get blobData => $composableBuilder(
    column: $table.blobData,
    builder: (column) => ColumnFilters(column),
  );

  $$JournalEntriesTableFilterComposer get entryId {
    final $$JournalEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.entryId,
      referencedTable: $db.journalEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalEntriesTableFilterComposer(
            $db: $db,
            $table: $db.journalEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MediaAttachmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $MediaAttachmentsTable> {
  $$MediaAttachmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sizeBytes => $composableBuilder(
    column: $table.sizeBytes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSec => $composableBuilder(
    column: $table.durationSec,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get capturedAt => $composableBuilder(
    column: $table.capturedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get storageRef => $composableBuilder(
    column: $table.storageRef,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnailRef => $composableBuilder(
    column: $table.thumbnailRef,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentHash => $composableBuilder(
    column: $table.contentHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get archivedOnDevice => $composableBuilder(
    column: $table.archivedOnDevice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get adopted => $composableBuilder(
    column: $table.adopted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get blobData => $composableBuilder(
    column: $table.blobData,
    builder: (column) => ColumnOrderings(column),
  );

  $$JournalEntriesTableOrderingComposer get entryId {
    final $$JournalEntriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.entryId,
      referencedTable: $db.journalEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalEntriesTableOrderingComposer(
            $db: $db,
            $table: $db.journalEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MediaAttachmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MediaAttachmentsTable> {
  $$MediaAttachmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<String> get mimeType =>
      $composableBuilder(column: $table.mimeType, builder: (column) => column);

  GeneratedColumn<int> get sizeBytes =>
      $composableBuilder(column: $table.sizeBytes, builder: (column) => column);

  GeneratedColumn<int> get durationSec => $composableBuilder(
    column: $table.durationSec,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get capturedAt => $composableBuilder(
    column: $table.capturedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  GeneratedColumn<String> get storageRef => $composableBuilder(
    column: $table.storageRef,
    builder: (column) => column,
  );

  GeneratedColumn<String> get thumbnailRef => $composableBuilder(
    column: $table.thumbnailRef,
    builder: (column) => column,
  );

  GeneratedColumn<String> get contentHash => $composableBuilder(
    column: $table.contentHash,
    builder: (column) => column,
  );

  GeneratedColumn<String> get archivedOnDevice => $composableBuilder(
    column: $table.archivedOnDevice,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get adopted =>
      $composableBuilder(column: $table.adopted, builder: (column) => column);

  GeneratedColumn<Uint8List> get blobData =>
      $composableBuilder(column: $table.blobData, builder: (column) => column);

  $$JournalEntriesTableAnnotationComposer get entryId {
    final $$JournalEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.entryId,
      referencedTable: $db.journalEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JournalEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.journalEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MediaAttachmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MediaAttachmentsTable,
          MediaAttachmentRow,
          $$MediaAttachmentsTableFilterComposer,
          $$MediaAttachmentsTableOrderingComposer,
          $$MediaAttachmentsTableAnnotationComposer,
          $$MediaAttachmentsTableCreateCompanionBuilder,
          $$MediaAttachmentsTableUpdateCompanionBuilder,
          (MediaAttachmentRow, $$MediaAttachmentsTableReferences),
          MediaAttachmentRow,
          PrefetchHooks Function({bool entryId})
        > {
  $$MediaAttachmentsTableTableManager(
    _$AppDatabase db,
    $MediaAttachmentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MediaAttachmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MediaAttachmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MediaAttachmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> entryId = const Value.absent(),
                Value<String> fileName = const Value.absent(),
                Value<String> mimeType = const Value.absent(),
                Value<int> sizeBytes = const Value.absent(),
                Value<int?> durationSec = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<DateTime> capturedAt = const Value.absent(),
                Value<String> syncState = const Value.absent(),
                Value<String> storageRef = const Value.absent(),
                Value<String?> thumbnailRef = const Value.absent(),
                Value<String?> contentHash = const Value.absent(),
                Value<String?> archivedOnDevice = const Value.absent(),
                Value<bool> adopted = const Value.absent(),
                Value<Uint8List?> blobData = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MediaAttachmentsCompanion(
                id: id,
                entryId: entryId,
                fileName: fileName,
                mimeType: mimeType,
                sizeBytes: sizeBytes,
                durationSec: durationSec,
                title: title,
                capturedAt: capturedAt,
                syncState: syncState,
                storageRef: storageRef,
                thumbnailRef: thumbnailRef,
                contentHash: contentHash,
                archivedOnDevice: archivedOnDevice,
                adopted: adopted,
                blobData: blobData,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> entryId = const Value.absent(),
                required String fileName,
                required String mimeType,
                required int sizeBytes,
                Value<int?> durationSec = const Value.absent(),
                Value<String?> title = const Value.absent(),
                required DateTime capturedAt,
                Value<String> syncState = const Value.absent(),
                Value<String> storageRef = const Value.absent(),
                Value<String?> thumbnailRef = const Value.absent(),
                Value<String?> contentHash = const Value.absent(),
                Value<String?> archivedOnDevice = const Value.absent(),
                Value<bool> adopted = const Value.absent(),
                Value<Uint8List?> blobData = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MediaAttachmentsCompanion.insert(
                id: id,
                entryId: entryId,
                fileName: fileName,
                mimeType: mimeType,
                sizeBytes: sizeBytes,
                durationSec: durationSec,
                title: title,
                capturedAt: capturedAt,
                syncState: syncState,
                storageRef: storageRef,
                thumbnailRef: thumbnailRef,
                contentHash: contentHash,
                archivedOnDevice: archivedOnDevice,
                adopted: adopted,
                blobData: blobData,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MediaAttachmentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({entryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (entryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.entryId,
                                referencedTable:
                                    $$MediaAttachmentsTableReferences
                                        ._entryIdTable(db),
                                referencedColumn:
                                    $$MediaAttachmentsTableReferences
                                        ._entryIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MediaAttachmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MediaAttachmentsTable,
      MediaAttachmentRow,
      $$MediaAttachmentsTableFilterComposer,
      $$MediaAttachmentsTableOrderingComposer,
      $$MediaAttachmentsTableAnnotationComposer,
      $$MediaAttachmentsTableCreateCompanionBuilder,
      $$MediaAttachmentsTableUpdateCompanionBuilder,
      (MediaAttachmentRow, $$MediaAttachmentsTableReferences),
      MediaAttachmentRow,
      PrefetchHooks Function({bool entryId})
    >;
typedef $$HabitsTableCreateCompanionBuilder =
    HabitsCompanion Function({
      required String id,
      required String name,
      Value<String?> area,
      required DateTime createdAt,
      Value<bool> active,
      Value<int> rowid,
    });
typedef $$HabitsTableUpdateCompanionBuilder =
    HabitsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> area,
      Value<DateTime> createdAt,
      Value<bool> active,
      Value<int> rowid,
    });

final class $$HabitsTableReferences
    extends BaseReferences<_$AppDatabase, $HabitsTable, HabitRow> {
  $$HabitsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$HabitCheckinsTable, List<HabitCheckinRow>>
  _habitCheckinsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.habitCheckins,
    aliasName: 'habits__id__habit_checkins__habit_id',
  );

  $$HabitCheckinsTableProcessedTableManager get habitCheckinsRefs {
    final manager = $$HabitCheckinsTableTableManager(
      $_db,
      $_db.habitCheckins,
    ).filter((f) => f.habitId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_habitCheckinsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$HabitsTableFilterComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> habitCheckinsRefs(
    Expression<bool> Function($$HabitCheckinsTableFilterComposer f) f,
  ) {
    final $$HabitCheckinsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitCheckins,
      getReferencedColumn: (t) => t.habitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitCheckinsTableFilterComposer(
            $db: $db,
            $table: $db.habitCheckins,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HabitsTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HabitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get area =>
      $composableBuilder(column: $table.area, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  Expression<T> habitCheckinsRefs<T extends Object>(
    Expression<T> Function($$HabitCheckinsTableAnnotationComposer a) f,
  ) {
    final $$HabitCheckinsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.habitCheckins,
      getReferencedColumn: (t) => t.habitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitCheckinsTableAnnotationComposer(
            $db: $db,
            $table: $db.habitCheckins,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HabitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HabitsTable,
          HabitRow,
          $$HabitsTableFilterComposer,
          $$HabitsTableOrderingComposer,
          $$HabitsTableAnnotationComposer,
          $$HabitsTableCreateCompanionBuilder,
          $$HabitsTableUpdateCompanionBuilder,
          (HabitRow, $$HabitsTableReferences),
          HabitRow,
          PrefetchHooks Function({bool habitCheckinsRefs})
        > {
  $$HabitsTableTableManager(_$AppDatabase db, $HabitsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> area = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HabitsCompanion(
                id: id,
                name: name,
                area: area,
                createdAt: createdAt,
                active: active,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> area = const Value.absent(),
                required DateTime createdAt,
                Value<bool> active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HabitsCompanion.insert(
                id: id,
                name: name,
                area: area,
                createdAt: createdAt,
                active: active,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$HabitsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({habitCheckinsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (habitCheckinsRefs) db.habitCheckins,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (habitCheckinsRefs)
                    await $_getPrefetchedData<
                      HabitRow,
                      $HabitsTable,
                      HabitCheckinRow
                    >(
                      currentTable: table,
                      referencedTable: $$HabitsTableReferences
                          ._habitCheckinsRefsTable(db),
                      managerFromTypedResult: (p0) => $$HabitsTableReferences(
                        db,
                        table,
                        p0,
                      ).habitCheckinsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.habitId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$HabitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HabitsTable,
      HabitRow,
      $$HabitsTableFilterComposer,
      $$HabitsTableOrderingComposer,
      $$HabitsTableAnnotationComposer,
      $$HabitsTableCreateCompanionBuilder,
      $$HabitsTableUpdateCompanionBuilder,
      (HabitRow, $$HabitsTableReferences),
      HabitRow,
      PrefetchHooks Function({bool habitCheckinsRefs})
    >;
typedef $$HabitCheckinsTableCreateCompanionBuilder =
    HabitCheckinsCompanion Function({
      required String id,
      required String habitId,
      required String dayKey,
      required DateTime completedAt,
      Value<String?> note,
      Value<int> rowid,
    });
typedef $$HabitCheckinsTableUpdateCompanionBuilder =
    HabitCheckinsCompanion Function({
      Value<String> id,
      Value<String> habitId,
      Value<String> dayKey,
      Value<DateTime> completedAt,
      Value<String?> note,
      Value<int> rowid,
    });

final class $$HabitCheckinsTableReferences
    extends
        BaseReferences<_$AppDatabase, $HabitCheckinsTable, HabitCheckinRow> {
  $$HabitCheckinsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $HabitsTable _habitIdTable(_$AppDatabase db) =>
      db.habits.createAlias('habit_checkins__habit_id__habits__id');

  $$HabitsTableProcessedTableManager get habitId {
    final $_column = $_itemColumn<String>('habit_id')!;

    final manager = $$HabitsTableTableManager(
      $_db,
      $_db.habits,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_habitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HabitCheckinsTableFilterComposer
    extends Composer<_$AppDatabase, $HabitCheckinsTable> {
  $$HabitCheckinsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dayKey => $composableBuilder(
    column: $table.dayKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$HabitsTableFilterComposer get habitId {
    final $$HabitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habitId,
      referencedTable: $db.habits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitsTableFilterComposer(
            $db: $db,
            $table: $db.habits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HabitCheckinsTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitCheckinsTable> {
  $$HabitCheckinsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dayKey => $composableBuilder(
    column: $table.dayKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$HabitsTableOrderingComposer get habitId {
    final $$HabitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habitId,
      referencedTable: $db.habits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitsTableOrderingComposer(
            $db: $db,
            $table: $db.habits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HabitCheckinsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitCheckinsTable> {
  $$HabitCheckinsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get dayKey =>
      $composableBuilder(column: $table.dayKey, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$HabitsTableAnnotationComposer get habitId {
    final $$HabitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habitId,
      referencedTable: $db.habits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitsTableAnnotationComposer(
            $db: $db,
            $table: $db.habits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HabitCheckinsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HabitCheckinsTable,
          HabitCheckinRow,
          $$HabitCheckinsTableFilterComposer,
          $$HabitCheckinsTableOrderingComposer,
          $$HabitCheckinsTableAnnotationComposer,
          $$HabitCheckinsTableCreateCompanionBuilder,
          $$HabitCheckinsTableUpdateCompanionBuilder,
          (HabitCheckinRow, $$HabitCheckinsTableReferences),
          HabitCheckinRow,
          PrefetchHooks Function({bool habitId})
        > {
  $$HabitCheckinsTableTableManager(_$AppDatabase db, $HabitCheckinsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitCheckinsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitCheckinsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitCheckinsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> habitId = const Value.absent(),
                Value<String> dayKey = const Value.absent(),
                Value<DateTime> completedAt = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HabitCheckinsCompanion(
                id: id,
                habitId: habitId,
                dayKey: dayKey,
                completedAt: completedAt,
                note: note,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String habitId,
                required String dayKey,
                required DateTime completedAt,
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HabitCheckinsCompanion.insert(
                id: id,
                habitId: habitId,
                dayKey: dayKey,
                completedAt: completedAt,
                note: note,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HabitCheckinsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({habitId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (habitId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.habitId,
                                referencedTable: $$HabitCheckinsTableReferences
                                    ._habitIdTable(db),
                                referencedColumn: $$HabitCheckinsTableReferences
                                    ._habitIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$HabitCheckinsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HabitCheckinsTable,
      HabitCheckinRow,
      $$HabitCheckinsTableFilterComposer,
      $$HabitCheckinsTableOrderingComposer,
      $$HabitCheckinsTableAnnotationComposer,
      $$HabitCheckinsTableCreateCompanionBuilder,
      $$HabitCheckinsTableUpdateCompanionBuilder,
      (HabitCheckinRow, $$HabitCheckinsTableReferences),
      HabitCheckinRow,
      PrefetchHooks Function({bool habitId})
    >;
typedef $$AreasTableCreateCompanionBuilder =
    AreasCompanion Function({
      required String id,
      required String label,
      Value<bool> userDefined,
      Value<int> rowid,
    });
typedef $$AreasTableUpdateCompanionBuilder =
    AreasCompanion Function({
      Value<String> id,
      Value<String> label,
      Value<bool> userDefined,
      Value<int> rowid,
    });

class $$AreasTableFilterComposer extends Composer<_$AppDatabase, $AreasTable> {
  $$AreasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get userDefined => $composableBuilder(
    column: $table.userDefined,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AreasTableOrderingComposer
    extends Composer<_$AppDatabase, $AreasTable> {
  $$AreasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get userDefined => $composableBuilder(
    column: $table.userDefined,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AreasTableAnnotationComposer
    extends Composer<_$AppDatabase, $AreasTable> {
  $$AreasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<bool> get userDefined => $composableBuilder(
    column: $table.userDefined,
    builder: (column) => column,
  );
}

class $$AreasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AreasTable,
          Area,
          $$AreasTableFilterComposer,
          $$AreasTableOrderingComposer,
          $$AreasTableAnnotationComposer,
          $$AreasTableCreateCompanionBuilder,
          $$AreasTableUpdateCompanionBuilder,
          (Area, BaseReferences<_$AppDatabase, $AreasTable, Area>),
          Area,
          PrefetchHooks Function()
        > {
  $$AreasTableTableManager(_$AppDatabase db, $AreasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AreasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AreasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AreasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<bool> userDefined = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AreasCompanion(
                id: id,
                label: label,
                userDefined: userDefined,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String label,
                Value<bool> userDefined = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AreasCompanion.insert(
                id: id,
                label: label,
                userDefined: userDefined,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AreasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AreasTable,
      Area,
      $$AreasTableFilterComposer,
      $$AreasTableOrderingComposer,
      $$AreasTableAnnotationComposer,
      $$AreasTableCreateCompanionBuilder,
      $$AreasTableUpdateCompanionBuilder,
      (Area, BaseReferences<_$AppDatabase, $AreasTable, Area>),
      Area,
      PrefetchHooks Function()
    >;
typedef $$SettingsTableCreateCompanionBuilder =
    SettingsCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$SettingsTableUpdateCompanionBuilder =
    SettingsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$SettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTable,
          Setting,
          $$SettingsTableFilterComposer,
          $$SettingsTableOrderingComposer,
          $$SettingsTableAnnotationComposer,
          $$SettingsTableCreateCompanionBuilder,
          $$SettingsTableUpdateCompanionBuilder,
          (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
          Setting,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SettingsCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => SettingsCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTable,
      Setting,
      $$SettingsTableFilterComposer,
      $$SettingsTableOrderingComposer,
      $$SettingsTableAnnotationComposer,
      $$SettingsTableCreateCompanionBuilder,
      $$SettingsTableUpdateCompanionBuilder,
      (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
      Setting,
      PrefetchHooks Function()
    >;
typedef $$EventsTableCreateCompanionBuilder =
    EventsCompanion Function({
      required String id,
      required String type,
      required DateTime occurredAt,
      required String dayKey,
      Value<String?> area,
      required String entityType,
      required String entityId,
      Value<int> payloadVersion,
      required String payload,
      Value<String?> supersedesId,
      Value<int> rowid,
    });
typedef $$EventsTableUpdateCompanionBuilder =
    EventsCompanion Function({
      Value<String> id,
      Value<String> type,
      Value<DateTime> occurredAt,
      Value<String> dayKey,
      Value<String?> area,
      Value<String> entityType,
      Value<String> entityId,
      Value<int> payloadVersion,
      Value<String> payload,
      Value<String?> supersedesId,
      Value<int> rowid,
    });

class $$EventsTableFilterComposer
    extends Composer<_$AppDatabase, $EventsTable> {
  $$EventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dayKey => $composableBuilder(
    column: $table.dayKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get payloadVersion => $composableBuilder(
    column: $table.payloadVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get supersedesId => $composableBuilder(
    column: $table.supersedesId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EventsTableOrderingComposer
    extends Composer<_$AppDatabase, $EventsTable> {
  $$EventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dayKey => $composableBuilder(
    column: $table.dayKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get payloadVersion => $composableBuilder(
    column: $table.payloadVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get supersedesId => $composableBuilder(
    column: $table.supersedesId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventsTable> {
  $$EventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dayKey =>
      $composableBuilder(column: $table.dayKey, builder: (column) => column);

  GeneratedColumn<String> get area =>
      $composableBuilder(column: $table.area, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<int> get payloadVersion => $composableBuilder(
    column: $table.payloadVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<String> get supersedesId => $composableBuilder(
    column: $table.supersedesId,
    builder: (column) => column,
  );
}

class $$EventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventsTable,
          EventRow,
          $$EventsTableFilterComposer,
          $$EventsTableOrderingComposer,
          $$EventsTableAnnotationComposer,
          $$EventsTableCreateCompanionBuilder,
          $$EventsTableUpdateCompanionBuilder,
          (EventRow, BaseReferences<_$AppDatabase, $EventsTable, EventRow>),
          EventRow,
          PrefetchHooks Function()
        > {
  $$EventsTableTableManager(_$AppDatabase db, $EventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<DateTime> occurredAt = const Value.absent(),
                Value<String> dayKey = const Value.absent(),
                Value<String?> area = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<int> payloadVersion = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<String?> supersedesId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventsCompanion(
                id: id,
                type: type,
                occurredAt: occurredAt,
                dayKey: dayKey,
                area: area,
                entityType: entityType,
                entityId: entityId,
                payloadVersion: payloadVersion,
                payload: payload,
                supersedesId: supersedesId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String type,
                required DateTime occurredAt,
                required String dayKey,
                Value<String?> area = const Value.absent(),
                required String entityType,
                required String entityId,
                Value<int> payloadVersion = const Value.absent(),
                required String payload,
                Value<String?> supersedesId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventsCompanion.insert(
                id: id,
                type: type,
                occurredAt: occurredAt,
                dayKey: dayKey,
                area: area,
                entityType: entityType,
                entityId: entityId,
                payloadVersion: payloadVersion,
                payload: payload,
                supersedesId: supersedesId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventsTable,
      EventRow,
      $$EventsTableFilterComposer,
      $$EventsTableOrderingComposer,
      $$EventsTableAnnotationComposer,
      $$EventsTableCreateCompanionBuilder,
      $$EventsTableUpdateCompanionBuilder,
      (EventRow, BaseReferences<_$AppDatabase, $EventsTable, EventRow>),
      EventRow,
      PrefetchHooks Function()
    >;
typedef $$CoachOutputsTableCreateCompanionBuilder =
    CoachOutputsCompanion Function({
      required String id,
      required String kind,
      required String dateKey,
      required String payload,
      Value<int> rowid,
    });
typedef $$CoachOutputsTableUpdateCompanionBuilder =
    CoachOutputsCompanion Function({
      Value<String> id,
      Value<String> kind,
      Value<String> dateKey,
      Value<String> payload,
      Value<int> rowid,
    });

class $$CoachOutputsTableFilterComposer
    extends Composer<_$AppDatabase, $CoachOutputsTable> {
  $$CoachOutputsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dateKey => $composableBuilder(
    column: $table.dateKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CoachOutputsTableOrderingComposer
    extends Composer<_$AppDatabase, $CoachOutputsTable> {
  $$CoachOutputsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dateKey => $composableBuilder(
    column: $table.dateKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CoachOutputsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CoachOutputsTable> {
  $$CoachOutputsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get dateKey =>
      $composableBuilder(column: $table.dateKey, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);
}

class $$CoachOutputsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CoachOutputsTable,
          CoachOutputRow,
          $$CoachOutputsTableFilterComposer,
          $$CoachOutputsTableOrderingComposer,
          $$CoachOutputsTableAnnotationComposer,
          $$CoachOutputsTableCreateCompanionBuilder,
          $$CoachOutputsTableUpdateCompanionBuilder,
          (
            CoachOutputRow,
            BaseReferences<_$AppDatabase, $CoachOutputsTable, CoachOutputRow>,
          ),
          CoachOutputRow,
          PrefetchHooks Function()
        > {
  $$CoachOutputsTableTableManager(_$AppDatabase db, $CoachOutputsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CoachOutputsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CoachOutputsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CoachOutputsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> dateKey = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CoachOutputsCompanion(
                id: id,
                kind: kind,
                dateKey: dateKey,
                payload: payload,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String kind,
                required String dateKey,
                required String payload,
                Value<int> rowid = const Value.absent(),
              }) => CoachOutputsCompanion.insert(
                id: id,
                kind: kind,
                dateKey: dateKey,
                payload: payload,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CoachOutputsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CoachOutputsTable,
      CoachOutputRow,
      $$CoachOutputsTableFilterComposer,
      $$CoachOutputsTableOrderingComposer,
      $$CoachOutputsTableAnnotationComposer,
      $$CoachOutputsTableCreateCompanionBuilder,
      $$CoachOutputsTableUpdateCompanionBuilder,
      (
        CoachOutputRow,
        BaseReferences<_$AppDatabase, $CoachOutputsTable, CoachOutputRow>,
      ),
      CoachOutputRow,
      PrefetchHooks Function()
    >;
typedef $$MediaManifestTableCreateCompanionBuilder =
    MediaManifestCompanion Function({
      required String id,
      required String mediaId,
      Value<String?> sha256,
      Value<bool> exportedIn,
      Value<int> rowid,
    });
typedef $$MediaManifestTableUpdateCompanionBuilder =
    MediaManifestCompanion Function({
      Value<String> id,
      Value<String> mediaId,
      Value<String?> sha256,
      Value<bool> exportedIn,
      Value<int> rowid,
    });

class $$MediaManifestTableFilterComposer
    extends Composer<_$AppDatabase, $MediaManifestTable> {
  $$MediaManifestTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mediaId => $composableBuilder(
    column: $table.mediaId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sha256 => $composableBuilder(
    column: $table.sha256,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get exportedIn => $composableBuilder(
    column: $table.exportedIn,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MediaManifestTableOrderingComposer
    extends Composer<_$AppDatabase, $MediaManifestTable> {
  $$MediaManifestTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mediaId => $composableBuilder(
    column: $table.mediaId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sha256 => $composableBuilder(
    column: $table.sha256,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get exportedIn => $composableBuilder(
    column: $table.exportedIn,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MediaManifestTableAnnotationComposer
    extends Composer<_$AppDatabase, $MediaManifestTable> {
  $$MediaManifestTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get mediaId =>
      $composableBuilder(column: $table.mediaId, builder: (column) => column);

  GeneratedColumn<String> get sha256 =>
      $composableBuilder(column: $table.sha256, builder: (column) => column);

  GeneratedColumn<bool> get exportedIn => $composableBuilder(
    column: $table.exportedIn,
    builder: (column) => column,
  );
}

class $$MediaManifestTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MediaManifestTable,
          MediaManifestData,
          $$MediaManifestTableFilterComposer,
          $$MediaManifestTableOrderingComposer,
          $$MediaManifestTableAnnotationComposer,
          $$MediaManifestTableCreateCompanionBuilder,
          $$MediaManifestTableUpdateCompanionBuilder,
          (
            MediaManifestData,
            BaseReferences<
              _$AppDatabase,
              $MediaManifestTable,
              MediaManifestData
            >,
          ),
          MediaManifestData,
          PrefetchHooks Function()
        > {
  $$MediaManifestTableTableManager(_$AppDatabase db, $MediaManifestTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MediaManifestTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MediaManifestTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MediaManifestTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> mediaId = const Value.absent(),
                Value<String?> sha256 = const Value.absent(),
                Value<bool> exportedIn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MediaManifestCompanion(
                id: id,
                mediaId: mediaId,
                sha256: sha256,
                exportedIn: exportedIn,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String mediaId,
                Value<String?> sha256 = const Value.absent(),
                Value<bool> exportedIn = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MediaManifestCompanion.insert(
                id: id,
                mediaId: mediaId,
                sha256: sha256,
                exportedIn: exportedIn,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MediaManifestTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MediaManifestTable,
      MediaManifestData,
      $$MediaManifestTableFilterComposer,
      $$MediaManifestTableOrderingComposer,
      $$MediaManifestTableAnnotationComposer,
      $$MediaManifestTableCreateCompanionBuilder,
      $$MediaManifestTableUpdateCompanionBuilder,
      (
        MediaManifestData,
        BaseReferences<_$AppDatabase, $MediaManifestTable, MediaManifestData>,
      ),
      MediaManifestData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$JournalEntriesTableTableManager get journalEntries =>
      $$JournalEntriesTableTableManager(_db, _db.journalEntries);
  $$MediaAttachmentsTableTableManager get mediaAttachments =>
      $$MediaAttachmentsTableTableManager(_db, _db.mediaAttachments);
  $$HabitsTableTableManager get habits =>
      $$HabitsTableTableManager(_db, _db.habits);
  $$HabitCheckinsTableTableManager get habitCheckins =>
      $$HabitCheckinsTableTableManager(_db, _db.habitCheckins);
  $$AreasTableTableManager get areas =>
      $$AreasTableTableManager(_db, _db.areas);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
  $$EventsTableTableManager get events =>
      $$EventsTableTableManager(_db, _db.events);
  $$CoachOutputsTableTableManager get coachOutputs =>
      $$CoachOutputsTableTableManager(_db, _db.coachOutputs);
  $$MediaManifestTableTableManager get mediaManifest =>
      $$MediaManifestTableTableManager(_db, _db.mediaManifest);
}
