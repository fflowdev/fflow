import 'package:drift/drift.dart';
import 'package:fflow/core/storage/storage.dart';
import 'package:fflow/features/presets/domain/presets_table.dart';

part 'presets_dao.g.dart';

@DriftAccessor(tables: [Presets])
class PresetsDao extends DatabaseDao<Presets, PresetData>
    with _$PresetsDaoMixin {
  @override
  TableInfo<Presets, PresetData> get table => presets;

  @override
  Insertable<PresetData> Function(PresetData data) get toCompanion =>
      (preset) => PresetsCompanion(
        name: Value(preset.name),
        description: Value(preset.description),
        category: Value(preset.category),
        ffmpegCommand: Value(preset.ffmpegCommand),
        isFavorite: Value(preset.isFavorite),
        createdAt: Value(preset.createdAt),
        updatedAt: Value(preset.updatedAt),
      );

  Stream<List<PresetData>> watchAllBy({
    String? name,
    String? description,
    String? category,
    String? ffmpegCommand,
    bool? isFavorite,
  }) {
    final query = select(table);

    if (name != null) {
      query.where((tbl) => tbl.name.like('%$name%'));
    }
    if (description != null) {
      query.where((tbl) => tbl.description.like('%$description%'));
    }
    if (category != null) {
      query.where((tbl) => tbl.category.like('%$category%'));
    }
    if (ffmpegCommand != null) {
      query.where((tbl) => tbl.ffmpegCommand.like('%$ffmpegCommand%'));
    }
    if (isFavorite != null) {
      query.where((tbl) => tbl.isFavorite.equals(isFavorite));
    }

    return query.watch();
  }
}

// @riverpod
// PresetRepository presetRepository(Ref ref) {
//   return PresetRepository();
// }

// class PresetRepository {
//   static const _storageKey = 'presets';

//   Future<List<Preset>> getAll() async {
//     final prefs = storage._prefs;
//     final json = prefs.getString(_storageKey);
//     if (json == null || json.isEmpty) {
//       return _defaultPresets();
//     }

//     try {
//       final decoded = jsonDecode(json) as List<dynamic>;
//       return decoded
//           .map((e) => Preset.fromJson(e as Map<String, dynamic>))
//           .toList();
//     } on Exception {
//       return _defaultPresets();
//     }
//   }

//   Future<void> save(Preset preset) async {
//     final presets = await getAll();
//     final index = presets.indexWhere((p) => p.id == preset.id);

//     if (index != -1) {
//       presets[index] = preset.copyWith(updatedAt: DateTime.now());
//     } else {
//       presets.add(
//         preset.copyWith(
//           createdAt: DateTime.now(),
//           updatedAt: DateTime.now(),
//         ),
//       );
//     }

//     await _saveAll(presets);
//   }

//   Future<void> delete(String id) async {
//     final presets = await getAll();
//     presets.removeWhere((p) => p.id == id);
//     await _saveAll(presets);
//   }

//   Future<void> _saveAll(List<Preset> presets) async {
//     final json = jsonEncode(presets.map((e) => e.toJson()).toList());
//     final prefs = storage._prefs;
//     await prefs.setString(_storageKey, json);
//   }

//   static final List<Preset> _defaultPresets = [
//     Preset(
//       id: '1',
//       name: 'Web Optimized MP4',
//       description:
//           'Convert to H.264 1080p with AAC audio. Fast start enabled for immediate web streaming.',
//       category: PresetCategory.video,
//       ffmpegCommand:
//           'ffmpeg -i input.mov -c:v libx264 -preset slow -crf 22 -c:a aac -b:a 128k -movflags +faststart output.mp4',
//       createdAt: DateTime.now(),
//     ),
//     Preset(
//       id: '2',
//       name: 'Extract Audio (WAV)',
//       description:
//           'Strip video track and save audio as uncompressed WAV for mastering.',
//       category: PresetCategory.audio,
//       ffmpegCommand:
//           'ffmpeg -i input.mp4 -vn -acodec pcm_s16le -ar 44100 -ac 2 output.wav',
//       createdAt: DateTime.now(),
//     ),
//     Preset(
//       id: '3',
//       name: 'High Quality GIF',
//       description:
//           'Generate palette first, then create a high-quality looping GIF.',
//       category: PresetCategory.gif,
//       ffmpegCommand:
//           'ffmpeg -i input.mp4 -vf "fps=15,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 output.gif',
//       createdAt: DateTime.now(),
//     ),
//     Preset(
//       id: '4',
//       name: 'HEVC / H.265 Archival',
//       description: 'High compression efficiency for long-term storage.',
//       category: PresetCategory.encode,
//       ffmpegCommand:
//           'ffmpeg -i input.mp4 -c:v libx265 -crf 28 -c:a aac -b:a 128k output.mp4',
//       createdAt: DateTime.now(),
//     ),
//   ];
// }
