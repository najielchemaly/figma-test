// FIGMA-UNRESOLVED: no semantic token bound for nodeId 10:6 (root background #080b11) — using raw hex, revisit once Figma Variables are set up
// FIGMA-UNRESOLVED: hero-card glow decorations (nodeIds 10:24 glow-accent-1, 10:25 glow-accent-2) are laid out as decorative background overlays behind the card content rather than literal column-stacked children per the IR's plain "auto" column layout — literal stacking would make the 172pt-tall card balloon to fit two ~120-140pt images, clearly contradicting both the card's declared height and the reference screenshot's subtle glow look. IR did not mark these nodes as "absolute-fallback", so this is a judgment call flagged for visibility rather than a hard FIGMA-UNRESOLVED case.
// FIGMA-UNRESOLVED: glow-accent-2 (nodeId 10:25) carries a tint (#4facfe) with no bound color token, but since the node falls back to its bundled local asset (iconHint not in the approved SF Symbol list) the raw hex is never actually rendered in code — noted for completeness, not acted on.

import SwiftUI

struct BankingBalanceHeroView: View {
    @State private var viewModel = BankingBalanceHeroViewModel()

    var body: some View {
        VStack(spacing: 0) {
            headerView
            heroContainerView
            quickActionsView
            spendingSummaryView
            transactionsSectionView
            cardBannerView
        }
        .padding(.bottom, 20)
        .background(
            // FIGMA-UNRESOLVED: no semantic token bound for nodeId 10:6 (root background #080b11) — using raw hex fallback
            Color(hex: "#080b11")
        )
    }

    // MARK: - Header

    private var headerView: some View {
        HStack {
            HStack(spacing: 8) {
                Image("ellipse")
                    .frame(width: 12, height: 12)
                Text("Arc Bank")
                    .font(.custom(Theme.fontFamilyOutfit, size: 20))
                    .fontWeight(Theme.fontWeight700)
                    .foregroundColor(Theme.colorRawFfffff)
            }
            Spacer()
            HStack(spacing: 8) {
                Text("BALANCE HERO")
                    .font(.custom(Theme.fontFamilyGeistMono, size: Theme.fontSize10))
                    .fontWeight(Theme.fontWeight600)
                    .foregroundColor(Theme.colorRaw00f2fe)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Theme.colorRaw172030)
                    .clipShape(RoundedRectangle(cornerRadius: 6))

                Button(action: { viewModel.onNotificationTapped() }) {
                    ZStack {
                        Circle()
                            .fill(Theme.colorRaw121824)
                            .frame(width: 36, height: 36)
                        Image(systemName: "bell")
                            .foregroundColor(Theme.colorRawFfffff)
                            .frame(width: 18, height: 18)
                    }
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
    }

    // MARK: - Hero balance card

    private var heroContainerView: some View {
        heroCardView
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
    }

    // NOTE: glow-accent-1 / glow-accent-2 (nodeIds 10:24, 10:25) are rendered as
    // decorative background overlays behind the card content rather than literal
    // column-stacked children — literal stacking (per the IR's plain "auto" column
    // layout) would blow the card's height far past the 172pt the design shows and
    // contradicts the subtle glow look in the reference screenshot. IR did not mark
    // these as "absolute-fallback", but this is flagged for visibility.
    private var heroCardView: some View {
        ZStack(alignment: .topTrailing) {
            Image("glow-accent-1")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .offset(x: 10, y: -20)
                .allowsHitTesting(false)
            Image("glow-accent-2")
                .resizable()
                .scaledToFit()
                .frame(width: 140, height: 140)
                .offset(x: 30, y: -10)
                .allowsHitTesting(false)

            VStack(alignment: .leading, spacing: 24) {
                accountBalanceCardContent
                availablePendingRow
            }
            .padding(24)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Theme.colorRaw1e293b, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }

    private var accountBalanceCardContent: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(viewModel.account.accountName)
                    .font(.custom(Theme.fontFamilyGeist, size: Theme.fontSize14))
                    .fontWeight(Theme.fontWeight500)
                    .foregroundColor(Theme.colorRaw8e9aa8)
                Spacer()
                Button(action: { viewModel.onCopyAccountNumberTapped() }) {
                    Image("copy")
                        .frame(width: 16, height: 16)
                }
                .buttonStyle(.plain)
            }
            Text(viewModel.account.balanceText)
                .font(.custom(Theme.fontFamilyOutfit, size: 36))
                .fontWeight(Theme.fontWeight700)
                .foregroundColor(Theme.colorRawFfffff)
        }
    }

