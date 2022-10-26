import 'package:planor/features/book/models/book.dart';
import 'package:planor/repositories/database_repository.dart';

class BookRepository extends DataBaseRepository<Book> {
  BookRepository()
      : super(
          name: 'books',
          fromMap: (document) => Book.fromMap(document),
        );
}
