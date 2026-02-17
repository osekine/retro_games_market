import 'package:flutter/material.dart';
import 'package:retro_games_market/src/view/uikit/theme/app_colors.dart';
import 'package:retro_games_market/src/view/uikit/theme/app_theme_ext.dart';

import 'paywall_plan_card.dart';

class PaywallPage extends StatefulWidget {
  const PaywallPage({super.key});

  @override
  State<PaywallPage> createState() => _PaywallScreenState();
}

enum PaywallPlan { month, year }

class _PaywallScreenState extends State<PaywallPage> {
  PaywallPlan _selected = PaywallPlan.year;

  @override
  Widget build(BuildContext context) {
    final t = context.appTheme;

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        elevation: 0,
        centerTitle: true,
        title: Text('Подписка', style: Theme.of(context).textTheme.titleLarge),
        actions: [
          SizedBox(
            width: 48,
            height: 48,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close, color: AppColors.border),
              tooltip: 'Close',
            ),
          ),
          const SizedBox(width: 8),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: t.border),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              Text(
                'Полный доступ к каталогу',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),

              Text(
                'Играй без ограничений',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.25,
                ),
              ),

              const SizedBox(height: 16),

              // Plan cards (H=88dp, R=12dp, pad=16dp)
              PaywallPlanCard(
                tag: 'MONTHLY',
                title: 'Месяц',
                price: '€ X.XX',
                selected: _selected == PaywallPlan.month,
                onTap: () => setState(() => _selected = PaywallPlan.month),
              ),
              const SizedBox(height: 12),
              PaywallPlanCard(
                tag: 'YEARLY',
                title: 'Год',
                price: '€ Y.YY',
                chipText: 'SAVE 40%',
                selected: _selected == PaywallPlan.year,
                onTap: () => setState(() => _selected = PaywallPlan.year),
              ),

              const SizedBox(height: 16),

              // Small print (max 3 lines)
              Text(
                'Оплата спишется с вашего аккаунта. Подписку можно отменить в любой момент в настройках. '
                'Доступ сохраняется до конца оплаченного периода.',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.2,
                ),
              ),

              // flex space
              const Spacer(),

              // Continue (H=48dp, full width)
              SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Purchase later
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.accent,
                    foregroundColor: AppColors.onAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: t.border, width: 1),
                    ),
                  ),
                  child: Text(
                    'CONTINUE',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.onAccent,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Row(
                children: const [
                  Expanded(child: _FooterLink(text: 'Restore')),
                  SizedBox(width: 8),
                  Expanded(child: _FooterLink(text: 'Terms')),
                  SizedBox(width: 8),
                  Expanded(child: _FooterLink(text: 'Privacy')),
                ],
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;
  const _FooterLink({required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48, // touch target
      child: TextButton(
        onPressed: () {
          // later: open links / restore purchases
        },
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.accent,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
