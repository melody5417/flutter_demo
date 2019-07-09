import 'package:json_annotation/json_annotation.dart';

// 1. 将即将生成的xxx.g.dart文件作为xxx.dart文件的part。
// 这里配置后因为没生成，编辑器会提示错误，但是必须先配置part
// 否则后面不会自动生成xxx.g.dart文件。
part 'json_person.g.dart';

// 2. 在类上添加 JsonSerializable注解
@JsonSerializable()
class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

// 3. 执行命令
// flutter packages pub run build_runner build
