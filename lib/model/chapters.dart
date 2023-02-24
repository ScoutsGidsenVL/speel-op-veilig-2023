import 'package:json_annotation/json_annotation.dart';

part 'chapters.g.dart';

@JsonSerializable(createToJson: false)
class Chapters {
  Chapters(this.chapters);

  List<Chapter> chapters;

  factory Chapters.fromJson(Map<String, dynamic> json) =>
      _$ChaptersFromJson(json);
}

@JsonSerializable(createToJson: false)
class Chapter {
  Chapter(this.title, this.url, this.subchapters, this.moreInfo);

  String title;
  String url;
  List<Subchapter> subchapters;
  MoreInfo? moreInfo;

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);
}

@JsonSerializable(createToJson: false)
class Subchapter {
  Subchapter(this.title, this.description, this.content, this.questions);

  String? title;
  String? description;
  List<Content>? content;
  Questions? questions;

  factory Subchapter.fromJson(Map<String, dynamic> json) =>
      _$SubchapterFromJson(json);
}

@JsonSerializable(createToJson: false)
class Content {
  Content(this.title, this.type, this.description, this.list);

  String title;
  String type;
  String? description;
  List<Item>? list;

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
}

@JsonSerializable(createToJson: false)
class Item {
  Item(this.item, this.why, this.title, this.items);

  String? item;
  String? why;
  String? title;
  List<Item>? items;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class Questions {
  Questions(this.title, this.icon, this.type, this.content);

  String title;
  String icon;
  String? url;
  String? type;
  List<Question>? content;

  factory Questions.fromJson(Map<String, dynamic> json) =>
      _$QuestionsFromJson(json);
}

@JsonSerializable(createToJson: false)
class Question {
  Question(this.question, this.type, this.answers);

  String question;
  String? type;
  List<Answer> answers;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

@JsonSerializable(createToJson: false)
class Answer {
  Answer(this.group, this.answer);

  String group;
  String answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}

@JsonSerializable(createToJson: false)
class MoreInfo {
  MoreInfo(this.title, this.list);

  String title;
  List<Info>? list;

  factory MoreInfo.fromJson(Map<String, dynamic> json) =>
      _$MoreInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class Info {
  Info(this.title);

  String title;

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
}
