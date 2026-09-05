// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/resource.dart';

class SubMajor {
  final String id;
  final String label;
  final String groupId;
  const SubMajor({
    required this.id,
    required this.label,
    required this.groupId,
  });
}

class MajorGroup {
  final String id;
  final String label;
  final Color color;
  final List<SubMajor> subcategories;
  const MajorGroup({
    required this.id,
    required this.label,
    required this.color,
    required this.subcategories,
  });
}

final List<MajorGroup> majorGroups = [
  MajorGroup(
    id: 'stem',
    label: 'STEM',
    color: Color(0xFF534AB7),
    subcategories: [
      SubMajor(
        id: 'computer_science',
        label: 'Computer Science',
        groupId: 'stem',
      ),
      SubMajor(id: 'engineering', label: 'Engineering', groupId: 'stem'),
      SubMajor(id: 'mathematics', label: 'Mathematics', groupId: 'stem'),
      SubMajor(id: 'statistics', label: 'Statistics', groupId: 'stem'),
      SubMajor(id: 'biology', label: 'Biology', groupId: 'stem'),
      SubMajor(id: 'chemistry', label: 'Chemistry', groupId: 'stem'),
      SubMajor(id: 'physics', label: 'Physics', groupId: 'stem'),
      SubMajor(id: 'astronomy', label: 'Astronomy', groupId: 'stem'),
      SubMajor(
        id: 'environmental_science',
        label: 'Environmental Science',
        groupId: 'stem',
      ),
    ],
  ),
  MajorGroup(
    id: 'health_psych',
    label: 'Health + Psychology',
    color: Color(0xFFD85A30),
    subcategories: [
      SubMajor(id: 'pre_med', label: 'Pre-Med', groupId: 'health_psych'),
      SubMajor(id: 'nursing', label: 'Nursing', groupId: 'health_psych'),
      SubMajor(
        id: 'public_health',
        label: 'Public Health',
        groupId: 'health_psych',
      ),
      SubMajor(id: 'psychology', label: 'Psychology', groupId: 'health_psych'),
      SubMajor(
        id: 'neuroscience',
        label: 'Neuroscience',
        groupId: 'health_psych',
      ),
    ],
  ),
  MajorGroup(
    id: 'business',
    label: 'Business + Economics',
    color: Color(0xFF0B6E8C),
    subcategories: [
      SubMajor(id: 'business', label: 'Business', groupId: 'business'),
      SubMajor(id: 'economics', label: 'Economics', groupId: 'business'),
      SubMajor(id: 'finance', label: 'Finance', groupId: 'business'),
      SubMajor(
        id: 'entrepreneurship',
        label: 'Entrepreneurship',
        groupId: 'business',
      ),
    ],
  ),
  MajorGroup(
    id: 'social_policy',
    label: 'Social Sciences + Policy',
    color: Color(0xFF7C3D9E),
    subcategories: [
      SubMajor(
        id: 'political_science',
        label: 'Political Science',
        groupId: 'social_policy',
      ),
      SubMajor(
        id: 'international_relations',
        label: 'International Relations',
        groupId: 'social_policy',
      ),
      SubMajor(
        id: 'public_policy',
        label: 'Public Policy',
        groupId: 'social_policy',
      ),
      SubMajor(id: 'sociology', label: 'Sociology', groupId: 'social_policy'),
      SubMajor(
        id: 'anthropology',
        label: 'Anthropology',
        groupId: 'social_policy',
      ),
      SubMajor(id: 'pre_law', label: 'Pre-Law', groupId: 'social_policy'),
    ],
  ),
  MajorGroup(
    id: 'humanities',
    label: 'Humanities + Arts',
    color: Color(0xFFD4537E),
    subcategories: [
      SubMajor(id: 'english', label: 'English', groupId: 'humanities'),
      SubMajor(id: 'history', label: 'History', groupId: 'humanities'),
      SubMajor(id: 'philosophy', label: 'Philosophy', groupId: 'humanities'),
      SubMajor(
        id: 'creative_writing',
        label: 'Creative Writing',
        groupId: 'humanities',
      ),
      SubMajor(id: 'languages', label: 'Languages', groupId: 'humanities'),
      SubMajor(id: 'art_design', label: 'Art + Design', groupId: 'humanities'),
      SubMajor(id: 'music', label: 'Music', groupId: 'humanities'),
      SubMajor(id: 'film_media', label: 'Film + Media', groupId: 'humanities'),
      SubMajor(id: 'journalism', label: 'Journalism', groupId: 'humanities'),
    ],
  ),
  MajorGroup(
    id: 'education',
    label: 'Education + Social Impact',
    color: Color(0xFF0B6E4F),
    subcategories: [
      SubMajor(id: 'education', label: 'Education', groupId: 'education'),
      SubMajor(id: 'social_work', label: 'Social Work', groupId: 'education'),
      SubMajor(
        id: 'nonprofit',
        label: 'Nonprofit / Advocacy',
        groupId: 'education',
      ),
    ],
  ),
];

