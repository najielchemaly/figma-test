// FIGMA-UNRESOLVED: no semantic token bound for nodeId 10:6 (root background #080b11) — using raw hex, revisit once Figma Variables are set up
// FIGMA-UNRESOLVED: hero-card glow decorations (nodeIds 10:24 glow-accent-1, 10:25 glow-accent-2) are laid out as decorative background overlays behind the card content rather than literal column-stacked children per the IR's plain "auto" column layout — literal stacking would make the 172pt-tall card balloon to fit two ~120-140pt images, clearly contradicting both the card's declared height and the reference screenshot's subtle glow look. IR did not mark these nodes as "absolute-fallback", so this is a judgment call flagged for visibility rather than a hard FIGMA-UNRESOLVED case.
// FIGMA-UNRESOLVED: glow-accent-2 (nodeId 10:25) carries a tint (#4facfe) with no bound color token, but since the node falls back to its bundled local asset (iconHint not in the approved SF Symbol list) the raw hex is never actually rendered in code — noted for completeness, not acted on.

import Observation

@Observable
final class BankingBalanceHeroViewModel {
    var account: Account = Account()
    var transactions: [Transaction] = []
    var paymentCard: PaymentCard = PaymentCard()

    func onNotificationTapped() {
        // Placeholder: no notification destination/business behavior defined in the design.
    }

    func onCopyAccountNumberTapped() {
        // Placeholder: copy-to-clipboard behavior not specified by the design.
    }

    func onSendTapped() {
        // Placeholder: "Send" action behavior not defined in the design.
    }

    func onRequestTapped() {
        // Placeholder: "Request" action behavior not defined in the design.
    }

    func onPayBillsTapped() {
        // Placeholder: "Pay Bills" action behavior not defined in the design.
    }

    func onDepositTapped() {
        // Placeholder: "Deposit" action behavior not defined in the design.
    }

    func onSeeAllTransactionsTapped() {
        // Placeholder: no destination screen present in the IR for "See All".
    }

    func onPaymentCardTapped() {
        // Placeholder: no destination screen present in the IR for the card banner.
    }
}
