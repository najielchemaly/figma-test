// FIGMA-UNRESOLVED: no semantic token bound for nodeId 10:6 (root background #080b11) — using raw hex, revisit once Figma Variables are set up
// FIGMA-UNRESOLVED: hero-card glow decorations (nodeIds 10:24 glow-accent-1, 10:25 glow-accent-2) are laid out as decorative background overlays behind the card content rather than literal column-stacked children per the IR's plain "auto" column layout — literal stacking would make the 172pt-tall card balloon to fit two ~120-140pt images, clearly contradicting both the card's declared height and the reference screenshot's subtle glow look. IR did not mark these nodes as "absolute-fallback", so this is a judgment call flagged for visibility rather than a hard FIGMA-UNRESOLVED case.
// FIGMA-UNRESOLVED: glow-accent-2 (nodeId 10:25) carries a tint (#4facfe) with no bound color token, but since the node falls back to its bundled local asset (iconHint not in the approved SF Symbol list) the raw hex is never actually rendered in code — noted for completeness, not acted on.

import SwiftUI

struct TransactionRow: View {
    let transaction: Transaction

    var body: some View {
        HStack(spacing: 0) {
            HStack(spacing: 12) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Theme.colorRaw172030)
                        .frame(width: 40, height: 40)
                    Image(transaction.iconAssetName)
                        .frame(width: 18, height: 18)
                }
                VStack(alignment: .leading, spacing: 2) {
                    Text(transaction.merchantName)
                        .font(.custom(Theme.fontFamilyGeist, size: Theme.fontSize14))
                        .fontWeight(Theme.fontWeight500)
                        .foregroundColor(Theme.colorRawFfffff)
                    Text(transaction.metadata)
                        .font(.custom(Theme.fontFamilyGeist, size: Theme.fontSize12))
                        .fontWeight(Theme.fontWeight400)
                        .foregroundColor(Theme.colorRaw8e9aa8)
                }
            }
            Spacer()
            Text(transaction.amountText)
                .font(.custom(Theme.fontFamilyGeistMono, size: Theme.fontSize14))
                .fontWeight(Theme.fontWeight600)
                .foregroundColor(transaction.isCredit ? Theme.colorRaw10b981 : Theme.colorRawFfffff)
        }
        .padding(.vertical, 12)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Theme.colorRaw1e293b),
            alignment: .bottom
        )
    }
}