/// Finds a SubMajor by its id across all groups.
SubMajor? findSubMajor(String id) {
  for (final g in majorGroups) {
    for (final s in g.subcategories) {
      if (s.id == id) return s;
    }
  }
  return null;
}

/// Finds the MajorGroup a given subMajor id belongs to.
MajorGroup? groupForSubMajor(String subMajorId) {
  for (final g in majorGroups) {
    if (g.subcategories.any((s) => s.id == subMajorId)) return g;
  }
  return null;
}

const Map<String, Set<String>> _majorFields = {
  'computer_science': {'cs'},
  'engineering': {'engineering', 'physics'},
  'mathematics': {'math'},
  'statistics': {'statistics', 'math'},
  'biology': {'biology'},
  'chemistry': {'chemistry'},
  'physics': {'physics'},
  'astronomy': {'astronomy'},
  'environmental_science': {'env_sci', 'science'},
  'pre_med': {'biology', 'chemistry'},
  'nursing': {'biology'},
  'public_health': {'biology'},
  'psychology': {'psychology'},
  'neuroscience': {'biology', 'psychology'},
  'business': {'business'},
  'economics': {'economics', 'business'},
  'finance': {'business'},
  'entrepreneurship': {'business', 'engineering'},
  'political_science': {'polisci', 'history'},
  'international_relations': {'polisci', 'history'},
  'public_policy': {'polisci', 'history'},
  'sociology': {'history'},
  'anthropology': {'history'},
  'pre_law': {'polisci', 'history'},
  'english': {'english'},
  'history': {'history'},
  'philosophy': {'english', 'history'},
  'creative_writing': {'english'},
  'languages': {'languages'},
  'art_design': {'art_history'},
  'music': {'music'},
  'film_media': {'humanities', 'english'},
  'journalism': {'humanities', 'english'},
  'education': {'english', 'history'},
  'social_work': {'history', 'psychology'},
  'nonprofit': {'history', 'business'},
};

const Map<String, Set<String>> _majorTagAliases = {
  'computer_science': {'cs', 'algorithms', 'app_dev', 'cybersecurity', 'nlp'},
  'engineering': {'engineering', 'aerospace', 'innovation'},
  'mathematics': {'math', 'applied_math', 'problem_solving', 'logic'},
  'statistics': {'statistics', 'data_sci'},
  'biology': {'biology', 'genetics', 'anatomy', 'ecology'},
  'chemistry': {'chemistry', 'lab_science'},
  'physics': {'physics', 'mechanics', 'space'},
  'astronomy': {'astronomy', 'astrophysics', 'space', 'space_science'},
  'environmental_science': {'env_sci', 'earth_science'},
  'pre_med': {'medicine', 'biology', 'chemistry'},
  'nursing': {'nursing', 'medicine', 'biology'},
  'public_health': {'public_health', 'medicine', 'biology'},
  'psychology': {'psychology', 'behavioral', 'cog_sci'},
  'neuroscience': {'neuroscience', 'biology', 'psychology'},
  'business': {'business'},
  'economics': {'economics'},
  'finance': {'finance', 'investment'},
  'entrepreneurship': {'entrepreneurship', 'innovation'},
  'political_science': {'polisci', 'civics'},
  'international_relations': {'intl_rel'},
  'public_policy': {'public_policy', 'civics'},
  'sociology': {'sociology', 'social_impact'},
  'anthropology': {'anthropology'},
  'pre_law': {'prelaw', 'law_general', 'constitutional_law'},
  'english': {'english'},
  'history': {'history'},
  'philosophy': {'philosophy', 'logic'},
  'creative_writing': {'creative_writing', 'poetry'},
  'languages': {'languages', 'linguistics'},
  'art_design': {'fine_arts', 'art_design', 'art', 'design'},
  'music': {'music'},
  'film_media': {'film_prod', 'documentary', 'digital_media'},
  'journalism': {'journalism_media'},
  'education': {'education'},
  'social_work': {'social_work', 'social_impact'},
  'nonprofit': {'nonprofit', 'advocacy', 'social_impact'},
};

/// Uses the same taxonomy for sidebar pages, category filters, and My Majors
bool resourceMatchesMajor(Resource resource, String majorOrGroupId) {
  if (resource.majorTags.contains('all_subjects')) return true;

  final group = majorGroups
      .where((item) => item.id == majorOrGroupId)
      .firstOrNull;
  if (group != null) {
    if (resource.majorTags.contains(group.id)) return true;
    return group.subcategories.any(
      (major) => resourceMatchesMajor(resource, major.id),
    );
  }

  final parentGroup = groupForSubMajor(majorOrGroupId);
  if (resource.field == 'all' &&
      parentGroup != null &&
      resource.majorTags.contains(parentGroup.id)) {
    return true;
  }

  final fields = _majorFields[majorOrGroupId] ?? const <String>{};
  final aliases = _majorTagAliases[majorOrGroupId] ?? const <String>{};
  return fields.contains(resource.field) ||
      resource.majorTags.contains(majorOrGroupId) ||
      resource.majorTags.any(aliases.contains);
}
