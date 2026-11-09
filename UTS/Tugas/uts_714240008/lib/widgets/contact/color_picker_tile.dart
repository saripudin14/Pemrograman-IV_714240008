import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

/// Komponen pemilih warna menggunakan flutter_colorpicker (Ref Pertemuan 7)
class ColorPickerTile extends StatelessWidget {
  final Color selectedColor;
  final ValueChanged<Color> onColorChanged;

  const ColorPickerTile({
    super.key,
    required this.selectedColor,
    required this.onColorChanged,
  });

  void _showColorDialog(BuildContext context) {
    Color tempColor = selectedColor;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Pilih Warna Kontak'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: selectedColor,
            onColorChanged: (color) => tempColor = color,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              onColorChanged(tempColor);
              Navigator.pop(ctx);
            },
            child: const Text('Terapkan'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Warna Kontak:',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 12),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: selectedColor,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade400),
          ),
        ),
        const Spacer(),
        OutlinedButton.icon(
          onPressed: () => _showColorDialog(context),
          icon: const Icon(Icons.color_lens_outlined, size: 18),
          label: const Text('Pilih Warna'),
        ),
      ],
    );
  }
}
