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
    id: 'cs_eng',
    label: 'CS + Engineering',
    color: Color(0xFF534AB7),
    subcategories: [
      SubMajor(id: 'cs', label: 'Computer Science', groupId: 'cs_eng'),
      SubMajor(id: 'cybersecurity', label: 'Cybersecurity', groupId: 'cs_eng'),
      SubMajor(
        id: 'mech_eng',
        label: 'Mechanical Engineering',
        groupId: 'cs_eng',
      ),
      SubMajor(id: 'game_design', label: 'Game Design', groupId: 'cs_eng'),
      SubMajor(id: 'data_sci', label: 'Data Science', groupId: 'cs_eng'),
      SubMajor(id: 'ai', label: 'Artificial Intelligence', groupId: 'cs_eng'),
      SubMajor(
        id: 'aerospace',
        label: 'Aerospace Engineering',
        groupId: 'cs_eng',
      ),
    ],
  ),
  MajorGroup(
    id: 'sciences',
    label: 'Sciences',
    color: Color(0xFF1D9E75),
    subcategories: [
      SubMajor(id: 'biology', label: 'Biology', groupId: 'sciences'),
      SubMajor(id: 'physics', label: 'Physics', groupId: 'sciences'),
      SubMajor(id: 'neuroscience', label: 'Neuroscience', groupId: 'sciences'),
      SubMajor(id: 'chemistry', label: 'Chemistry', groupId: 'sciences'),
      SubMajor(
        id: 'chem_eng',
        label: 'Chemical Engineering',
        groupId: 'sciences',
      ),
    ],
  ),
  MajorGroup(
    id: 'math',
    label: 'Mathematics',
    color: Color(0xFFBA7517),
    subcategories: [
      SubMajor(
        id: 'applied_math',
        label: 'Applied Mathematics',
        groupId: 'math',
      ),
      SubMajor(id: 'statistics', label: 'Statistics', groupId: 'math'),
    ],
  ),
  MajorGroup(
    id: 'health',
    label: 'Health + Pre-Med',
    color: Color(0xFFD85A30),
    subcategories: [
      SubMajor(id: 'premed', label: 'Pre-Med', groupId: 'health'),
      SubMajor(id: 'bio_health', label: 'Biology', groupId: 'health'),
      SubMajor(id: 'neuro_health', label: 'Neuroscience', groupId: 'health'),
    ],
  ),
  MajorGroup(
    id: 'business',
    label: 'Business, Finance + Ops',
    color: Color(0xFF0B6E8C),
    subcategories: [
      SubMajor(id: 'business', label: 'Business', groupId: 'business'),
      SubMajor(id: 'economics', label: 'Economics', groupId: 'business'),
    ],
  ),
  MajorGroup(
    id: 'social',
    label: 'Social Sciences + Global',
    color: Color(0xFF7C3D9E),
    subcategories: [
      SubMajor(
        id: 'intl_rel',
        label: 'International Relations',
        groupId: 'social',
      ),
      SubMajor(id: 'polisci', label: 'Political Science', groupId: 'social'),
      SubMajor(id: 'pub_policy', label: 'Public Policy', groupId: 'social'),
      SubMajor(id: 'journalism', label: 'Journalism', groupId: 'social'),
      SubMajor(id: 'sociology', label: 'Sociology', groupId: 'social'),
    ],
  ),
  MajorGroup(
    id: 'arts',
    label: 'Arts, Humanities + Design',
    color: Color(0xFFD4537E),
    subcategories: [
      SubMajor(
        id: 'humanities',
        label: 'Humanities (General)',
        groupId: 'arts',
      ),
      SubMajor(id: 'game_des_art', label: 'Game Design', groupId: 'arts'),
      SubMajor(id: 'fine_arts', label: 'Art / Fine Arts', groupId: 'arts'),
      SubMajor(id: 'english', label: 'English', groupId: 'arts'),
      SubMajor(id: 'music', label: 'Musical Arts', groupId: 'arts'),
      SubMajor(id: 'film', label: 'Film & Media Production', groupId: 'arts'),
      SubMajor(
        id: 'creative_writing',
        label: 'Creative Writing',
        groupId: 'arts',
      ),
      SubMajor(id: 'poetry', label: 'Poetry', groupId: 'arts'),
    ],
  ),
  MajorGroup(
    id: 'law',
    label: 'Law + Policy',
    color: Color(0xFF8B3A3A),
    subcategories: [
      SubMajor(id: 'prelaw', label: 'Pre-Law', groupId: 'law'),
      SubMajor(id: 'law_general', label: 'Law (General)', groupId: 'law'),
      SubMajor(
        id: 'constitutional_law',
        label: 'Constitutional Law',
        groupId: 'law',
      ),
      SubMajor(id: 'intl_law', label: 'International Law', groupId: 'law'),
      SubMajor(id: 'pub_policy_law', label: 'Public Policy', groupId: 'law'),
      SubMajor(
        id: 'civil_rights',
        label: 'Civil Rights & Equity',
        groupId: 'law',
      ),
    ],
  ),
  MajorGroup(
    id: 'media',
    label: 'Media, Film + Journalism',
    color: Color(0xFFB85C1A),
    subcategories: [
      SubMajor(id: 'journalism_media', label: 'Journalism', groupId: 'media'),
      SubMajor(id: 'film_prod', label: 'Film Production', groupId: 'media'),
      SubMajor(id: 'documentary', label: 'Documentary', groupId: 'media'),
      SubMajor(id: 'broadcast', label: 'Broadcast Media', groupId: 'media'),
      SubMajor(id: 'digital_media', label: 'Digital Media', groupId: 'media'),
    ],
  ),
  MajorGroup(
    id: 'environment',
    label: 'Environmental Science',
    color: Color(0xFF2D7A3A),
    subcategories: [
      SubMajor(
        id: 'env_sci',
        label: 'Environmental Science',
        groupId: 'environment',
      ),
      SubMajor(id: 'ecology', label: 'Ecology', groupId: 'environment'),
      SubMajor(
        id: 'climate',
        label: 'Climate & Sustainability',
        groupId: 'environment',
      ),
      SubMajor(
        id: 'nature_writing',
        label: 'Nature Writing',
        groupId: 'environment',
      ),
    ],
  ),
  MajorGroup(
    id: 'psychology',
    label: 'Psychology + Cognitive Science',
    color: Color(0xFF5A4AB7),
    subcategories: [
      SubMajor(id: 'psych', label: 'Psychology', groupId: 'psychology'),
      SubMajor(
        id: 'cog_sci',
        label: 'Cognitive Science',
        groupId: 'psychology',
      ),
      SubMajor(
        id: 'behavioral',
        label: 'Behavioral Science',
        groupId: 'psychology',
      ),
    ],
  ),
  MajorGroup(
    id: 'leadership',
    label: 'Entrepreneurship + Leadership',
    color: Color(0xFF0B6E4F),
    subcategories: [
      SubMajor(
        id: 'entrepreneurship',
        label: 'Entrepreneurship',
        groupId: 'leadership',
      ),
      SubMajor(
        id: 'social_impact',
        label: 'Social Impact',
        groupId: 'leadership',
      ),
      SubMajor(
        id: 'innovation',
        label: 'Innovation & Design',
        groupId: 'leadership',
      ),
      SubMajor(
        id: 'nonprofit',
        label: 'Nonprofit & Advocacy',
        groupId: 'leadership',
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
