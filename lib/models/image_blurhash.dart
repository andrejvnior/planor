import 'dart:io';
import 'dart:typed_data';
import 'package:blurhash/blurhash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart' show basename;
import 'package:planor/repositories/storage_repository.dart';

class ImageBlurHash {
  final String image;
  final String blurHash;

  ImageBlurHash({required this.image, required this.blurHash});

  ImageBlurHash.fromJson(Map<String, dynamic> json)
      : image = json['image'],
        blurHash = json['blurHash'];

  Map<String, dynamic> toJson() => {'image': image, 'blurHash': blurHash};
}

class BlurHashController {
  Future<String> encode(File file) async {
    Uint8List pixels = await file.readAsBytes();
    final blurHash = await BlurHash.encode(pixels, 4, 3);
    return blurHash;
  }

  Future<File?> decode(String blurHash) async {
    Uint8List imageDataBytes;
    try {
      imageDataBytes = await BlurHash.decode(blurHash, 20, 12);
      final file = File.fromRawPath(imageDataBytes);
      return file;
    } on PlatformException catch (e) {
      debugPrint(e.message);
      return null;
    }
  }

  Future<ImageBlurHash?> buildImageBlurHash(
      File file, String repositoryName) async {
    final blurHash = await encode(file);
    final url = await uploadAndGetUrl(file, repositoryName);
    if (blurHash.isNotEmpty && url != null && url.isNotEmpty) {
      return ImageBlurHash(image: url, blurHash: blurHash);
    }
    return null;
  }

  Future<String?> uploadAndGetUrl(File file, String repositoryName) async {
    final repository = StorageRepository(name: repositoryName);

    await repository.upload(file);
    final downloadUrl = await repository.download(basename(file.path));
    return downloadUrl;
  }
}
