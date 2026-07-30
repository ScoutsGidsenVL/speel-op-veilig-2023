# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project overview

Flutter app "Speel op Veilig" ("Play it Safe") for Scouts en Gidsen Vlaanderen: a
Dutch-only reference app of safety rules for youth activities (fire, water,
height, equipment, traffic, drugs/tobacco/alcohol, wellbeing, first aid), plus
a branch-filterable FAQ and static info pages (safe activities, insurance,
crisis situations, app guide). Package name `speelopveilig`.

Old SDK constraint (`environment.sdk: '>=2.19.2 <3.0.0'`, pre-Dart-3) — the
dependency majors in `pubspec.yaml` are correspondingly old-generation; keep
that in mind before assuming current Flutter/Dart idioms apply.

## Commands

- `flutter pub get` — install dependencies
- `flutter run` — run the app locally
- `flutter analyze` — lint (stock `flutter_lints` rules via
  `analysis_options.yaml`, no custom rules added)
- `flutter test` — run tests. Currently `test/widget_test.dart` is the
  unmodified default Flutter counter-app smoke test, unrelated to this app's
  actual UI (no counter or `+` icon exists here) — a failure here reflects
  stale boilerplate, not a regression from your changes.
- No CI is configured (no `.github/workflows`).

Codegen commands, must be re-run after editing `lib/model/chapters.dart` or
the `flutter_icons`/`flutter_native_splash` config blocks in `pubspec.yaml`:
- `flutter pub run build_runner watch --delete-conflicting-outputs` —
  regenerates `*.g.dart` JSON parsers (json_serializable)
- `flutter pub run flutter_launcher_icons` — regenerates launcher icons
- `flutter pub run flutter_native_splash:create` — regenerates splash screens

## Architecture

**State/data flow**: a single `ChangeNotifierProvider<DynamicData>` wraps the
whole app in `lib/main.dart`. `DynamicData` (`lib/model/dynamic_data.dart`)
loads all content on construction via `refreshData()`.

**Content-driven design.** Read this before touching model or content code:

- `assets/content/themas.json` is the structured domain model: chapters →
  subchapters → content blocks → items (rules), plus embedded FAQ questions.
  It's parsed via `lib/model/chapters.dart` + generated `chapters.g.dart`
  (json_serializable — never hand-edit the generated file).
- A rule/content block's `type` is one of `wet` (law) / `regel` (mandatory
  rule) / `richtlijn` (guideline) / `suggestie` (suggestion). This drives icon
  and color everywhere (`lib/widgets/custom_icon.dart`).
- Four freestanding Markdown files back the static info pages: `crisis.md`,
  `veilige_activiteit.md`, `verzekeringen.md`, `wegwijs.md`. `wegwijs.md` is
  special-cased in `lib/pages/wegwijs.dart`, which splits it on
  `## Wet` / `## Regels` / `## Richtlijnen` / `## Suggesties` headers to
  prefix each section with the matching colored icon.
- **Live content updates**: in release mode, `DynamicData.fetchAsset()` fetches
  the latest copy of each content file from a hardcoded GitHub raw URL on
  `main`, caches it via `flutter_cache_manager`, and falls back to the cache
  then the bundled asset if the fetch fails. In `kDebugMode` it always reads
  the bundled asset. This is why most recent commits are pure content edits
  (new laws, new chapters) with no build-number bump — those propagate to
  installed apps automatically without a store release. A build-number bump
  (`pubspec.yaml` `version:`) is only needed for actual code/structural
  changes, since only those require a real store release.

**Routing**: flat named routes on `MaterialApp` in `lib/main.dart`, no routing
package. Chapter pages are `Thema(name: ...)`, where `name` must match a
`url` field in `themas.json`.

**Known inconsistency**: `themas.json` currently defines 8 chapters, including
`url: "ehbo-verzorging-en-medicatie"` (first aid, added recently), but
`main.dart` only registers routes for 7 `Thema` pages — there is no
`/ehbo-verzorging-en-medicatie` route. This is a pre-existing gap, not
something introduced by your own changes; be aware of it if you touch routing
or the Home chapter list.

**Page/widget layering**:
- `lib/pages/`: `home.dart` (chapter list), `static.dart` (generic markdown
  page), `thema.dart` (one chapter's subchapters/rules), `vragen.dart` (FAQ,
  filterable by scouting age-branch/tak), `wegwijs.dart` (app usage guide).
- `lib/widgets/`: `custom_icon.dart` (theme/type → icon font glyph + color),
  `faq.dart`, `info_item.dart`, `rule_item.dart` (one rule, with optional
  "Waarom?" info dialog), `rules.dart` (renders a content block's items,
  including nested item groups).
- `lib/util.dart`: shared `markdownStyle()` (fonts/colors for
  `flutter_markdown`) and `linkHandler()` (routes internal `/`-links via
  `Navigator`, opens `http(s)/tel/mailto` externally via `url_launcher`).

## Notes

- App is Dutch-only; there is no localization framework (no l10n/intl).
- Multi-platform Flutter targets exist (android/ios/linux/macos/web/windows),
  but this is primarily an Android/iOS app.
