import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planor/features/activity/pages/edit/activity_edit_page.dart';
import 'package:planor/features/book/models/book.dart';
import 'package:planor/features/book/repositories/book_repository.dart';
import 'package:planor/features/home/pages/home_controller.dart';
import 'package:planor/models/image_blurhash.dart';
import 'package:planor/widgets/design_button.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DesignButton(
              title: 'Criar Atividade',
              onPressed: () => Get.to(() => const ActivityEditPage()),
            ),
            // DesignButton(
            //   title: 'Criar Apostilas',
            //   onPressed: () {
            //     final bookRepository = BookRepository();
            //     final book = Book(
            //       title: 'New Teste Apostila',
            //       description: 'New Descrição da Apostila Outro',
            //       image: ImageBlurHash(
            //         image: 'https://i.ibb.co/PCm4dqK/apostila.jpg',
            //         blurHash: 'L44{lYj]01bIkDazayj[00a|~pjZ',
            //       ),
            //       pages: 228,
            //     );
            //     bookRepository.save(book);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
