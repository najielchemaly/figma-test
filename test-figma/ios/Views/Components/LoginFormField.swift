// FIGMA-UNRESOLVED: no semantic token bound for I234:264;10:112 — using raw hex, revisit once Figma Variables are set up
// FIGMA-UNRESOLVED: node I234:264;10:112 (home indicator rectangle) uses layout: "absolute-fallback" (x: 125.5, y: 21) with no resolvable auto-layout context — rendered centered horizontally within its parent row as a best-effort approximation; see FIGMA-UNRESOLVED comment in ArcBankLoginView

import SwiftUI

struct LoginFormField: View {
    let label: String
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .font(.custom(Theme.fontFamilyGeist, size: Theme.fontSize11))
                .fontWeight(Theme.fontWeight400)
                .foregroundColor(Theme.colorRaw8e9aa8)

            Group {
                if isSecure {
                    SecureField(
                        "",
                        text: $text,
                        prompt: Text(placeholder)
                            .font(.custom(Theme.fontFamilyGeist, size: Theme.fontSize14))
                            .foregroundColor(Theme.colorRaw8e9aa8)
                    )
                } else {
                    TextField(
                        "",
                        text: $text,
                        prompt: Text(placeholder)
                            .font(.custom(Theme.fontFamilyGeist, size: Theme.fontSize14))
                            .foregroundColor(Theme.colorRaw8e9aa8)
                    )
                }
            }
            .font(.custom(Theme.fontFamilyGeist, size: Theme.fontSize14))
            .fontWeight(Theme.fontWeight500)
            .foregroundColor(Theme.colorRawFfffff)
            .padding(.horizontal, 16)
            .frame(height: 52)
            .background(Theme.colorRaw121824)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Theme.colorRaw1e293b, lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .frame(width: 350)
    }
}
