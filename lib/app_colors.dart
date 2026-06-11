import 'package:flutter/material.dart';

// ─── School Spirit Colors ────────────────────────────────────────────────────
// Change these two to match your exact school colors.
const Color kNavy = Color(0xFF1B2A6B); // dark navy — sidebar, buttons
const Color kGold = Color(0xFFCFA92C); // gold — accents, active states
const Color kGoldLight = Color(0xFFFDF4D0); // pale gold — hover backgrounds

// ─── App Neutrals ────────────────────────────────────────────────────────────
const Color kBackground = Color(0xFFF7F8FC); // page background
const Color kSurface = Colors.white; // cards and panels
const Color kBorderLight = Color(0xFFE5E7EB); // card borders
const Color kTextPrimary = Color(0xFF0D1321); // headings, titles
const Color kTextSecondary = Color(0xFF6B7280); // secondary labels
const Color kTextTertiary = Color(0xFF9CA3AF); // placeholders, hints

// ─── Category Badge Colors ───────────────────────────────────────────────────
// Each resource category has a text color and a background color.
class CategoryColors {
  static const Map<String, Color> text = {
    'competition': Color(0xFF854F0B),
    'ap': Color(0xFF3C3489),
    'research': Color(0xFF993C1D),
    'internship': Color(0xFF993556),
    'sat': Color(0xFF085041),
    'act': Color(0xFF1546A0),
  };
  static const Map<String, Color> bg = {
    'competition': Color(0xFFFAEEDA),
    'ap': Color(0xFFEEEDFE),
    'research': Color(0xFFFAECE7),
    'internship': Color(0xFFFBEAF0),
    'sat': Color(0xFFE1F5EE),
    'act': Color(0xFFDEEBFF),
  };
  static Color textFor(String cat) => text[cat] ?? const Color(0xFF374151);
  static Color bgFor(String cat) => bg[cat] ?? const Color(0xFFF3F4F6);
}

// ─── Urgency Colors ──────────────────────────────────────────────────────────
class UrgencyColors {
  static const Map<String, Color> text = {
    'urgent': Color(0xFFA32D2D),
    'soon': Color(0xFF854F0B),
    'later': Color(0xFF27500A),
  };
  static const Map<String, Color> bg = {
    'urgent': Color(0xFFFCEBEB),
    'soon': Color(0xFFFAEEDA),
    'later': Color(0xFFEAF3DE),
  };
  static const Map<String, String> label = {
    'urgent': 'Urgent',
    'soon': 'Coming up',
    'later': 'Later',
  };
  static Color textFor(String u) => text[u] ?? text['later']!;
  static Color bgFor(String u) => bg[u] ?? bg['later']!;
  static String labelFor(String u) => label[u] ?? '';
}

// ─── Field Dot Colors ─────────────────────────────────────────────────────────
class FieldColors {
  static const Map<String, Color> dot = {
    'cs': Color(0xFF534AB7),
    'biology': Color(0xFF1D9E75),
    'math': Color(0xFFBA7517),
    'english': Color(0xFFD4537E),
    'history': Color(0xFFD85A30),
    'physics': Color(0xFF378ADD),
    'all': Color(0xFF6B7280),
  };
  static Color dotFor(String field) => dot[field] ?? dot['all']!;

  static const Map<String, String> label = {
    'cs': 'Computer Science',
    'biology': 'Biology',
    'math': 'Mathematics',
    'english': 'English / Writing',
    'history': 'History / SS',
    'physics': 'Physics / Eng.',
    'all': 'All Fields',
  };
  static String labelFor(String field) => label[field] ?? field;
}
