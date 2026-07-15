// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
