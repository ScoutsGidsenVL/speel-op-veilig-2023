// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapters _$ChaptersFromJson(Map<String, dynamic> json) => Chapters(
      (json['chapters'] as List<dynamic>)
          .map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Chapter _$ChapterFromJson(Map<String, dynamic> json) => Chapter(
      json['title'] as String,
      json['url'] as String,
      (json['subchapters'] as List<dynamic>)
          .map((e) => Subchapter.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['moreInfo'] == null
          ? null
          : MoreInfo.fromJson(json['moreInfo'] as Map<String, dynamic>),
    );

Subchapter _$SubchapterFromJson(Map<String, dynamic> json) => Subchapter(
      json['title'] as String?,
      json['description'] as String?,
      (json['content'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['questions'] == null
          ? null
          : Questions.fromJson(json['questions'] as Map<String, dynamic>),
    );

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      json['title'] as String,
      json['type'] as String,
      json['description'] as String?,
      (json['list'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      json['item'] as String?,
      json['why'] as String?,
      json['title'] as String?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Questions _$QuestionsFromJson(Map<String, dynamic> json) => Questions(
      json['title'] as String,
      json['icon'] as String,
      json['type'] as String?,
      (json['content'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..url = json['url'] as String?;

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      json['question'] as String,
      json['type'] as String?,
      (json['answers'] as List<dynamic>)
          .map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      json['group'] as String,
      json['answer'] as String,
    );

MoreInfo _$MoreInfoFromJson(Map<String, dynamic> json) => MoreInfo(
      json['title'] as String,
      (json['list'] as List<dynamic>?)
          ?.map((e) => Info.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      json['title'] as String,
    );
