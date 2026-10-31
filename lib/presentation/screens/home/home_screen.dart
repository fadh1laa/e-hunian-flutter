import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FF),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 390),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.space16,
                      AppSpacing.space16,
                      AppSpacing.space16,
                      AppSpacing.space16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _header(),
                        const SizedBox(height: 16),
                        _searchBar(),
                        const SizedBox(height: 12),
                        _promotionBanner(),
                        const SizedBox(height: 16),
                        _serviceSection(),
                        const SizedBox(height: 18),
                        _nearbySection(context),
                        const SizedBox(height: 16),
                        _documentBanner(),
                        const SizedBox(height: 20),
                        _announcementSection(),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ),
                _bottomNavigation(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _header() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Halo, Selamat Datang! 👋',
                style: TextStyle(fontSize: 12, color: Color(0xFF5F6270)),
              ),
              SizedBox(height: 3),
              Text(
                'Bambang\nPrasetyo',
                style: TextStyle(
                  fontSize: 20,
                  height: 1.05,
                  fontWeight: FontWeight.w700,
                  color: AppColors.neutral800,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 2),
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
          decoration: BoxDecoration(
            color: const Color(0xFF6EE7B7),
            borderRadius: BorderRadius.circular(999),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.verified_rounded, size: 14, color: Color(0xFF047857)),
              SizedBox(width: 5),
              Text(
                'Terverifikasi MBR',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF065F46),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // SEARCH
  // ============================================================

  Widget _searchBar() {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Row(
        children: [
          SizedBox(width: 12),
          Icon(Icons.search_rounded, color: AppColors.neutral400, size: 22),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'Cari rusunawa, lokasi, tipe unit...',
              style: TextStyle(fontSize: 12, color: AppColors.neutral600),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 6),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.primary100,
              child: Icon(
                Icons.tune_rounded,
                color: AppColors.primary700,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PROMOTION
  // ============================================================

  Widget _promotionBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF173FAE), Color(0xFF2563EB), Color(0xFF075985)],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -8,
            top: 6,
            child: Icon(
              Icons.apartment_rounded,
              size: 90,
              color: Colors.white.withValues(alpha: 0.10),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6EE7B7),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: const Text(
                      '● Subsidi Pemprov DKI',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF065F46),
                      ),
                    ),
                  ),
                  const SizedBox(width: 7),
                  const Text(
                    'Gelombang II',
                    style: TextStyle(fontSize: 9, color: Colors.white70),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const SizedBox(
                width: 260,
                child: Text(
                  'Pendaftaran Rusunawa\nMarunda & Pasar Rumput\nDibuka!',
                  style: TextStyle(
                    fontSize: 19,
                    height: 1.18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(
                width: 300,
                child: Text(
                  'Dapatkan subsidi sewa hingga 40% bagi Masyarakat '
                  'Berpenghasilan Rendah (MBR). Kuota terbatas untuk 240 unit.',
                  style: TextStyle(
                    fontSize: 10,
                    height: 1.45,
                    color: Colors.white70,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month_rounded,
                    size: 14,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Batas: 31 Maret 2025',
                    style: TextStyle(fontSize: 9, color: Colors.white),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          'Lihat Info',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: AppColors.neutral800,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 14,
                          color: AppColors.neutral800,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SERVICES
  // ============================================================

  Widget _serviceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Ringkasan Layanan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.neutral800,
                ),
              ),
            ),
            Text(
              'Real-time',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: AppColors.success500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _serviceCard(
                icon: Icons.apartment_rounded,
                iconBackground: AppColors.primary100,
                iconColor: AppColors.primary700,
                badge: 'Hari ini',
                badgeColor: AppColors.primary50,
                badgeTextColor: AppColors.primary700,
                value: '142 Unit',
                description: 'di 8 Rusunawa Aktif',
                action: 'Jelajahi Unit',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _serviceCard(
                icon: Icons.assignment_turned_in_rounded,
                iconBackground: const Color(0xFFFFF1C7),
                iconColor: const Color(0xFFB77900),
                badge: 'Proses',
                badgeColor: const Color(0xFFFFF7D6),
                badgeTextColor: const Color(0xFFB45309),
                value: '1 Berkas',
                description: 'Tahap Verifikasi NIK',
                action: 'Pantau Status',
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _serviceCard(
                icon: Icons.payments_rounded,
                iconBackground: AppColors.success100,
                iconColor: AppColors.success500,
                badge: 'Lunas',
                badgeColor: const Color(0xFF6EE7B7),
                badgeTextColor: const Color(0xFF047857),
                value: 'Rp 0',
                description: 'Bebas Tunggakan',
                action: 'Riwayat Sewa',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _serviceCard(
                icon: Icons.support_agent_rounded,
                iconBackground: const Color(0xFFE0E7FF),
                iconColor: AppColors.primary700,
                badge: '24 Jam',
                badgeColor: const Color(0xFFE0E7FF),
                badgeTextColor: AppColors.primary700,
                value: 'Lapor Cepat',
                description: 'Keluhan & Perbaikan',
                action: 'Buat Laporan',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _serviceCard({
    required IconData icon,
    required Color iconBackground,
    required Color iconColor,
    required String badge,
    required Color badgeColor,
    required Color badgeTextColor,
    required String value,
    required String description,
    required String action,
  }) {
    return Container(
      height: 126,
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.035),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: iconBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 18),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  badge,
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                    color: badgeTextColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: AppColors.neutral800,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            description,
            style: const TextStyle(fontSize: 9, color: AppColors.neutral600),
          ),
          const Spacer(),
          Container(height: 1, color: AppColors.neutral100),
          const SizedBox(height: 5),
          Text(
            '$action ›',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w600,
              color: AppColors.success500,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // NEARBY
  // ============================================================

  Widget _nearbySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Expanded(
              child: Text(
                'Rusunawa Terdekat',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.neutral800,
                ),
              ),
            ),
            Text(
              'Semua ›',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: AppColors.primary700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        const Text(
          'Berdasarkan lokasi domisili Jakarta',
          style: TextStyle(fontSize: 10, color: AppColors.neutral600),
        ),
        const SizedBox(height: 9),
        SizedBox(
          height: 277,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _housingCard(
                context,
                title: 'Rusunawa Pasar Rumput',
                location: 'Jl. Sultan Agung, Setiabudi, Jakarta Selatan',
                price: '650.000',
                available: '38 Unit Tersedia',
                rating: '4.8',
                color: const Color(0xFFDBEAFE),
              ),
              const SizedBox(width: 10),
              _housingCard(
                context,
                title: 'Rusunawa Pulogebang',
                location: 'Dekat Terminal Pulogebang',
                price: '520.000',
                available: '14 Unit Tersedia',
                rating: '4.7',
                color: const Color(0xFFD1FAE5),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // DOCUMENT
  // ============================================================

    Widget _documentBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFEDE9FE),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFF047857),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.description_outlined,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Syarat Berkas MBR 2025',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.neutral800,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'KTP DKI, KK, Slip Gaji & PM-1 Kelurahan',
                  style: TextStyle(fontSize: 10, color: AppColors.neutral600),
                ),
              ],
            ),
          ),
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.download_rounded,
              size: 20,
              color: Color(0xFF047857),
            ),
          ),
        ],
      ),
    );
  }

  Widget _housingCard(
    BuildContext context, {
    required String title,
    required String location,
    required String price,
    required String available,
    required String rating,
    required Color color,
  }) {
    final imageUrl = title == 'Rusunawa Pasar Rumput'
        ? 'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?auto=format&fit=crop&w=800&q=85'
        : 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=800&q=85';

    return SizedBox(
      width: 258,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 142,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: color,
                        child: const Icon(
                          Icons.apartment_rounded,
                          size: 65,
                          color: AppColors.primary300,
                        ),
                      );
                    },
                  ),

                  // Lapisan tipis agar badge tetap terbaca
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.12),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: 9,
                    left: 9,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF6EE7B7),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        '● $available',
                        style: const TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF065F46),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 9,
                    right: 9,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            size: 12,
                            color: Color(0xFFF59E0B),
                          ),
                          const SizedBox(width: 2),
                          Text(
                            rating,
                            style: const TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 9, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'JAKARTA BARAT',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF047857),
                    ),
                  ),
                  const SizedBox(height: 4),

                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.neutral800,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 13,
                        color: AppColors.neutral400,
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 9,
                            color: AppColors.neutral600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Tarif Mulai',
                    style: TextStyle(fontSize: 8, color: AppColors.neutral400),
                  ),

                  Row(
                    children: [
                      Text(
                        'Rp $price',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary700,
                        ),
                      ),
                      const Text(
                        '/bln',
                        style: TextStyle(
                          fontSize: 9,
                          color: AppColors.neutral600,
                        ),
                      ),
                      const Spacer(),
                     GestureDetector(
                        onTap: () {
                          context.push(AppRoutes.detailRusunawa);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary100,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: const Text(
                            'Detail',
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // ANNOUNCEMENTS
  // ============================================================

  Widget _announcementSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Expanded(
              child: Text(
                'Pengumuman Terkini',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.neutral800,
                ),
              ),
            ),
            Text(
              'Lihat Arsip',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: AppColors.primary700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _announcementCard(
          day: '12',
          month: 'MAR',
          badge: 'Resmi',
          organization: 'Dinas Perumahan Rakyat',
          title: 'Jadwal Pengundian Nomor Unit Rusunawa Periode Maret 2025',
          description: 'Dilaksanakan secara terbuka dan live streaming di...',
        ),
        const SizedBox(height: 8),
        _announcementCard(
          day: '10',
          month: 'MAR',
          badge: 'Pemeliharaan',
          organization: 'UPRS Rusunawa',
          title: 'Perawatan Rutin Lift Tower C dan Pembersihan Tandon Air',
          description: 'Estimasi pengerjaan pukul 09:00 - 15:00 WIB,...',
        ),
      ],
    );
  }

  Widget _announcementCard({
    required String day,
    required String month,
    required String badge,
    required String organization,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 43,
            height: 49,
            decoration: BoxDecoration(
              color: AppColors.primary50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  month,
                  style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary700,
                  ),
                ),
                Text(
                  day,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.neutral800,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary100,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        badge,
                        style: const TextStyle(
                          fontSize: 7,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        organization,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 8,
                          color: AppColors.neutral600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.neutral800,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 8,
                    color: AppColors.neutral600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BOTTOM NAVIGATION
  // ============================================================

  Widget _bottomNavigation() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 62,
          child: Row(
            children: [
              _bottomItem(
                icon: Icons.home_rounded,
                label: 'Home',
                active: true,
              ),
              _bottomItem(icon: Icons.apartment_rounded, label: 'Hunian'),
              _bottomItem(icon: Icons.assignment_rounded, label: 'Pengajuan'),
              _bottomItem(icon: Icons.person_outline_rounded, label: 'Profil'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomItem({
    required IconData icon,
    required String label,
    bool active = false,
  }) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
            color: active ? AppColors.primary700 : AppColors.neutral400,
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              fontSize: 8,
              fontWeight: active ? FontWeight.w700 : FontWeight.w500,
              color: active ? AppColors.primary700 : AppColors.neutral400,
            ),
          ),
        ],
      ),
    );
  }
}

