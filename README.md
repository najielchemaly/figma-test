# figma2native generation report

Generated 5 file(s) across swiftui for 1 frame(s) on 2026-10-27T12:00:03.262Z.

- Architecture: mvvm
- Dummy data: off
- Target package: not set — Compose files use a model-chosen package; see the dashboard/CLI --package option to fix this

## iOS (SwiftUI)

- `ios/Views/Screens/BankingBalanceHeroView.swift` (screen)
- `ios/Views/Components/QuickActionButton.swift` (component)
- `ios/Views/Components/TransactionRowView.swift` (component)
- `ios/ViewModels/BankingBalanceHeroViewModel.swift` (viewModel)
- `ios/Models/Transaction.swift` (model)

## Bundled assets

Every icon/image this run could export was downloaded and written as a real local asset, not a link to Figma — copy these folders into your actual project alongside the generated source:

- iOS: `ios/Assets.xcassets/` → merge into your Xcode project's own `Assets.xcassets`.
- Android: `android/res/drawable/` → merge into `app/src/main/res/drawable`.
- React Native: `reactNative/assets/images/` → copy into your project's own assets folder (adjust generated `require(...)`/import paths if you move it elsewhere).

An icon reported under "Run-level warnings" below as `[asset]` couldn't be bundled (download failure, or an SVG-from-MCP asset targeting Android) — the generated code renders a neutral placeholder for it instead of a broken image reference.

## Navigation

When a Figma prototype click interaction targets another frame requested in this same run, the source screen gets a real `onNavigateTo<Screen>` parameter, wired to that tap target — see `Navigation/AppNavHost.kt` (Android) / `Navigation/AppNavigation.swift` (iOS) if either was generated (only when at least one such link was resolved this run).

Real, current limitations: only REST-sourced frames are supported (the Figma MCP data source isn't verified to carry prototype interaction data); only a plain on-click "navigate" action is wired up (hover/overlay/back/URL/and other prototype actions are ignored); and a click that targets a frame **not** requested in this run is reported under "Run-level warnings" below as `[navigation]` rather than fabricated.

## Action required

### Dependencies

No missing dependencies detected from what was actually generated.

### Per-file notes (from the generated FIGMA-UNRESOLVED comments)

- `ios/Views/Screens/BankingBalanceHeroView.swift`
  - no semantic token bound for node 10:6 (root background #080b11) — using raw hex, revisit once Figma Variables are set up
  - no semantic token bound for node 10:25 (glow-accent-2 tint #4facfe) — using raw hex, revisit once Figma Variables are set up
  - hero-card (10:23) children glow-accent-1 (10:24, 120x120) and glow-accent-2 (10:25, 140x140) exceed the card's own auto-layout bounds (350x172) and are not marked absolute-fallback in the IR; rendered as a clipped decorative background glow behind the card content to match the reference screenshot instead of guessing an absolute position.
  - transaction row stroke (e.g. 81:127) is specified as a full border in the IR; rendered as a single bottom-edge divider to match the reference screenshot's continuous list dividers rather than a boxed border around each row.
  - [ir] node 10:23 (hero-card): fills present but no solid paint found (gradient/image fill?) — not translated, revisit
  - [ir] image node 10:24 (glow-accent-1) is absolutely positioned (no Auto Layout) — position is not captured in the IR's image node format, needs human review
  - [ir] image node 10:25 (glow-accent-2) is absolutely positioned (no Auto Layout) — position is not captured in the IR's image node format, needs human review

### Run-level warnings

- failed to enrich tint for image node 10:15 (Ellipse): fetch failed
- [navigation] node I80:170;10:39 (Send Action) in frame "banking-balance-hero" has a click-navigate interaction targeting Figma node 10:114, which isn't among the frames requested in this run — navigation left unwired.
- [device-chrome] omitted mobile status bar node 10:7 (status-bar) from frame "banking-balance-hero"
- [device-chrome] omitted mobile home indicator node 80:163 (Home Indicator) from frame "banking-balance-hero"
