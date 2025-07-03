import 'package:crimes/data/dto/database/database_dto.dart';
import 'package:crimes/data/entity/database.dart';

class DatabaseMapper {
  Database map(DatabaseDto dto){
    return Database(
        title: dto.title,
        category: dto.category,
        checked: false,
        enable: dto.enable,
        hintKeyword: dto.hintKeyword
    );
  }
}
