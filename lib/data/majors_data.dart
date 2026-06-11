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
      SubMajor(id: 'prelaw', label: 'Pre-Law', groupId: 'social'),
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