    private var availablePendingRow: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Available")
                    .font(.custom(Theme.fontFamilyGeist, size: Theme.fontSize11))
                    .fontWeight(Theme.fontWeight400)
                    .foregroundColor(Theme.colorRaw8e9aa8)
                Text(viewModel.account.availableText)
                    .font(.custom(Theme.fontFamilyGeistMono, size: Theme.fontSize14))
                    .fontWeight(Theme.fontWeight600)
                    .foregroundColor(Theme.colorRaw00f2fe)
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 2) {
                Text("Pending")
                    .font(.custom(Theme.fontFamilyGeist, size: Theme.fontSize11))
                    .fontWeight(Theme.fontWeight400)
                    .foregroundColor(Theme.colorRaw8e9aa8)
                Text(viewModel.account.pendingText)
                    .font(.custom(Theme.fontFamilyGeistMono, size: Theme.fontSize14))
                    .fontWeight(Theme.fontWeight600)
                    .foregroundColor(Theme.colorRawFfffff)
            }
        }
    }

    // MARK: - Quick actions

    private var quickActionsView: some View {
        HStack {
            QuickActionButton(systemImageName: "arrow.up.right", label: "Send") {
                viewModel.onSendTapped()
            }
            Spacer()
            QuickActionButton(systemImageName: "arrow.down.left", label: "Request") {
                viewModel.onRequestTapped()
            }
            Spacer()
            QuickActionButton(systemImageName: "doc.text", label: "Pay Bills") {
                viewModel.onPayBillsTapped()
            }
            Spacer()
            QuickActionButton(systemImageName: "plus", label: "Deposit") {
                viewModel.onDepositTapped()
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
    }

    // MARK: - Spending summary

    private var spendingSummaryView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Monthly Spending")
                    .font(.custom(Theme.fontFamilyGeist, size: Theme.fontSize12))
                    .fontWeight(Theme.fontWeight400)
                    .foregroundColor(Theme.colorRaw8e9aa8)
                Text(viewModel.account.monthlySpendingText)
                    .font(.custom(Theme.fontFamilyOutfit, size: 15))
                    .fontWeight(Theme.fontWeight600)
                    .foregroundColor(Theme.colorRawFfffff)
            }
            Spacer()
            HStack(spacing: 4) {
                Image("trending-up")
                    .frame(width: 12, height: 12)
                Text(viewModel.account.spendingTrendText)
                    .font(.custom(Theme.fontFamilyGeist, size: Theme.fontSize12))
                    .fontWeight(Theme.fontWeight600)
                    .foregroundColor(Theme.colorRaw10b981)
            }
        }
        .padding(12)
        .background(Theme.colorRaw121824)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Theme.colorRaw1e293b, lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
    }

    // MARK: - Recent transactions

    private var transactionsSectionView: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Recent Transactions")
                    .font(.custom(Theme.fontFamilyOutfit, size: 16))
                    .fontWeight(Theme.fontWeight600)
                    .foregroundColor(Theme.colorRawFfffff)
                Spacer()
                Button(action: { viewModel.onSeeAllTransactionsTapped() }) {
                    Text("See All")
                        .font(.custom(Theme.fontFamilyGeist, size: Theme.fontSize12))
                        .fontWeight(Theme.fontWeight500)
                        .foregroundColor(Theme.colorRaw00f2fe)
                }
                .buttonStyle(.plain)
            }
            VStack(spacing: 0) {
                ForEach(viewModel.transactions) { transaction in
                    TransactionRow(transaction: transaction)
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
    }

    // MARK: - Card banner

    private var cardBannerView: some View {
        VStack {
            Button(action: { viewModel.onPaymentCardTapped() }) {
                HStack {
                    HStack(spacing: 10) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Theme.colorRaw172030)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Theme.colorRaw1e293b, lineWidth: 1)
                                )
                                .frame(width: 32, height: 20)
                            Text(viewModel.paymentCard.brand)
                                .font(.custom(Theme.fontFamilyGeistMono, size: 8))
                                .fontWeight(Theme.fontWeight700)
                                .foregroundColor(Theme.colorRaw00f2fe)
                        }
                        VStack(alignment: .leading, spacing: 1) {
                            Text(viewModel.paymentCard.name)
                                .font(.custom(Theme.fontFamilyGeist, size: Theme.fontSize12))
                                .fontWeight(Theme.fontWeight600)
                                .foregroundColor(Theme.colorRawFfffff)
                            HStack(spacing: 4) {
                                Image("ellipse-2")
                                    .frame(width: 6, height: 6)
                                Text(viewModel.paymentCard.status)
                                    .font(.custom(Theme.fontFamilyGeist, size: Theme.fontSize10))
                                    .fontWeight(Theme.fontWeight400)
                                    .foregroundColor(Theme.colorRaw8e9aa8)
                            }
                        }
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Theme.colorRaw8e9aa8)
                        .frame(width: 16, height: 16)
                }
                .padding(14)
                .background(Theme.colorRaw121824)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Theme.colorRaw1e293b, lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
    }
}

#Preview {
    BankingBalanceHeroView()
}
