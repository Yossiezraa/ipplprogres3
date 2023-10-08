import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TambahprodukPage extends StatefulWidget {
  @override
  State<TambahprodukPage> createState() => _TambahprodukPageState();
}

class _TambahprodukPageState extends State<TambahprodukPage> {
  // Controller untuk mengontrol input pada form
  final TextEditingController _namaProdukController = TextEditingController();
  final TextEditingController _deskripsiProdukController =
      TextEditingController();
  final TextEditingController _stokController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  File? img;
  gallery() async {
    final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = _image;
    });
  }

  // Variabel untuk menyimpan gambar yang akan diunggah
  // Anda perlu menambahkan logika pengunggahan gambar sesuai kebutuhan aplikasi Anda
  String _gambarProduk = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Tambah Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Nama Produk
              TextFormField(
                controller: _namaProdukController,
                decoration: InputDecoration(labelText: 'Nama Produk'),
              ),
              SizedBox(height: 16.0),

              // Deskripsi Produk
              TextField(
                controller: _deskripsiProdukController,
                maxLines: 4,
                decoration: InputDecoration(labelText: 'Deskripsi Produk'),
              ),
              SizedBox(height: 16.0),

              // Stok
              TextFormField(
                controller: _stokController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Stok'),
              ),
              SizedBox(height: 16.0),

              // Harga
              TextFormField(
                controller: _hargaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Harga'),
              ),
              SizedBox(height: 16.0),
              Text("Unggah Gambar"),
              InkWell(
                onTap: gallery,
                child: image == null
                    ? Image.asset(
                        "asset/images/imgPlaceholder.png",
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(image!.path),
                        fit: BoxFit.cover,
                      ),
              ),

              // Unggah Gambar (Anda perlu menambahkan logika pengunggahan gambar)

              SizedBox(height: 16.0),
              // Tombol Simpan
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika untuk menyimpan produk ke database atau penyimpanan lainnya
                },
                child: Text('Simpan Produk'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
