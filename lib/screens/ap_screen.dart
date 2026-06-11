import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../data/resources_data.dart';
import '../models/resource.dart';
import '../providers/app_provider.dart';
import '../widgets/tappable.dart';

class ApScreen extends StatefulWidget {
  const ApScreen({super.key});

  @override
  State<ApScreen> createState() => _ApScreenState();
}

class _ApScreenState extends State<ApScreen> {
  String _filter = 'all'; // 'all' | 'stem' | 'hum' | 'soc' | 'art'

  @override
  Widget build(BuildContext context) {
    final items = apResources(subCategory: _filter == 'all' ? null : _filter);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.menu_book,
                    color: CategoryColors.textFor('ap'),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'AP Courses',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: kTextPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),

              const SizedBox(height: 14),
              // Sub-category filters
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _ApFilter(
                      label: 'All',
                      value: 'all',
                      current: _filter,
                      onTap: (v) => setState(() => _filter = v),
                    ),
                    _ApFilter(
                      label: 'Math',
                      value: 'math',
                      current: _filter,
                      onTap: (v) => setState(() => _filter = v),
                    ),
                    _ApFilter(
                      label: 'Computer Science',
                      value: 'cs',
                      current: _filter,
                      onTap: (v) => setState(() => _filter = v),
                    ),
                    _ApFilter(
                      label: 'Economics',
                      value: 'econ',
                      current: _filter,
                      onTap: (v) => setState(() => _filter = v),
                    ),
                    _ApFilter(
                      label: 'Science',
                      value: 'science',
                      current: _filter,
                      onTap: (v) => setState(() => _filter = v),
                    ),
                    _ApFilter(
                      label: 'History + Social Sci.',
                      value: 'history',
                      current: _filter,
                      onTap: (v) => setState(() => _filter = v),
                    ),
                    _ApFilter(
                      label: 'Language + Lit',
                      value: 'lang',
                      current: _filter,
                      onTap: (v) => setState(() => _filter = v),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 160,
              mainAxisExtent: 110,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: items.length,
            itemBuilder: (_, i) => _ApCard(resource: items[i]),
          ),
        ),
      ],
    );
  }
}

class _ApCard extends StatelessWidget {
  final Resource resource;
  const _ApCard({required this.resource});

  @override
  Widget build(BuildContext context) {
    return Tappable(
      onTap: () => context.read<AppProvider>().navigateTo(
        'ap_detail',
        detailId: resource.id,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: kSurface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kBorderLight),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              resource.title,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: kTextPrimary,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Text(
              '${resource.links.length} resources',
              style: GoogleFonts.inter(fontSize: 11, color: kTextSecondary),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: BoxDecoration(
                color: resource.categoryBgColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                resource.apSubCategoryLabel,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: resource.categoryTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ApFilter extends StatelessWidget {
  final String label;
  final String value;
  final String current;
  final void Function(String) onTap;

  const _ApFilter({
    required this.label,
    required this.value,
    required this.current,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isOn = current == value;
    return Tappable(
      onTap: () => onTap(value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        margin: const EdgeInsets.only(right: 6),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          color: isOn ? CategoryColors.bgFor('ap') : kSurface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isOn ? CategoryColors.textFor('ap') : kBorderLight,
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: isOn ? FontWeight.w500 : FontWeight.normal,
            color: isOn ? CategoryColors.textFor('ap') : kTextSecondary,
          ),
        ),
      ),
    );
  }
}
