// FIGMA-UNRESOLVED: no semantic token bound for I234:264;10:112 — using raw hex, revisit once Figma Variables are set up
// FIGMA-UNRESOLVED: node I234:264;10:112 (home indicator rectangle) uses layout: "absolute-fallback" (x: 125.5, y: 21) with no resolvable auto-layout context — rendered centered horizontally within its parent row as a best-effort approximation; see FIGMA-UNRESOLVED comment in ArcBankLoginView

import Foundation
import Observation

@Observable
final class ArcBankLoginViewModel {
    var email: String = ""
    var password: String = ""

    func signInTapped() {
        // Placeholder — no authentication/backend behavior is defined by the design yet.
    }

    func forgotPasswordTapped() {
        // Placeholder — no destination/business logic is defined by the design yet.
    }

    func signUpTapped() {
        // Placeholder — no destination/business logic is defined by the design yet.
    }
}
