import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

/// Komponen pemilihan berkas & pratinjau gambar (Ref Pertemuan 7)
class FilePickerTile extends StatelessWidget {
  final String? filePath;
  final String? fileName;
  final Function(String path, String name) onFilePicked;

  const FilePickerTile({
    super.key,
    required this.filePath,
    required this.fileName,
    required this.onFilePicked,
  });

  Future<void> _pickFile() async {
    final file = await FilePicker.pickFile(type: FileType.any);
    if (file != null && file.path != null) {
      onFilePicked(file.path!, file.name);
    }
  }

  bool _isImage(String? name) {
    if (name == null) return false;
    final l = name.toLowerCase();
    return l.endsWith('.jpg') || l.endsWith('.jpeg') || l.endsWith('.png');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Berkas / Foto *:',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            ElevatedButton.icon(
              onPressed: _pickFile,
              icon: const Icon(Icons.upload_file_rounded, size: 18),
              label: const Text('Pilih Berkas'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (fileName != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.teal.shade200),
            ),
            child: Row(
              children: [
                const Icon(Icons.attach_file_rounded, size: 18, color: Colors.teal),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    fileName!,
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )
        else
          const Text(
            'Belum ada berkas yang dipilih.',
            style: TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic),
          ),
        if (filePath != null && _isImage(fileName)) ...[
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(
              File(filePath!),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (ctx, err, st) => Container(
                width: 100,
                height: 100,
                color: Colors.grey.shade200,
                child: const Icon(Icons.broken_image, color: Colors.grey),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
