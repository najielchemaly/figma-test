// FIGMA-UNRESOLVED: no semantic token bound for I234:264;10:112 — using raw hex, revisit once Figma Variables are set up
// FIGMA-UNRESOLVED: node I234:264;10:112 (home indicator rectangle) uses layout: "absolute-fallback" (x: 125.5, y: 21) with no resolvable auto-layout context — rendered centered horizontally within its parent row as a best-effort approximation; see FIGMA-UNRESOLVED comment in ArcBankLoginView

import SwiftUI

struct ArcBankLoginView: View {
    @State private var viewModel = ArcBankLoginViewModel()

    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                // Status bar
                HStack {
                    Text("9:41")
                        .font(.custom("Geist Mono", size: Theme.fontSize14))
                        .fontWeight(Theme.fontWeight600)
                        .foregroundColor(Theme.colorRawFfffff)
                    Spacer()
                    HStack(spacing: 6) {
                        Image("cellular-signal")
                            .resizable()
                            .frame(width: 18, height: 18)
                        Image("wi-fi")
                            .resizable()
                            .frame(width: 18, height: 18)
                        Image("battery")
                            .resizable()
                            .frame(width: 28, height: 20)
                    }
                }
                .padding(.horizontal, 24)
                .frame(width: 390, height: 44)

                // Brand header
                HStack(spacing: 8) {
                    Image("brand-mark")
                        .resizable()
                        .frame(width: 12, height: 12)
                    Text("Arc Bank")
                        .font(.custom(Theme.fontFamilyOutfit, size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Theme.colorRawFfffff)
                    Spacer()
                }
                .padding(.horizontal, 20)
                .frame(width: 390, height: 68)

                // Sign-in form
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Welcome back")
                            .font(.custom(Theme.fontFamilyOutfit, size: 16))
                            .fontWeight(Theme.fontWeight600)
                            .foregroundColor(Theme.colorRawFfffff)
                        Text("Sign in to manage your money with Arc Bank.")
                            .font(.custom(Theme.fontFamilyGeist, size: Theme.fontSize12))
                            .fontWeight(Theme.fontWeight400)
                            .foregroundColor(Theme.colorRaw8e9aa8)
                    }
                    .frame(width: 350, alignment: .leading)

                    VStack(spacing: 20) {
                        LoginFormField(
                            label: "Email address",
                            placeholder: "Enter your email address",
                            text: $viewModel.email
                        )
                        LoginFormField(
                            label: "Password",
                            placeholder: "Enter your password",
                            text: $viewModel.password,
                            isSecure: true
                        )
                    }
                    .frame(width: 350)

                    VStack(spacing: 20) {
                        HStack {
                            Spacer()
                            Button(action: { viewModel.forgotPasswordTapped() }) {
                                Text("Forgot password?")
                                    .font(.custom(Theme.fontFamilyGeist, size: Theme.fontSize12))
                                    .fontWeight(Theme.fontWeight500)
                                    .foregroundColor(Theme.colorRaw00f2fe)
                            }
                        }
                        .frame(width: 350, height: 16)

                        Button(action: { viewModel.signInTapped() }) {
                            Text("Sign in")
                                .font(.custom(Theme.fontFamilyGeist, size: Theme.fontSize12))
                                .fontWeight(Theme.fontWeight500)
                                .foregroundColor(Theme.colorRaw080b11)
                                .frame(width: 350, height: 52)
                        }
                        .background(Theme.colorRaw00f2fe)
                        .clipShape(RoundedRectangle(cornerRadius: 12))

                        HStack(spacing: 4) {
                            Text("New to Arc Bank?")
                                .font(.custom(Theme.fontFamilyGeist, size: Theme.fontSize11))
                                .fontWeight(Theme.fontWeight400)
                                .foregroundColor(Theme.colorRaw8e9aa8)
                            Button(action: { viewModel.signUpTapped() }) {
                                Text("Sign up")
                                    .font(.custom(Theme.fontFamilyGeist, size: Theme.fontSize12))
                                    .fontWeight(Theme.fontWeight500)
                                    .foregroundColor(Theme.colorRaw00f2fe)
                            }
                        }
                        .frame(width: 350, height: 44)
                    }
                    .frame(width: 350)
                }
                .padding(.top, 64)
                .padding(.horizontal, 20)
                .frame(width: 390, height: 492, alignment: .top)
            }
            .frame(width: 390, height: 604, alignment: .top)

            Spacer(minLength: 0)

            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    // FIGMA-UNRESOLVED: node I234:264;10:112 (home indicator rectangle) carries layout: "absolute-fallback" with x:125.5, y:21 and no resolvable auto-layout context; centering it horizontally as a best-effort approximation.
                    RoundedRectangle(cornerRadius: 100)
                        // no semantic token bound for I234:264;10:112 — using raw hex, revisit once Figma Variables are set up
                        .fill(Color(hex: "#505e70"))
                        .frame(width: 139, height: 5)
                    Spacer()
                }
                .padding(.top, 21)
                .padding(.bottom, 8)
                .frame(width: 390, height: 34)
            }
            .padding(.bottom, 20)
            .frame(width: 390, height: 54)
        }
        .frame(width: 390, height: 844)
        .background(Theme.colorRaw080b11)
    }
}

#Preview {
    ArcBankLoginView()
}
