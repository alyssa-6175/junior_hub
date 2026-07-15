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
    id: 'computing_engineering',
    label: 'Computing + Engineering',
    color: Color(0xFF534AB7),
    subcategories: [
      SubMajor(
        id: 'cs',
        label: 'Computer Science',
        groupId: 'computing_engineering',
      ),
      SubMajor(
        id: 'ai',
        label: 'Artificial Intelligence',
        groupId: 'computing_engineering',
      ),
      SubMajor(
        id: 'data_sci',
        label: 'Data Science',
        groupId: 'computing_engineering',
      ),
      SubMajor(
        id: 'cybersecurity',
        label: 'Cybersecurity',
        groupId: 'computing_engineering',
      ),
      SubMajor(
        id: 'computer_eng',
        label: 'Computer Engineering',
        groupId: 'computing_engineering',
      ),
      SubMajor(
        id: 'electrical_eng',
        label: 'Electrical Engineering',
        groupId: 'computing_engineering',
      ),
      SubMajor(
        id: 'mechanical_eng',
        label: 'Mechanical Engineering',
        groupId: 'computing_engineering',
      ),
      SubMajor(
        id: 'civil_eng',
        label: 'Civil Engineering',
        groupId: 'computing_engineering',
      ),
      SubMajor(
        id: 'chemical_eng',
        label: 'Chemical Engineering',
        groupId: 'computing_engineering',
      ),
      SubMajor(
        id: 'biomedical_eng',
        label: 'Biomedical Engineering',
        groupId: 'computing_engineering',
      ),
      SubMajor(
        id: 'aerospace_eng',
        label: 'Aerospace Engineering',
        groupId: 'computing_engineering',
      ),
    ],
  ),
  MajorGroup(
    id: 'natural_sciences',
    label: 'Natural Sciences',
    color: Color(0xFF1D9E75),
    subcategories: [
      SubMajor(id: 'biology', label: 'Biology', groupId: 'natural_sciences'),
      SubMajor(
        id: 'chemistry',
        label: 'Chemistry',
        groupId: 'natural_sciences',
      ),
      SubMajor(id: 'physics', label: 'Physics', groupId: 'natural_sciences'),
      SubMajor(
        id: 'astronomy',
        label: 'Astronomy',
        groupId: 'natural_sciences',
      ),
      SubMajor(
        id: 'biochemistry',
        label: 'Biochemistry',
        groupId: 'natural_sciences',
      ),
      SubMajor(
        id: 'geology',
        label: 'Geology / Earth Science',
        groupId: 'natural_sciences',
      ),
    ],
  ),
  MajorGroup(
    id: 'math_data',
    label: 'Mathematics + Statistics',
    color: Color(0xFFBA7517),
    subcategories: [
      SubMajor(id: 'mathematics', label: 'Mathematics', groupId: 'math_data'),
      SubMajor(
        id: 'applied_math',
        label: 'Applied Mathematics',
        groupId: 'math_data',
      ),
      SubMajor(id: 'statistics', label: 'Statistics', groupId: 'math_data'),
      SubMajor(
        id: 'actuarial_sci',
        label: 'Actuarial Science',
        groupId: 'math_data',
      ),
      SubMajor(
        id: 'operations_research',
        label: 'Operations Research',
        groupId: 'math_data',
      ),
    ],
  ),
  MajorGroup(
    id: 'health_life_sciences',
    label: 'Health + Life Sciences',
    color: Color(0xFFD85A30),
    subcategories: [
      SubMajor(id: 'premed', label: 'Pre-Med', groupId: 'health_life_sciences'),
      SubMajor(
        id: 'nursing',
        label: 'Nursing',
        groupId: 'health_life_sciences',
      ),
      SubMajor(
        id: 'public_health',
        label: 'Public Health',
        groupId: 'health_life_sciences',
      ),
      SubMajor(
        id: 'health_science',
        label: 'Health Science',
        groupId: 'health_life_sciences',
      ),
      SubMajor(
        id: 'nutrition',
        label: 'Nutrition',
        groupId: 'health_life_sciences',
      ),
      SubMajor(
        id: 'pharmacy',
        label: 'Pharmacy',
        groupId: 'health_life_sciences',
      ),
      SubMajor(
        id: 'pre_dental',
        label: 'Pre-Dental',
        groupId: 'health_life_sciences',
      ),
    ],
  ),
  MajorGroup(
    id: 'psych_brain',
    label: 'Psychology + Brain Sciences',
    color: Color(0xFF5A4AB7),
    subcategories: [
      SubMajor(id: 'psychology', label: 'Psychology', groupId: 'psych_brain'),
      SubMajor(
        id: 'neuroscience',
        label: 'Neuroscience',
        groupId: 'psych_brain',
      ),
      SubMajor(
        id: 'cognitive_science',
        label: 'Cognitive Science',
        groupId: 'psych_brain',
      ),
      SubMajor(
        id: 'behavioral_science',
        label: 'Behavioral Science',
        groupId: 'psych_brain',
      ),
    ],
  ),
  MajorGroup(
    id: 'business_economics',
    label: 'Business + Economics',
    color: Color(0xFF0B6E8C),
    subcategories: [
      SubMajor(
        id: 'business',
        label: 'Business Administration',
        groupId: 'business_economics',
      ),
      SubMajor(
        id: 'economics',
        label: 'Economics',
        groupId: 'business_economics',
      ),
      SubMajor(id: 'finance', label: 'Finance', groupId: 'business_economics'),
      SubMajor(
        id: 'accounting',
        label: 'Accounting',
        groupId: 'business_economics',
      ),
      SubMajor(
        id: 'marketing',
        label: 'Marketing',
        groupId: 'business_economics',
      ),
      SubMajor(
        id: 'management',
        label: 'Management',
        groupId: 'business_economics',
      ),
      SubMajor(
        id: 'entrepreneurship',
        label: 'Entrepreneurship',
        groupId: 'business_economics',
      ),
      SubMajor(
        id: 'supply_chain',
        label: 'Supply Chain Management',
        groupId: 'business_economics',
      ),
    ],
  ),
  MajorGroup(
    id: 'social_policy_law',
    label: 'Social Sciences, Policy + Law',
    color: Color(0xFF7C3D9E),
    subcategories: [
      SubMajor(
        id: 'political_science',
        label: 'Political Science',
        groupId: 'social_policy_law',
      ),
      SubMajor(
        id: 'international_relations',
        label: 'International Relations',
        groupId: 'social_policy_law',
      ),
      SubMajor(
        id: 'public_policy',
        label: 'Public Policy',
        groupId: 'social_policy_law',
      ),
      SubMajor(id: 'prelaw', label: 'Pre-Law', groupId: 'social_policy_law'),
      SubMajor(
        id: 'sociology',
        label: 'Sociology',
        groupId: 'social_policy_law',
      ),
      SubMajor(
        id: 'anthropology',
        label: 'Anthropology',
        groupId: 'social_policy_law',
      ),
      SubMajor(
        id: 'criminology',
        label: 'Criminology',
        groupId: 'social_policy_law',
      ),
      SubMajor(
        id: 'social_work',
        label: 'Social Work',
        groupId: 'social_policy_law',
      ),
    ],
  ),
  MajorGroup(
    id: 'environment',
    label: 'Environment + Sustainability',
    color: Color(0xFF2D7A3A),
    subcategories: [
      SubMajor(
        id: 'environmental_science',
        label: 'Environmental Science',
        groupId: 'environment',
      ),
      SubMajor(
        id: 'environmental_studies',
        label: 'Environmental Studies',
        groupId: 'environment',
      ),
      SubMajor(id: 'ecology', label: 'Ecology', groupId: 'environment'),
      SubMajor(
        id: 'sustainability',
        label: 'Climate + Sustainability',
        groupId: 'environment',
      ),
      SubMajor(
        id: 'urban_studies',
        label: 'Urban Studies / Planning',
        groupId: 'environment',
      ),
    ],
  ),
  MajorGroup(
    id: 'humanities_languages',
    label: 'Humanities + Languages',
    color: Color(0xFF8B3A3A),
    subcategories: [
      SubMajor(
        id: 'english',
        label: 'English',
        groupId: 'humanities_languages',
      ),
      SubMajor(
        id: 'creative_writing',
        label: 'Creative Writing',
        groupId: 'humanities_languages',
      ),
      SubMajor(
        id: 'history',
        label: 'History',
        groupId: 'humanities_languages',
      ),
      SubMajor(
        id: 'philosophy',
        label: 'Philosophy',
        groupId: 'humanities_languages',
      ),
      SubMajor(
        id: 'religious_studies',
        label: 'Religious Studies',
        groupId: 'humanities_languages',
      ),
      SubMajor(
        id: 'languages',
        label: 'Languages / Linguistics',
        groupId: 'humanities_languages',
      ),
      SubMajor(
        id: 'area_studies',
        label: 'Area / Cultural Studies',
        groupId: 'humanities_languages',
      ),
    ],
  ),
  MajorGroup(
    id: 'arts_design_media',
    label: 'Arts, Design + Media',
    color: Color(0xFFD4537E),
    subcategories: [
      SubMajor(
        id: 'fine_arts',
        label: 'Studio Art / Fine Arts',
        groupId: 'arts_design_media',
      ),
      SubMajor(
        id: 'graphic_design',
        label: 'Graphic Design',
        groupId: 'arts_design_media',
      ),
      SubMajor(
        id: 'game_design',
        label: 'Game Design',
        groupId: 'arts_design_media',
      ),
      SubMajor(id: 'music', label: 'Music', groupId: 'arts_design_media'),
      SubMajor(
        id: 'theater',
        label: 'Theater / Performing Arts',
        groupId: 'arts_design_media',
      ),
      SubMajor(
        id: 'film_media',
        label: 'Film + Media Production',
        groupId: 'arts_design_media',
      ),
      SubMajor(
        id: 'journalism',
        label: 'Journalism',
        groupId: 'arts_design_media',
      ),
      SubMajor(
        id: 'communications',
        label: 'Communications',
        groupId: 'arts_design_media',
      ),
    ],
  ),
  MajorGroup(
    id: 'education',
    label: 'Education + Human Services',
    color: Color(0xFF0B6E4F),
    subcategories: [
      SubMajor(id: 'education', label: 'Education', groupId: 'education'),
      SubMajor(
        id: 'early_childhood_ed',
        label: 'Early Childhood Education',
        groupId: 'education',
      ),
      SubMajor(
        id: 'special_education',
        label: 'Special Education',
        groupId: 'education',
      ),
      SubMajor(
        id: 'nonprofit_management',
        label: 'Nonprofit Management',
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
