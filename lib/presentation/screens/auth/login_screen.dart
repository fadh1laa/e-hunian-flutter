import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../app/routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: AppColors.primary50,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.space16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Column(
                children: [
                  const SizedBox(height: AppSpacing.space24),
                  _buildHeader(theme, colors),
                  const SizedBox(height: AppSpacing.space16),
                  _buildLoginCard(theme, colors),
                  const SizedBox(height: AppSpacing.space16),
                  _buildRegister(theme, colors),
                  const SizedBox(height: AppSpacing.space16),
                  _buildPrivacy(theme, colors),
                  const SizedBox(height: AppSpacing.space16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, ColorScheme colors) {
    return Column(
      children: [
        Container(
          width: AppSpacing.space48 + AppSpacing.space24,
          height: AppSpacing.space48 + AppSpacing.space24,
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(AppSpacing.space16),
            boxShadow: [
              BoxShadow(
                color: colors.primary.withValues(alpha: 0.20),
                blurRadius: AppSpacing.space16,
                offset: const Offset(0, AppSpacing.space8),
              ),
            ],
          ),
          child: Icon(
            Icons.apartment_rounded,
            color: colors.onPrimary,
            size: AppSpacing.space32,
          ),
        ),
        const SizedBox(height: AppSpacing.space16),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.space16,
            vertical: AppSpacing.space8,
          ),
          decoration: BoxDecoration(
            color: colors.secondaryContainer,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
             Icon(
                Icons.verified_rounded,
                size: AppSpacing.space16,
                color: AppColors.success500,
              ),
              const SizedBox(width: AppSpacing.space4),
              Text(
                'Portal Resmi Layanan Perumahan Publik',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: AppColors.success500,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.space8),
        Text(
          'RUSUNAWA',
          style: theme.textTheme.headlineMedium?.copyWith(
            color: colors.primary,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: AppSpacing.space4),
        Text(
          'Sistem Informasi Rumah Susun Sewa — Hunian\n'
          'Terjangkau, Nyaman & Aman',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurfaceVariant,
            height: 1.4,
          ),
        ),
        const SizedBox(height: AppSpacing.space16),
        Container(
          padding: const EdgeInsets.all(AppSpacing.space16),
          decoration: BoxDecoration(
            color: colors.primaryContainer,
            borderRadius: BorderRadius.circular(AppSpacing.space16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: AppSpacing.space32,
                height: AppSpacing.space32,
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.space8),
                ),
                child: Icon(
                  Icons.account_balance_rounded,
                  color: colors.primary,
                  size: AppSpacing.space16,
                ),
              ),
              const SizedBox(width: AppSpacing.space8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terintegrasi Dukcapil',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.space4),
                    Text(
                      'Layanan verifikasi data NIK dan KK tervalidasi '
                      'langsung demi kemudahan verifikasi unit Anda.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLoginCard(ThemeData theme, ColorScheme colors) {
    return Card(
      color: colors.surface,
      elevation: 2,
      shadowColor: colors.shadow.withValues(alpha: 0.08),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.space16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.space24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masuk ke Akun',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppSpacing.space4),
            Text(
              'Akses permohonan sewa, cek status, dan tagihan bulanan.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.space24),
            _fieldLabel(theme, 'Nomor HP atau Email', 'Wajib diisi'),
            const SizedBox(height: AppSpacing.space8),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'contoh: 08123456789 / nama@email.com',
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(height: AppSpacing.space16),
            _fieldLabel(theme, 'Kata Sandi', null),
            const SizedBox(height: AppSpacing.space8),
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                hintText: 'Masukkan kata sandi',
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                suffixIcon: IconButton(
                  tooltip: 'Tampilkan kata sandi',
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.space8),
            Row(
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value ?? false;
                    });
                  },
                ),
                Expanded(
                  child: Text('Ingat saya', style: theme.textTheme.bodySmall),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Lupa Password?'),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.space8),
            SizedBox(
              width: double.infinity,
              height: AppSpacing.space48,
              child: FilledButton.icon(
                onPressed: () {
                  context.go(AppRoutes.home);
                },
                icon: const Icon(Icons.arrow_forward_rounded),
                label: const Text('Masuk'),
              ),
            ),
            const SizedBox(height: AppSpacing.space16),
            Row(
              children: [
                Expanded(child: Divider(color: colors.outlineVariant)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.space8,
                  ),
                  child: Text(
                    'atau masuk dengan',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                ),
                Expanded(child: Divider(color: colors.outlineVariant)),
              ],
            ),
            const SizedBox(height: AppSpacing.space16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.badge_outlined),
                    label: const Text('NIK Digital'),
                  ),
                ),
                const SizedBox(width: AppSpacing.space8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.g_mobiledata_rounded),
                    label: const Text('Google'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _fieldLabel(ThemeData theme, String label, String? trailing) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        if (trailing != null)
          Text(
            trailing,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
      ],
    );
  }

  Widget _buildRegister(ThemeData theme, ColorScheme colors) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Text(
          'Belum memiliki akun? ',
          style: theme.textTheme.bodySmall?.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text('Daftar Akun Baru'),
        ),
      ],
    );
  }

  Widget _buildPrivacy(ThemeData theme, ColorScheme colors) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.space16,
        vertical: AppSpacing.space8,
      ),
      decoration: BoxDecoration(
        color: colors.primaryContainer,
        borderRadius: BorderRadius.circular(AppSpacing.space16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shield_outlined,
            size: AppSpacing.space16,
            color: colors.onSurfaceVariant,
          ),
          const SizedBox(width: AppSpacing.space8),
          Flexible(
            child: Text(
              'Kerahasiaan data warga dilindungi UU Perlindungan '
              'Data Pribadi No. 27/2022',
              textAlign: TextAlign.center,
              style: theme.textTheme.labelSmall?.copyWith(
                color: colors.onSurfaceVariant,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
