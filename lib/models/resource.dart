import 'package:flutter/material.dart';
import '../app_colors.dart';

class Resource {
  final String id;
  final String title;
  final String category;
  final String field;
  final String description;
  final String? deadline;
  final String? deadlineIso;
  final IconData icon;
  final List<String> links;
  final String? apSubCategory;
  final String? detailNote;
  final String? url;
  final String? scope;
  final String? locationNote;
  final String? format;
  final List<String> majorTags;
  final String? timeCommitment;
  final String? applicationInfo;
  final String? testSection;
  final String? instructions;

  const Resource({
    required this.id,
    required this.title,
    required this.category,
    required this.field,
    required this.description,
    this.deadline,
    this.deadlineIso,
    required this.icon,
    required this.links,
    this.apSubCategory,
    this.detailNote,
    this.url,
    this.scope,
    this.locationNote,
    this.format,
    this.majorTags = const [],
    this.timeCommitment,
    this.applicationInfo,
    this.testSection,
    this.instructions,
  });

  // ─── Urgency Calculation ──────────────────────────────────────────────────
  /// Determines if a deadline is 'soon' (within 90 days), 'later', or 'none'.
  String get urgency {
    if (deadlineIso == null || deadlineIso!.isEmpty) return 'none';

    try {
      final deadlineDate = DateTime.parse(deadlineIso!);
      final now = DateTime.now();
      final difference = deadlineDate.difference(now).inDays;

      if (difference < 0) {
        return 'none'; // Deadline passed
      } else if (difference <= 90) {
        // Less than 3 months away
        return 'soon';
      } else {
        return 'later';
      }
    } catch (e) {
      // Fallback if parsing fails
      return 'later';
    }
  }

  // ─── Urgency Colors & Labels ──────────────────────────────────────────────
  Color get urgencyTextColor {
    switch (urgency) {
      case 'soon':
        return const Color(0xFFA52A2A); // Red/Brown text
      case 'later':
        return const Color(0xFFD4AF37); // Gold text
      default:
        return const Color(0xFF6B7280); // Gray text
    }
  }

  Color get urgencyBgColor {
    switch (urgency) {
      case 'soon':
        return const Color(0xFFFEE2E2); // Light red background
      case 'later':
        return const Color(0xFFFEF9C3); // Light yellow background
      default:
        return const Color(0xFFF3F4F6); // Light gray background
    }
  }

  String get urgencyLabel {
    switch (urgency) {
      case 'soon':
        return 'Soon';
      case 'later':
        return 'Later';
      default:
        return '';
    }
  }

  // ─── Deadline Date Styling ────────────────────────────────────────────────
  /// Returns the color for the deadline date text based on urgency
  Color get deadlineTextColor {
    switch (urgency) {
      case 'soon':
        return const Color(0xFFA52A2A); // Red/Brown for urgent
      case 'later':
        return const Color(0xFFD4AF37); // Gold for coming soon
      default:
        return const Color(0xFF6B7280); // Gray for no deadline
    }
  }

  /// Returns the urgency badge label for the date icon
  String get urgencyBadgeLabel {
    switch (urgency) {
      case 'soon':
        return 'Urgent';
      case 'later':
        return 'Coming Soon';
      default:
        return '';
    }
  }

  // ─── Convenience getters ──────────────────────────────────────────────────
  Color get categoryTextColor => CategoryColors.textFor(category);
  Color get categoryBgColor => CategoryColors.bgFor(category);

  String get fieldLabel => FieldColors.labelFor(field);

  String get categoryLabel {
    const labels = {
      'competition': 'Competition',
      'ap': 'AP Course',
      'research': 'Research',
      'internship': 'Internship',
      'sat': 'SAT',
      'act': 'ACT',
    };
    return labels[category] ?? category;
  }

  String get apSubCategoryLabel {
    const labels = {
      'math': 'Math',
      'cs': 'Computer Science',
      'econ': 'Economics',
      'science': 'Science',
      'history': 'History + Social Science',
      'lang': 'Language + Lit',
    };
    return labels[apSubCategory ?? ''] ?? '';
  }

  String get scopeLabel {
    const labels = {
      'national': 'National',
      'regional': 'Regional',
      'state': 'In-State',
      'international': 'International',
      'local': 'Local',
    };
    return labels[scope ?? ''] ?? '';
  }

  Color get scopeColor {
    switch (scope) {
      case 'national':
        return const Color(0xFF1B2A6B);
      case 'international':
        return const Color(0xFF534AB7);
      case 'regional':
        return const Color(0xFF185FA5);
      case 'state':
        return const Color(0xFF0F6E56);
      default:
        return const Color(0xFF6B7280);
    }
  }

  Color get scopeBgColor {
    switch (scope) {
      case 'national':
        return const Color(0xFFEEF0FA);
      case 'international':
        return const Color(0xFFEEEDFE);
      case 'regional':
        return const Color(0xFFE6F1FB);
      case 'state':
        return const Color(0xFFE1F5EE);
      default:
        return const Color(0xFFF3F4F6);
    }
  }

  String get formatLabel {
    const labels = {
      'in_person': 'In Person',
      'virtual': 'Virtual',
      'hybrid': 'Hybrid',
    };
    return labels[format ?? ''] ?? '';
  }

  String get testSectionLabel {
    const labels = {
      'math': 'Math',
      'reading_writing': 'Reading & Writing',
      'science': 'Science',
      'english': 'English',
      'reading': 'Reading',
    };
    return labels[testSection ?? ''] ?? 'All sections';
  }
}

// ─── ResourceLink lives OUTSIDE the Resource class ────────────────────────────
class ResourceLink {
  final String label;
  final String url;
  const ResourceLink({required this.label, required this.url});
}
