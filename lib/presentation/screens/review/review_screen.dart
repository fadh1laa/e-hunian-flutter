
import 'package:flutter/material.dart';
import '../success/success_screen.dart';
import '../../../app/theme/app_colors.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  bool agreement = false;

  // ============================================================
  // GAMBAR RUSUNAWA
  // Menggunakan gambar online, tidak perlu download / assets.
  // ============================================================

  static const String rusunawaImage =
      'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00'
      '?auto=format&fit=crop&w=900&q=85';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E7EF),

      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 390,
          ),

          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFFF9F7FF),

            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),

                      padding: const EdgeInsets.fromLTRB(
                        16,
                        12,
                        16,
                        24,
                      ),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [
                          _topNavigation(),

                          const SizedBox(height: 12),

                          _applicationHeader(),

                          const SizedBox(height: 14),

                          _unitCard(),

                          const SizedBox(height: 14),

                          _stepProgress(),

                          const SizedBox(height: 20),

                          _sectionTitle(),

                          const SizedBox(height: 12),

                          _applicantCard(),

                          const SizedBox(height: 12),

                          _documentCard(),

                          const SizedBox(height: 12),

                          _agreementCard(),
                        ],
                      ),
                    ),
                  ),

                  _bottomAction(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // TOP NAVIGATION
  // ============================================================

  Widget _topNavigation() {
    return Row(
      children: [
        _circleButton(
          icon: Icons.arrow_back_rounded,
          onTap: () {
            Navigator.of(context).maybePop();
          },
        ),

        const Spacer(),

        _circleButton(
          icon: Icons.help_outline_rounded,
          onTap: _showInfoDialog,
        ),
      ],
    );
  }

  Widget _circleButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,

        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,

          border: Border.all(
            color: const Color(0xFFE4E7EF),
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),

        child: Icon(
          icon,
          size: 20,
          color: const Color(0xFF172033),
        ),
      ),
    );
  }

  // ============================================================
  // APPLICATION HEADER
  // ============================================================

  Widget _applicationHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 9,
            vertical: 5,
          ),

          decoration: BoxDecoration(
            color: const Color(0xFFD9F8ED),
            borderRadius: BorderRadius.circular(999),
          ),

          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle_rounded,
                size: 13,
                color: Color(0xFF008B68),
              ),

              SizedBox(width: 5),

              Text(
                'Form Pengajuan',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF008B68),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 7),

        const Text(
          'Konfirmasi Pengajuan',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Color(0xFF172033),
          ),
        ),

        const SizedBox(height: 3),

        const Text(
          'Periksa kembali data pengajuan sewa hunian Anda.',
          style: TextStyle(
            fontSize: 10,
            color: Color(0xFF737B8C),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // UNIT CARD
  // ============================================================

  Widget _unitCard() {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(17),

        border: Border.all(
          color: const Color(0xFFE5E7EF),
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xFFE8EDFF),
                  borderRadius: BorderRadius.circular(8),
                ),

                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.apartment_rounded,
                      size: 12,
                      color: Color(0xFF1745A8),
                    ),

                    SizedBox(width: 4),

                    Text(
                      'Unit Terpilih',
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1745A8),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              const Column(
                crossAxisAlignment:
                    CrossAxisAlignment.end,
                children: [
                  Text(
                    'Rp 650.000',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0039A6),
                    ),
                  ),

                  Text(
                    '/bulan',
                    style: TextStyle(
                      fontSize: 8,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 10),

          // ====================================================
          // GAMBAR RUSUNAWA
          // Sama gaya dengan halaman Detail.
          // ====================================================

          ClipRRect(
            borderRadius: BorderRadius.circular(13),

            child: SizedBox(
              width: double.infinity,
              height: 120,

              child: Stack(
                fit: StackFit.expand,

                children: [
                  Image.network(
                    rusunawaImage,
                    fit: BoxFit.cover,

                    errorBuilder:
                        (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFFE8EDFF),

                        child: const Center(
                          child: Icon(
                            Icons.apartment_rounded,
                            size: 42,
                            color: Color(0xFF3157B8),
                          ),
                        ),
                      );
                    },
                  ),

                  // Overlay tipis
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,

                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.45),
                        ],
                      ),
                    ),
                  ),

                  // Badge verifikasi
                  Positioned(
                    left: 9,
                    top: 9,

                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 5,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white.withValues(
                          alpha: 0.94,
                        ),

                        borderRadius:
                            BorderRadius.circular(999),
                      ),

                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.verified_rounded,
                            size: 11,
                            color: Color(0xFF008B68),
                          ),

                          SizedBox(width: 4),

                          Text(
                            'Terverifikasi Pemprov',
                            style: TextStyle(
                              fontSize: 7.5,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF008B68),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Nomor foto
                  Positioned(
                    right: 9,
                    bottom: 9,

                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 5,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.black.withValues(
                          alpha: 0.55,
                        ),

                        borderRadius:
                            BorderRadius.circular(999),
                      ),

                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.photo_library_outlined,
                            size: 11,
                            color: Colors.white,
                          ),

                          SizedBox(width: 4),

                          Text(
                            '1 / 5 Foto',
                            style: TextStyle(
                              fontSize: 7.5,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Rusunawa Pasar Rumput',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: Color(0xFF172033),
            ),
          ),

          const SizedBox(height: 3),

          const Text(
            'Tower B • Unit B-0304',
            style: TextStyle(
              fontSize: 9,
              color: Color(0xFF697386),
            ),
          ),

          const SizedBox(height: 9),

          Row(
            children: [
              _unitInfo(
                Icons.layers_outlined,
                'Lantai 3',
              ),

              const SizedBox(width: 13),

              _unitInfo(
                Icons.square_foot_rounded,
                'Tipe 36 m²',
              ),

              const SizedBox(width: 13),

              _unitInfo(
                Icons.bed_outlined,
                '2 KT',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _unitInfo(
    IconData icon,
    String text,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 11,
          color: const Color(0xFF64748B),
        ),

        const SizedBox(width: 3),

        Text(
          text,
          style: const TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.w600,
            color: Color(0xFF4B5565),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // STEP PROGRESS
  // ============================================================

  Widget _stepProgress() {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: const Color(0xFFE9EDFF),
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Langkah 4 dari 4',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF172033),
                ),
              ),

              const Spacer(),

              Text(
                '100% Selesai',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 11),

          Row(
            children: [
              _step(
                '✓',
                'Data Diri',
                completed: true,
              ),

              _stepLine(
                completed: true,
              ),

              _step(
                '✓',
                'Pilih Unit',
                completed: true,
              ),

              _stepLine(
                completed: true,
              ),

              _step(
                '✓',
                'Unggah Dok.',
                completed: true,
              ),

              _stepLine(
                completed: true,
              ),

              _step(
                '4',
                'Konfirmasi',
                active: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _step(
    String number,
    String label, {
    bool completed = false,
    bool active = false,
  }) {
    return SizedBox(
      width: 50,

      child: Column(
        children: [
          Container(
            width: 27,
            height: 27,

            alignment: Alignment.center,

            decoration: BoxDecoration(
              color: completed
                  ? const Color(0xFF008B68)
                  : active
                      ? AppColors.primary700
                      : const Color(0xFFDCE3F8),

              shape: BoxShape.circle,
            ),

            child: Text(
              number,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w800,
                color: completed || active
                    ? Colors.white
                    : const Color(0xFF8992A8),
              ),
            ),
          ),

          const SizedBox(height: 4),

          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,

            style: TextStyle(
              fontSize: 7,
              fontWeight: FontWeight.w700,
              color: active
                  ? AppColors.primary700
                  : const Color(0xFF526071),
            ),
          ),
        ],
      ),
    );
  }

  Widget _stepLine({
    bool completed = false,
  }) {
    return Expanded(
      child: Container(
        height: 2,

        margin: const EdgeInsets.only(
          bottom: 17,
        ),

        color: completed
            ? const Color(0xFF008B68)
            : const Color(0xFFDCE3F8),
      ),
    );
  }

  // ============================================================
  // SECTION TITLE
  // ============================================================

  Widget _sectionTitle() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          'Ringkasan Pengajuan',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Color(0xFF172033),
          ),
        ),

        SizedBox(height: 4),

        Text(
          'Pastikan seluruh data berikut sudah benar sebelum mengajukan sewa.',
          style: TextStyle(
            fontSize: 9,
            color: Color(0xFF6B7280),
            height: 1.4,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // APPLICANT CARD
  // ============================================================

  Widget _applicantCard() {
    return _whiteCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              _iconBox(
                Icons.badge_outlined,
              ),

              const SizedBox(width: 9),

              const Expanded(
                child: Text(
                  'Data Pemohon',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF172033),
                  ),
                ),
              ),

              _statusBadge(
                'Terverifikasi',
                const Color(0xFFD9F8ED),
                const Color(0xFF008B68),
              ),
            ],
          ),

          const SizedBox(height: 11),

          Container(
            width: double.infinity,

            padding: const EdgeInsets.all(10),

            decoration: BoxDecoration(
              color: const Color(0xFFF0F2FF),
              borderRadius: BorderRadius.circular(12),
            ),

            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _dataItem(
                        'Nama Lengkap',
                        'Bambang Prasetyo',
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: _dataItem(
                        'NIK',
                        '3174********0002',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 11),

                Row(
                  children: [
                    Expanded(
                      child: _dataItem(
                        'Jumlah Keluarga',
                        '3 Jiwa (Istri & 1 Anak)',
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: _dataItem(
                        'Status Pekerjaan',
                        'Karyawan Swasta (MBR)',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dataItem(
    String label,
    String value,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 7,
            color: Color(0xFF7B8495),
          ),
        ),

        const SizedBox(height: 3),

        Text(
          value,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w700,
            color: Color(0xFF273043),
            height: 1.3,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // DOCUMENT CARD
  // ============================================================

  Widget _documentCard() {
    return _whiteCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              _iconBox(
                Icons.folder_copy_outlined,
              ),

              const SizedBox(width: 9),

              const Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    Text(
                      'Dokumen Persyaratan',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF172033),
                      ),
                    ),

                    SizedBox(height: 2),

                    Text(
                      '4 dokumen telah diunggah',
                      style: TextStyle(
                        fontSize: 8,
                        color: Color(0xFF7B8495),
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(
                Icons.check_circle_rounded,
                color: Color(0xFF008B68),
                size: 19,
              ),
            ],
          ),

          const SizedBox(height: 11),

          _documentItem(
            Icons.badge_outlined,
            'Foto e-KTP Pemohon',
            'ktp_bambang-prasetyo.jpg • 1.8 MB',
          ),

          const SizedBox(height: 7),

          _documentItem(
            Icons.family_restroom_rounded,
            'Kartu Keluarga (KK)',
            'kartu_keluarga_2024.pdf • 2.4 MB',
          ),

          const SizedBox(height: 7),

          _documentItem(
            Icons.description_outlined,
            'Surat PM1 Belum Punya Rumah',
            'surat_pm1.pdf • 850 KB',
          ),

          const SizedBox(height: 7),

          _documentItem(
            Icons.receipt_long_outlined,
            'Slip Gaji / Ket. Penghasilan',
            'slip_gaji_2026.pdf • 1.2 MB',
          ),
        ],
      ),
    );
  }

  Widget _documentItem(
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Container(
      padding: const EdgeInsets.all(8),

      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FC),
        borderRadius: BorderRadius.circular(10),

        border: Border.all(
          color: const Color(0xFFE9EBF3),
        ),
      ),

      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,

            decoration: BoxDecoration(
              color: const Color(0xFFE8EDFF),
              borderRadius: BorderRadius.circular(9),
            ),

            child: Icon(
              icon,
              size: 17,
              color: AppColors.primary700,
            ),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF273043),
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    fontSize: 7,
                    color: Color(0xFF7B8495),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 6),

          const Icon(
            Icons.check_circle_rounded,
            color: Color(0xFF008B68),
            size: 17,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // AGREEMENT
  // ============================================================

  Widget _agreementCard() {
    return GestureDetector(
      onTap: () {
        setState(() {
          agreement = !agreement;
        });
      },

      child: Container(
        width: double.infinity,

        padding: const EdgeInsets.all(11),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(14),

          border: Border.all(
            color: agreement
                ? AppColors.primary700
                : const Color(0xFFE7E9F1),
          ),
        ),

        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            IgnorePointer(
              child: Checkbox(
                value: agreement,
                onChanged: (_) {},
                activeColor: AppColors.primary700,

                materialTapTargetSize:
                    MaterialTapTargetSize.shrinkWrap,

                visualDensity:
                    VisualDensity.compact,
              ),
            ),

            const SizedBox(width: 3),

            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 5),

                child: Text(
                  'Saya menyatakan bahwa seluruh data dan dokumen yang saya lampirkan adalah benar, sah, dan siap diverifikasi oleh Dinas Perumahan Rakyat & Kawasan Permukiman.',
                  style: TextStyle(
                    fontSize: 8.5,
                    color: Color(0xFF4B5565),
                    height: 1.45,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // BOTTOM ACTION
  // ============================================================

  Widget _bottomAction() {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.fromLTRB(
        16,
        9,
        16,
        12,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFFF9F7FF),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.07,
            ),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),

      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 45,

              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(context).maybePop();
                },

                icon: const Icon(
                  Icons.arrow_back_rounded,
                  size: 15,
                ),

                label: const Text(
                  'Kembali',
                ),

                style: OutlinedButton.styleFrom(
                  foregroundColor:
                      const Color(0xFF172033),

                  backgroundColor:
                      const Color(0xFFE9EDFF),

                  side: BorderSide.none,

                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(13),
                  ),

                  textStyle: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 9),

          Expanded(
            flex: 2,

            child: SizedBox(
              height: 45,

              child: ElevatedButton(
               onPressed: _submitApplication,

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      AppColors.primary700,

                  disabledBackgroundColor:
                      const Color(0xFFB8C4E5),

                  foregroundColor: Colors.white,

                  elevation: 0,

                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(13),
                  ),

                  textStyle: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                child: const Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [
                    Text(
                      'Ajukan Sewa',
                    ),

                    SizedBox(width: 5),

                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // HELPERS
  // ============================================================

  Widget _whiteCard({
    required Widget child,
  }) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(16),

        border: Border.all(
          color: const Color(0xFFE7E9F1),
        ),
      ),

      child: child,
    );
  }

  Widget _iconBox(
    IconData icon,
  ) {
    return Container(
      width: 34,
      height: 34,

      decoration: BoxDecoration(
        color: const Color(0xFFE8EDFF),
        borderRadius: BorderRadius.circular(9),
      ),

      child: Icon(
        icon,
        size: 17,
        color: AppColors.primary700,
      ),
    );
  }

  Widget _statusBadge(
    String text,
    Color background,
    Color foreground,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 4,
      ),

      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
      ),

      child: Text(
        text,
        style: TextStyle(
          fontSize: 7,
          fontWeight: FontWeight.w800,
          color: foreground,
        ),
      ),
    );
  }

  // ============================================================
  // SUBMIT
  // ============================================================

void _submitApplication() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const SuccessScreen()));
  }

  
  // ============================================================
  // INFO
  // ============================================================

  void _showInfoDialog() {
    showDialog<void>(
      context: context,

      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20),
          ),

          title: const Text(
            'Konfirmasi Pengajuan',
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),

          content: const Text(
            'Periksa unit, data pemohon, dan seluruh dokumen sebelum menekan tombol Ajukan Sewa.',
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                'Mengerti',
              ),
            ),
          ],
        );
      },
    );
  }
}