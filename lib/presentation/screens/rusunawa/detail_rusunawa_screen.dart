import 'package:flutter/material.dart';
import '../review/review_screen.dart';

class DetailRusunawaScreen extends StatefulWidget {
  const DetailRusunawaScreen({super.key});

  @override
  State<DetailRusunawaScreen> createState() => _DetailRusunawaScreenState();
}

class _DetailRusunawaScreenState extends State<DetailRusunawaScreen> {
  int selectedTab = 0;

  String selectedUnit = 'Unit B-0304';

  final ScrollController _scrollController = ScrollController();

  final List<String> tabs = [
    'Ringkasan',
    'Pilihan Unit (4)',
    'Fasilitas',
    'Lokasi',
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _selectTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  void _selectUnit(String unit) {
    setState(() {
      selectedUnit = unit;
    });
  }

  void _submitRental() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ReviewScreen()));
  }

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
                    controller: _scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _header(),

                        _mainInformation(),

                        _tabBar(),

                        const SizedBox(height: 16),

                        _profileSection(),

                        const SizedBox(height: 18),

                        _unitSection(),

                        const SizedBox(height: 18),

                        _facilitySection(),

                        const SizedBox(height: 18),

                        _requirementSection(),

                        const SizedBox(height: 18),

                        _locationSection(),

                        const SizedBox(height: 100),
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
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _roundButton(
                icon: Icons.arrow_back_rounded,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Row(
                children: [
                  _roundButton(icon: Icons.share_rounded, onPressed: () {}),
                  const SizedBox(width: 8),
                  _roundButton(
                    icon: Icons.favorite_border_rounded,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 14),

          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF6EE7B7),
                borderRadius: BorderRadius.circular(999),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.verified_rounded,
                    size: 13,
                    color: Color(0xFF047857),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Terverifikasi Pemprov',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF047857),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          _heroImage(),
        ],
      ),
    );
  }

  Widget _heroImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: SizedBox(
        width: double.infinity,
        height: 210,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?auto=format&fit=crop&w=1000&q=90',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFFDBEAFE),
                  child: const Icon(
                    Icons.apartment_rounded,
                    size: 80,
                    color: Color(0xFF60A5FA),
                  ),
                );
              },
            ),

            Positioned(
              top: 10,
              left: 10,
              child: _photoBadge(
                icon: Icons.apartment_rounded,
                text: 'Standar SNI 03-1733',
              ),
            ),

            Positioned(
              bottom: 10,
              left: 10,
              child: _imageLabel(
                child: const Text(
                  'Tower B (Blok Selatan)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 10,
              right: 10,
              child: _imageLabel(
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.photo_library_outlined,
                      color: Colors.white,
                      size: 12,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '1 / 5 Foto',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageLabel({required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(999),
      ),
      child: child,
    );
  }

  // ============================================================
  // INFORMASI UTAMA
  // ============================================================

  Widget _mainInformation() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _statusBadge(
                'Tersedia 19 Unit',
                const Color(0xFF6EE7B7),
                const Color(0xFF047857),
              ),
              const SizedBox(width: 7),
              _statusBadge(
                'Siap Huni',
                const Color(0xFFE5E7EB),
                const Color(0xFF4B5563),
              ),
              const Spacer(),
              const Icon(
                Icons.star_rounded,
                size: 18,
                color: Color(0xFFF59E0B),
              ),
              const SizedBox(width: 3),
              const Text(
                '4.8',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              const SizedBox(width: 3),
              const Text(
                '(124 ulasan)',
                style: TextStyle(fontSize: 10, color: Color(0xFF6B7280)),
              ),
            ],
          ),

          const SizedBox(height: 7),

          const Text(
            'Rusunawa Pasar Rumput',
            style: TextStyle(
              fontSize: 21,
              height: 1.1,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1F2937),
            ),
          ),

          const SizedBox(height: 5),

          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 16,
                color: Color(0xFF1D4ED8),
              ),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  'Jl. Sultan Agung No. 1, Pasar Manggis, '
                  'Kec. Setiabudi, Kota Jakarta Selatan, '
                  'DKI Jakarta 12970',
                  style: TextStyle(
                    fontSize: 11,
                    height: 1.35,
                    color: Color(0xFF5F6270),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: _specCard(
                  Icons.height_rounded,
                  'Ketinggian',
                  '25 Lantai (Lift)',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _specCard(
                  Icons.straighten_rounded,
                  'Tipe Unit',
                  '36 m² (2 KT)',
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: _specCard(
                  Icons.bolt_rounded,
                  'Daya Listrik',
                  '1.300 VA (Token)',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _specCard(
                  Icons.water_drop_outlined,
                  'Sumber Air',
                  'PDAM Terpusat',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // TAB
  // ============================================================

  Widget _tabBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 0),
      child: SizedBox(
        height: 40,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: tabs.length,
          separatorBuilder: (_, index) {
            return const SizedBox(width: 6);
          },
          itemBuilder: (context, index) {
            final bool active = selectedTab == index;

            return GestureDetector(
              onTap: () => _selectTab(index),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                decoration: BoxDecoration(
                  color: active
                      ? const Color(0xFF123B9A)
                      : const Color(0xFFF0F2FF),
                  borderRadius: BorderRadius.circular(999),
                ),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Icon(
                      index == 0
                          ? Icons.info_outline_rounded
                          : index == 1
                          ? Icons.apartment_rounded
                          : index == 2
                          ? Icons.grid_view_rounded
                          : Icons.location_on_outlined,
                      size: 14,
                      color: active ? Colors.white : const Color(0xFF4B5563),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      tabs[index],
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: active ? Colors.white : const Color(0xFF4B5563),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ============================================================
  // PROFIL HUNIAN
  // ============================================================

  Widget _profileSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE8E8F2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profil Hunian Terpadu',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1F2937),
              ),
            ),

            const SizedBox(height: 7),

            const Text(
              'Rusunawa Pasar Rumput mengintegrasikan hunian layak huni '
              'ramah keluarga berpenghasilan rendah dengan pasar '
              'tradisional higienis dan halte integrasi TransJakarta. '
              'Dirancang dengan ventilasi silang, pencahayaan alami, '
              'dan aksesibilitas inklusif untuk lansia serta penyandang disabilitas.',
              style: TextStyle(
                fontSize: 11,
                height: 1.5,
                color: Color(0xFF606575),
              ),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F3FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Container(
                      width: 76,
                      height: 65,
                      color: const Color(0xFFE0E7FF),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?auto=format&fit=crop&w=400&q=80',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.home_work_outlined,
                            color: Color(0xFF3158C8),
                            size: 30,
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(width: 9),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tata Ruang Tipe 36 m²',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF374151),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '2 Kamar Tidur, 1 Ruang Keluarga, '
                          'Dapur Terbuka, Balkon Jemur, & Kamar Mandi.',
                          style: TextStyle(
                            fontSize: 9,
                            height: 1.35,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
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
  // UNIT HUNIAN
  // ============================================================

  Widget _unitSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Unit Hunian',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Pilih nomor unit untuk mengajukan sewa',
                      style: TextStyle(fontSize: 10, color: Color(0xFF6B7280)),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0E7FF),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Text(
                  'Filter: Tower B',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF3158C8),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          _unitCard(
            unit: 'Unit B-0304',
            floor: 'Lantai 3',
            view: 'Hadap Taman Timur',
            price: '650.000',
            status: 'Tersedia',
            statusColor: const Color(0xFF6EE7B7),
            statusTextColor: const Color(0xFF047857),
            selected: selectedUnit == 'Unit B-0304',
            onTap: () => _selectUnit('Unit B-0304'),
          ),

          const SizedBox(height: 8),

          _unitCard(
            unit: 'Unit B-0412',
            floor: 'Lantai 4',
            view: 'Hadap Jalan Utama',
            price: '650.000',
            status: 'Tersedia',
            statusColor: const Color(0xFF6EE7B7),
            statusTextColor: const Color(0xFF047857),
            selected: selectedUnit == 'Unit B-0412',
            onTap: () => _selectUnit('Unit B-0412'),
          ),

          const SizedBox(height: 8),

          _unitCard(
            unit: 'Unit B-0201',
            floor: 'Lantai 2',
            view: 'Akses Difabel & Lansia',
            price: '580.000',
            status: 'Dalam Pengajuan',
            statusColor: const Color(0xFFFFE8A3),
            statusTextColor: const Color(0xFFB45309),
            selected: false,
            subsidy: true,
            accessible: true,
          ),

          const SizedBox(height: 8),

          _unitCard(
            unit: 'Unit B-0515',
            floor: 'Lantai 5',
            view: 'Masa Sewa s/d 2026',
            price: '620.000',
            status: 'Sudah Disewa',
            statusColor: const Color(0xFFE5E7EB),
            statusTextColor: const Color(0xFF6B7280),
            selected: false,
            disabled: true,
          ),
        ],
      ),
    );
  }

  Widget _unitCard({
    required String unit,
    required String floor,
    required String view,
    required String price,
    required String status,
    required Color statusColor,
    required Color statusTextColor,
    required bool selected,
    VoidCallback? onTap,
    bool subsidy = false,
    bool accessible = false,
    bool disabled = false,
  }) {
    return Opacity(
      opacity: disabled ? 0.65 : 1,
      child: GestureDetector(
        onTap: disabled || subsidy ? null : onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected
                  ? const Color(0xFF123B9A)
                  : const Color(0xFFE7E7F0),
              width: selected ? 1.5 : 1,
            ),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0E7FF),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Icon(
                      accessible
                          ? Icons.accessible_rounded
                          : Icons.apartment_rounded,
                      size: 20,
                      color: const Color(0xFF3158C8),
                    ),
                  ),

                  const SizedBox(width: 9),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                unit,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF374151),
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 7,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: statusColor,
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Text(
                                  status,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700,
                                    color: statusTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 3),

                        Text(
                          '$floor • $view',
                          style: const TextStyle(
                            fontSize: 9,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 5),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Rp $price',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: disabled
                              ? const Color(0xFF6B7280)
                              : const Color(0xFF123B9A),
                        ),
                      ),
                      const Text(
                        '/ bulan',
                        style: TextStyle(fontSize: 8, color: Color(0xFF6B7280)),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  const Icon(
                    Icons.bed_outlined,
                    size: 13,
                    color: Color(0xFF6B7280),
                  ),
                  const SizedBox(width: 3),
                  const Text(
                    '2 KT',
                    style: TextStyle(fontSize: 8, color: Color(0xFF6B7280)),
                  ),

                  const SizedBox(width: 10),

                  const Icon(
                    Icons.square_foot_rounded,
                    size: 13,
                    color: Color(0xFF6B7280),
                  ),
                  const SizedBox(width: 3),
                  const Text(
                    '1 KM',
                    style: TextStyle(fontSize: 8, color: Color(0xFF6B7280)),
                  ),

                  const SizedBox(width: 10),

                  const Icon(
                    Icons.balcony_rounded,
                    size: 13,
                    color: Color(0xFF6B7280),
                  ),
                  const SizedBox(width: 3),
                  const Text(
                    'Balkon',
                    style: TextStyle(fontSize: 8, color: Color(0xFF6B7280)),
                  ),

                  const Spacer(),

                  if (disabled)
                    const Row(
                      children: [
                        Icon(
                          Icons.lock_outline_rounded,
                          size: 13,
                          color: Color(0xFF6B7280),
                        ),
                        SizedBox(width: 3),
                        Text(
                          'Tidak tersedia',
                          style: TextStyle(
                            fontSize: 8,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    )
                  else if (subsidy)
                    const Row(
                      children: [
                        Icon(
                          Icons.lock_outline_rounded,
                          size: 13,
                          color: Color(0xFF6B7280),
                        ),
                        SizedBox(width: 3),
                        Text(
                          'Menunggu Verifikasi',
                          style: TextStyle(
                            fontSize: 8,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Icon(
                          selected
                              ? Icons.radio_button_checked
                              : Icons.radio_button_unchecked,
                          size: 16,
                          color: selected
                              ? const Color(0xFF123B9A)
                              : const Color(0xFF6B7280),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          selected ? 'Dipilih' : 'Pilih Unit',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            color: selected
                                ? const Color(0xFF123B9A)
                                : const Color(0xFF4B5563),
                          ),
                        ),
                      ],
                    ),
                ],
              ),

              if (accessible) ...[
                const SizedBox(height: 6),
                const Row(
                  children: [
                    Icon(
                      Icons.accessible_forward_rounded,
                      size: 13,
                      color: Color(0xFF123B9A),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Akses Ramp Khusus',
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF123B9A),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // FASILITAS
  // ============================================================

  Widget _facilitySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Fasilitas Kompleks Hunian',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1F2937),
            ),
          ),

          const SizedBox(height: 9),

          Row(
            children: [
              Expanded(
                child: _facilityCard(
                  Icons.mosque_outlined,
                  'Musholla Al-Ikhlas',
                  'Kapasitas 200 Jamaah',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _facilityCard(
                  Icons.park_outlined,
                  'RPTRA Ramah Anak',
                  'Taman Bermain Edukatif',
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: _facilityCard(
                  Icons.local_hospital_outlined,
                  'Puskesmas Pembantu',
                  'Layanan Medis Dasar',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _facilityCard(
                  Icons.groups_outlined,
                  'Balai Warga / Aula',
                  'Kegiatan Komunitas',
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: _facilityCard(
                  Icons.directions_bike_outlined,
                  'Area Parkir Motor',
                  'Sistem Kartu Akses',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _facilityCard(
                  Icons.security_outlined,
                  'Keamanan & CCTV',
                  'Patroli 24 Jam Penuh',
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          _wideFacilityCard(),
        ],
      ),
    );
  }

  Widget _facilityCard(IconData icon, String title, String subtitle) {
    return Container(
      constraints: const BoxConstraints(minHeight: 72),
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: const Color(0xFFE7E7F0)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 31,
            height: 31,
            decoration: BoxDecoration(
              color: const Color(0xFFE8EDFF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 17, color: const Color(0xFF3158C8)),
          ),
          const SizedBox(width: 7),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF374151),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 8,
                    height: 1.2,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _wideFacilityCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: const Color(0xFFE7E7F0)),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0xFFE8EDFF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.storefront_outlined,
              size: 18,
              color: Color(0xFF3158C8),
            ),
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pasar Terpadu & Kios Pangan Murah',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF374151),
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Akses langsung ke bahan pokok subsidi dan sembako '
                  'tetap di lantai dasar.',
                  style: TextStyle(
                    fontSize: 8,
                    height: 1.3,
                    color: Color(0xFF6B7280),
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
  // KETENTUAN
  // ============================================================

  Widget _requirementSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: const Color(0xFFE4E9FF),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.verified_user_outlined,
                    size: 17,
                    color: Color(0xFF123B9A),
                  ),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Ketentuan Wajib Calon Penyewa',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF123B9A),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 7),

            const Text(
              'Sesuai Peraturan Gubernur DKI Jakarta terkait alokasi '
              'Rumah Susun Sederhana Sewa:',
              style: TextStyle(
                fontSize: 9,
                height: 1.35,
                color: Color(0xFF5B6380),
              ),
            ),

            const SizedBox(height: 9),

            _requirementItem(
              text:
                  'Khusus Warga Negara Indonesia (WNI) ber-KTP DKI Jakarta '
                  'atau wilayah aglomerasi Jabodetabek.',
            ),

            _requirementItem(
              text:
                  'Belum memiliki rumah/tanah pribadi yang dibuktikan '
                  'dengan Surat Keterangan Kelurahan (PM1).',
            ),

            _requirementItem(
              text:
                  'Penghasilan total keluarga dalam batas kriteria '
                  'Masyarakat Berpenghasilan Rendah (MBR).',
            ),

            const SizedBox(height: 3),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE5E5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    size: 15,
                    color: Color(0xFFDC2626),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      'DILARANG KERAS memindahtangankan sewa (sublet) '
                      'atau menjual hak hunian kepada pihak ketiga.',
                      style: TextStyle(
                        fontSize: 8,
                        height: 1.35,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFDC2626),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _requirementItem({required String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle_outline_rounded,
            size: 15,
            color: Color(0xFF059669),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 9,
                height: 1.4,
                color: Color(0xFF4B5563),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // LOKASI
  // ============================================================

  Widget _locationSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Lokasi & Akses Sekitar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Row(
                  children: [
                    Text(
                      'Buka Google Maps',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF3158C8),
                      ),
                    ),
                    SizedBox(width: 2),
                    Icon(
                      Icons.open_in_new_rounded,
                      size: 12,
                      color: Color(0xFF3158C8),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: double.infinity,
              height: 190,
              child: Stack(
                children: [
                  Container(
                    color: const Color(0xFFE7ECF4),
                    child: CustomPaint(
                      painter: _MapPainter(),
                      child: const SizedBox.expand(),
                    ),
                  ),

                  Positioned(
                    top: 20,
                    left: 20,
                    child: _mapLabel('West Jakarta'),
                  ),

                  Positioned(
                    top: 62,
                    right: 20,
                    child: _mapLabel('East Jakarta'),
                  ),

                  Positioned(
                    top: 82,
                    left: 125,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2563EB).withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.location_on_rounded,
                        size: 30,
                        color: Color(0xFF2563EB),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 12,
                    bottom: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.directions_bus_filled_rounded,
                            size: 14,
                            color: Color(0xFF3158C8),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '100 m ke Halte Pasar Rumput TransJakarta',
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF374151),
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
        ],
      ),
    );
  }

  Widget _mapLabel(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 8,
          color: Color(0xFF6B7280),
          fontWeight: FontWeight.w600,
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
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(top: BorderSide(color: Color(0xFFE8E8F2))),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 390,
            padding: const EdgeInsets.fromLTRB(14, 9, 14, 9),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sewa Terpilih:',
                        style: TextStyle(fontSize: 9, color: Color(0xFF6B7280)),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        selectedUnit,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF123B9A),
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Rp650.000 /bulan',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF111827),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 12),

                SizedBox(
                  width: 145,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _submitRental,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF123B9A),
                      foregroundColor: Colors.white,
                      elevation: 2,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Text(
                            'Ajukan Sewa',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(width: 7),
                        Icon(Icons.arrow_forward_rounded, size: 18),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // ============================================================
  // COMPONENTS
  // ============================================================

  Widget _roundButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: 1,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: SizedBox(
          width: 42,
          height: 42,
          child: Icon(icon, size: 20, color: const Color(0xFF374151)),
        ),
      ),
    );
  }

  Widget _photoBadge({required IconData icon, required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1E3A8A),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 11, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 9,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusBadge(String text, Color background, Color foreground) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w700,
          color: foreground,
        ),
      ),
    );
  }

  Widget _specCard(IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F2FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E7FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 17, color: const Color(0xFF1D4ED8)),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 9, color: Color(0xFF6B7280)),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SIMPLE MAP PAINTER
// ============================================================

class _MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final roadPaint = Paint()
      ..color = const Color(0xFFFFFFFF)
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke;

    final secondaryRoadPaint = Paint()
      ..color = const Color(0xFFD1D8E5)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final riverPaint = Paint()
      ..color = const Color(0xFFAED8F2)
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke;

    final road1 = Path()
      ..moveTo(0, size.height * .28)
      ..quadraticBezierTo(
        size.width * .35,
        size.height * .12,
        size.width,
        size.height * .23,
      );

    final road2 = Path()
      ..moveTo(size.width * .05, size.height)
      ..quadraticBezierTo(
        size.width * .38,
        size.height * .65,
        size.width * .72,
        size.height * .55,
      )
      ..quadraticBezierTo(
        size.width * .86,
        size.height * .5,
        size.width,
        size.height * .72,
      );

    final road3 = Path()
      ..moveTo(size.width * .25, 0)
      ..quadraticBezierTo(
        size.width * .42,
        size.height * .35,
        size.width * .32,
        size.height,
      );

    final road4 = Path()
      ..moveTo(size.width * .7, 0)
      ..quadraticBezierTo(
        size.width * .62,
        size.height * .32,
        size.width * .8,
        size.height,
      );

    final river = Path()
      ..moveTo(size.width * .1, size.height * .82)
      ..quadraticBezierTo(
        size.width * .32,
        size.height * .55,
        size.width * .55,
        size.height * .7,
      )
      ..quadraticBezierTo(
        size.width * .75,
        size.height * .82,
        size.width,
        size.height * .62,
      );

    canvas.drawPath(river, riverPaint);

    canvas.drawPath(road1, roadPaint);
    canvas.drawPath(road2, roadPaint);
    canvas.drawPath(road3, roadPaint);
    canvas.drawPath(road4, roadPaint);

    canvas.drawPath(road1, secondaryRoadPaint);
    canvas.drawPath(road2, secondaryRoadPaint);
    canvas.drawPath(road3, secondaryRoadPaint);
    canvas.drawPath(road4, secondaryRoadPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
