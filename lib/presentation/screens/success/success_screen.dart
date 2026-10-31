
import 'package:flutter/material.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  // ============================================================
  // IMAGE URL
  // Tidak perlu download / assets.
  // ============================================================

  static const String reviewPhoto1 =
      'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c'
      '?auto=format&fit=crop&w=700&q=80';

  static const String reviewPhoto2 =
      'https://images.unsplash.com/photo-1600566753190-17f0baa2a6c3'
      '?auto=format&fit=crop&w=700&q=80';

  static const String avatar1 =
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330'
      '?auto=format&fit=crop&w=200&q=80';

  static const String avatar2 =
      'https://images.unsplash.com/photo-1500648767791-00dcc994a43e'
      '?auto=format&fit=crop&w=200&q=80';

  static const String avatar3 =
      'https://images.unsplash.com/photo-1531123897727-8f129e1688ce'
      '?auto=format&fit=crop&w=200&q=80';

  int selectedFilter = 0;

  final List<String> filters = [
    'Semua (124)',
    'Dengan Foto (48)',
    'Bintang 5 (102)',
    'Bintang 4 (15)',
  ];

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
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),

                padding: const EdgeInsets.fromLTRB(
                  16,
                  20,
                  16,
                  30,
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    _buildBreadcrumb(),

                    const SizedBox(height: 6),

                    _buildTitle(),

                    const SizedBox(height: 3),

                    _buildLocation(),

                    const SizedBox(height: 6),

                    _buildVerifiedBadge(),

                    const SizedBox(height: 10),

                    _buildRatingSummary(),

                    const SizedBox(height: 16),

                    _buildAspectTitle(),

                    const SizedBox(height: 8),

                    _buildAspectRatings(),

                    const SizedBox(height: 16),

                    _buildWriteReviewBanner(),

                    const SizedBox(height: 20),

                    _buildCommunityHeader(),

                    const SizedBox(height: 8),

                    _buildFilters(),

                    const SizedBox(height: 12),

                    _buildReviewOne(),

                    const SizedBox(height: 14),

                    _buildReviewTwo(),

                    const SizedBox(height: 14),

                    _buildReviewThree(),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // BREADCRUMB
  // ============================================================

  Widget _buildBreadcrumb() {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 10,
          color: Color(0xFF596273),
        ),

        children: [
          TextSpan(
            text: 'Katalog Rusun',
          ),

          TextSpan(
            text: '  ›  ',
            style: TextStyle(
              color: Color(0xFF9AA2B1),
            ),
          ),

          TextSpan(
            text: 'Ulasan & Rating',
            style: TextStyle(
              color: Color(0xFF1745A8),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // TITLE
  // ============================================================

  Widget _buildTitle() {
    return const Text(
      'Rusunawa Pasar Rumput',
      style: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w800,
        color: Color(0xFF172033),
      ),
    );
  }

  // ============================================================
  // LOCATION
  // ============================================================

  Widget _buildLocation() {
    return const Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          size: 14,
          color: Color(0xFFE53935),
        ),

        SizedBox(width: 3),

        Text(
          'Setiabudi, Jakarta Selatan',
          style: TextStyle(
            fontSize: 10,
            color: Color(0xFF697386),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // VERIFIED
  // ============================================================

  Widget _buildVerifiedBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFF74E6BC),
        borderRadius: BorderRadius.circular(999),
      ),

      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.verified_rounded,
            size: 12,
            color: Color(0xFF006B52),
          ),

          SizedBox(width: 4),

          Text(
            'Terverifikasi Pemprov',
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w800,
              color: Color(0xFF006B52),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // RATING SUMMARY
  // ============================================================

  Widget _buildRatingSummary() {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.fromLTRB(
        16,
        14,
        16,
        13,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),

        border: Border.all(
          color: const Color(0xFFE7E9F1),
        ),
      ),

      child: Column(
        children: [
          Container(
            width: double.infinity,

            padding: const EdgeInsets.symmetric(
              vertical: 14,
            ),

            decoration: BoxDecoration(
              color: const Color(0xFFF0F2FF),
              borderRadius: BorderRadius.circular(12),
            ),

            child: Column(
              children: [
                const Text(
                  '4.8',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF123B9A),
                  ),
                ),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: List.generate(
                    5,
                    (index) {
                      return const Icon(
                        Icons.star_rounded,
                        size: 17,
                        color: Color(0xFFFFA000),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 2),

                const Text(
                  '124 Ulasan Warga',
                  style: TextStyle(
                    fontSize: 9,
                    color: Color(0xFF596273),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 13),

          _ratingBar(
            '5',
            '82%',
            0.82,
          ),

          _ratingBar(
            '4',
            '12%',
            0.12,
          ),

          _ratingBar(
            '3',
            '4%',
            0.04,
          ),

          _ratingBar(
            '2',
            '1%',
            0.01,
          ),

          _ratingBar(
            '1',
            '1%',
            0.01,
          ),
        ],
      ),
    );
  }

  Widget _ratingBar(
    String star,
    String percentage,
    double value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),

      child: Row(
        children: [
          SizedBox(
            width: 42,

            child: Text(
              '$star Bintang',
              textAlign: TextAlign.right,

              style: const TextStyle(
                fontSize: 8,
                color: Color(0xFF4B5565),
              ),
            ),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(999),

              child: LinearProgressIndicator(
                value: value,
                minHeight: 7,

                backgroundColor:
                    const Color(0xFFE7EBFA),

                valueColor:
                    const AlwaysStoppedAnimation<
                        Color>(
                  Color(0xFF123B9A),
                ),
              ),
            ),
          ),

          const SizedBox(width: 8),

          SizedBox(
            width: 30,

            child: Text(
              percentage,
              textAlign: TextAlign.right,

              style: const TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w700,
                color: Color(0xFF172033),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ASPECT TITLE
  // ============================================================

  Widget _buildAspectTitle() {
    return const Text(
      'Skor Aspek Unggulan',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w800,
        color: Color(0xFF172033),
      ),
    );
  }

  // ============================================================
  // ASPECT RATINGS
  // ============================================================

  Widget _buildAspectRatings() {
    return Wrap(
      spacing: 6,
      runSpacing: 6,

      children: [
        _aspect(
          Icons.cleaning_services_outlined,
          'Kebersihan & Sampah',
          '4.9',
        ),

        _aspect(
          Icons.security_outlined,
          'Keamanan 24 Jam',
          '4.8',
        ),

        _aspect(
          Icons.water_drop_outlined,
          'Air PDAM & Listrik',
          '4.7',
        ),

        _aspect(
          Icons.accessibility_new_rounded,
          'Ketanggapan UPRS',
          '4.6',
        ),

        _aspect(
          Icons.directions_bus_outlined,
          'Fasilitas Transportasi',
          '5.0',
        ),
      ],
    );
  }

  Widget _aspect(
    IconData icon,
    String title,
    String score,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 6,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFFEFF2FF),
        borderRadius: BorderRadius.circular(8),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(
            icon,
            size: 13,
            color: const Color(0xFF008B68),
          ),

          const SizedBox(width: 5),

          Text(
            title,
            style: const TextStyle(
              fontSize: 8,
              color: Color(0xFF3F4858),
            ),
          ),

          const SizedBox(width: 7),

          Text(
            score,
            style: const TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w800,
              color: Color(0xFF123B9A),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // WRITE REVIEW BANNER
  // ============================================================

  Widget _buildWriteReviewBanner() {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.fromLTRB(
        16,
        15,
        16,
        16,
      ),

      decoration: BoxDecoration(
        color: const Color(0xFF2447B8),
        borderRadius: BorderRadius.circular(14),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          const Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 20,
                color: Color(0xFF6FF0C0),
              ),

              SizedBox(width: 5),

              Text(
                'Anda Penghuni di Sini?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),

          const Text(
            'Bagikan pengalaman tinggal Anda untuk membantu transparansi calon warga dan perbaikan pelayanan UPRS.',
            style: TextStyle(
              fontSize: 9,
              height: 1.4,
              color: Color(0xFFDCE5FF),
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            height: 43,

            child: ElevatedButton(
              onPressed: _openReviewForm,

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor:
                    const Color(0xFF123B9A),

                elevation: 0,

                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12),
                ),
              ),

              child: const Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [
                  Icon(
                    Icons.rate_review_outlined,
                    size: 16,
                  ),

                  SizedBox(width: 7),

                  Text(
                    'Tulis Ulasan & Rating',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // COMMUNITY HEADER
  // ============================================================

  Widget _buildCommunityHeader() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Ulasan Komunitas Warga',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Color(0xFF172033),
            ),
          ),
        ),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 5,
          ),

          decoration: BoxDecoration(
            color: const Color(0xFFF0F2FF),
            borderRadius: BorderRadius.circular(999),
          ),

          child: const Row(
            children: [
              Icon(
                Icons.swap_vert_rounded,
                size: 12,
                color: Color(0xFF596273),
              ),

              SizedBox(width: 3),

              Text(
                'Terbaru',
                style: TextStyle(
                  fontSize: 8,
                  color: Color(0xFF596273),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // FILTERS
  // ============================================================

  Widget _buildFilters() {
    return SizedBox(
      height: 31,

      child: ListView.separated(
        scrollDirection: Axis.horizontal,

        itemCount: filters.length,

        separatorBuilder: (_, __) {
          return const SizedBox(width: 6);
        },

        itemBuilder: (context, index) {
          final selected =
              selectedFilter == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedFilter = index;
              });
            },

            child: Container(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 11,
                vertical: 7,
              ),

              decoration: BoxDecoration(
                color: selected
                    ? const Color(0xFF123B9A)
                    : const Color(0xFFF0F2FF),

                borderRadius:
                    BorderRadius.circular(999),
              ),

              child: Text(
                filters[index],
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: selected
                      ? FontWeight.w700
                      : FontWeight.w500,

                  color: selected
                      ? Colors.white
                      : const Color(0xFF596273),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ============================================================
  // REVIEW 1
  // ============================================================

  Widget _buildReviewOne() {
    return _reviewCard(
      avatar: avatar1,
      name: 'Siti Rahmawati',
      time: '3 hari lalu',
      badge: 'Penghuni Terverifikasi • Tower B Lt. 4',
      rating: '5.0',

      text:
          'Sudah 1 tahun tinggal di Rusunawa Pasar Rumput bersama keluarga. Lingkungannya sangat bersih dan aman untuk anak-anak karena ada RPTRA di lantai bawah. Halte TransJakarta tepat di depan rusun sangat memudahkan berangkat kerja ke Sudirman.',

      showPhotos: true,
      helpful: 'Membantu (24)',
    );
  }

  // ============================================================
  // REVIEW 2
  // ============================================================

  Widget _buildReviewTwo() {
    return _reviewCard(
      avatar: avatar2,
      name: 'Ahmad Fauzi',
      time: '2 minggu lalu',
      badge: 'Penghuni Tower A',
      rating: '4.0',

      text:
          'Fasilitas pasar modern di lantai 1 sangat praktis untuk belanja kebutuhan harian tanpa perlu keluar jauh. Air PDAM lancar 24 jam. Saran sedikit untuk lift tower A agar dipercepat saat jam berangkat kerja.',

      showPhotos: false,
      helpful: 'Membantu (18)',
    );
  }

  // ============================================================
  // REVIEW 3
  // ============================================================

  Widget _buildReviewThree() {
    return _reviewCard(
      avatar: avatar3,
      name: 'Dewi Lestari',
      time: '1 bulan lalu',
      badge: 'Penghuni Terverifikasi • Aksesibilitas',
      rating: '5.0',

      text:
          'Aksesibilitas untuk pengguna kursi roda dan lansia sangat diperhatikan. Jalur ramp landai dan lift beroperasi baik. Petugas keamanan juga sangat ramah dan sigap membantu.',

      showPhotos: false,
      helpful: 'Membantu (35)',
    );
  }

  // ============================================================
  // REVIEW CARD
  // ============================================================

  Widget _reviewCard({
    required String avatar,
    required String name,
    required String time,
    required String badge,
    required String rating,
    required String text,
    required bool showPhotos,
    required String helpful,
  }) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(15),

        border: Border.all(
          color: const Color(0xFFE7E9F1),
        ),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          Row(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              ClipOval(
                child: Image.network(
                  avatar,
                  width: 38,
                  height: 38,
                  fit: BoxFit.cover,

                  errorBuilder:
                      (_, __, ___) {
                    return Container(
                      width: 38,
                      height: 38,
                      color:
                          const Color(0xFFE8EDFF),
                      child: const Icon(
                        Icons.person,
                        color:
                            Color(0xFF3157B8),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(width: 9),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight:
                            FontWeight.w800,
                        color:
                            Color(0xFF172033),
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      badge,
                      maxLines: 1,
                      overflow:
                          TextOverflow.ellipsis,

                      style: const TextStyle(
                        fontSize: 7,
                        fontWeight:
                            FontWeight.w600,
                        color:
                            Color(0xFF008B68),
                      ),
                    ),
                  ],
                ),
              ),

              Text(
                time,
                style: const TextStyle(
                  fontSize: 7,
                  color: Color(0xFF7B8495),
                ),
              ),
            ],
          ),

          const SizedBox(height: 9),

          Row(
            children: [
              ...List.generate(
                5,
                (index) {
                  return const Icon(
                    Icons.star_rounded,
                    size: 15,
                    color: Color(0xFFFFA000),
                  );
                },
              ),

              const SizedBox(width: 6),

              Text(
                rating,
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF273043),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            text,
            style: const TextStyle(
              fontSize: 11,
              height: 1.55,
              color: Color(0xFF273043),
            ),
          ),

          if (showPhotos) ...[
            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: _reviewImage(
                    reviewPhoto1,
                  ),
                ),

                const SizedBox(width: 7),

                Expanded(
                  child: _reviewImage(
                    reviewPhoto2,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(9),

              decoration: BoxDecoration(
                color: const Color(0xFFF0F2FF),
                borderRadius:
                    BorderRadius.circular(10),
              ),

              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 8,
                    color: Color(0xFF596273),
                    height: 1.4,
                  ),

                  children: [
                    TextSpan(
                      text:
                          'UPRS Rusunawa Pasar Rumput',
                      style: TextStyle(
                        fontWeight:
                            FontWeight.w800,
                        color:
                            Color(0xFF123B9A),
                      ),
                    ),

                    TextSpan(
                      text:
                          '  • Pengelola\n',
                      style: TextStyle(
                        color:
                            Color(0xFF7B8495),
                      ),
                    ),

                    TextSpan(
                      text:
                          'Terima kasih Ibu Siti atas apresiasinya, kami terus berkomitmen menjaga fasilitas dan kenyamanan seluruh warga Rusunawa Pasar Rumput.',
                    ),
                  ],
                ),
              ),
            ),
          ],

          const SizedBox(height: 10),

          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 6,
                ),

                decoration: BoxDecoration(
                  color:
                      const Color(0xFFF0F2FF),
                  borderRadius:
                      BorderRadius.circular(999),
                ),

                child: Row(
                  children: [
                    const Icon(
                      Icons.thumb_up_outlined,
                      size: 12,
                      color:
                          Color(0xFF596273),
                    ),

                    const SizedBox(width: 4),

                    Text(
                      helpful,
                      style:
                          const TextStyle(
                        fontSize: 8,
                        color:
                            Color(0xFF596273),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              Row(
                children: [
                  Icon(
                    Icons.share_outlined,
                    size: 13,
                    color:
                        const Color(0xFF7B8495),
                  ),

                  const SizedBox(width: 4),

                  const Text(
                    'Bagikan',
                    style: TextStyle(
                      fontSize: 8,
                      color:
                          Color(0xFF7B8495),
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

  Widget _reviewImage(String url) {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(10),

      child: SizedBox(
        height: 88,

        child: Image.network(
          url,
          fit: BoxFit.cover,

          errorBuilder:
              (_, __, ___) {
            return Container(
              color:
                  const Color(0xFFE8EDFF),

              child: const Icon(
                Icons.image_outlined,
                color:
                    Color(0xFF3157B8),
              ),
            );
          },
        ),
      ),
    );
  }

  // ============================================================
  // WRITE REVIEW
  // ============================================================

  void _openReviewForm() {
    showModalBottomSheet<void>(
      context: context,

      isScrollControlled: true,

      backgroundColor: Colors.transparent,

      builder: (context) {
        return Container(
          padding: const EdgeInsets.fromLTRB(
            20,
            18,
            20,
            25,
          ),

          decoration: const BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
          ),

          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                const Text(
                  'Tulis Ulasan & Rating',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight:
                        FontWeight.w800,
                    color:
                        Color(0xFF172033),
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  'Bagikan pengalaman Anda selama tinggal di Rusunawa Pasar Rumput.',
                  style: TextStyle(
                    fontSize: 10,
                    color:
                        Color(0xFF697386),
                  ),
                ),

                const SizedBox(height: 18),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: List.generate(
                    5,
                    (index) {
                      return const Padding(
                        padding:
                            EdgeInsets.symmetric(
                          horizontal: 3,
                        ),

                        child: Icon(
                          Icons.star_border_rounded,
                          size: 36,
                          color:
                              Color(0xFFFFA000),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  maxLines: 4,

                  decoration:
                      InputDecoration(
                    hintText:
                        'Tulis pengalaman Anda...',
                    hintStyle:
                        const TextStyle(
                      fontSize: 10,
                      color:
                          Color(0xFF9AA2B1),
                    ),

                    filled: true,

                    fillColor:
                        const Color(
                      0xFFF7F8FC,
                    ),

                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        12,
                      ),

                      borderSide:
                          BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  height: 45,

                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);

                      ScaffoldMessenger.of(
                        this.context,
                      ).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Ulasan berhasil disimpan.',
                          ),
                        ),
                      );
                    },

                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(
                        0xFF123B9A,
                      ),

                      foregroundColor:
                          Colors.white,

                      elevation: 0,

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                          12,
                        ),
                      ),
                    ),

                    child: const Text(
                      'Kirim Ulasan',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight:
                            FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}