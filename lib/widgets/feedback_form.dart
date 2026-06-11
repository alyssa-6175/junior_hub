import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_colors.dart';
import '../utils/url_helper.dart';

const String _formUrl =
    'https://forms.office.com/Pages/ResponsePage.aspx?id=ix5osiDdz0axYzcaLXxgFDEvpwzcSH5DiaNNGMTyhJpUNEVRQVpBRzRKUjFIRFQ4UUQwS1dSNUVBMi4u';

/// Compact bar shown at the very bottom of every content screen.
class FeedbackBar extends StatelessWidget {
  const FeedbackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: kBorderLight)),
        color: kSurface,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
      child: Row(
        children: [
          const Icon(Icons.feedback_outlined, size: 13, color: kTextTertiary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Have a resource to add or something to request?',
              style: GoogleFonts.inter(fontSize: 12, color: kTextSecondary),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 10),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => openUrl(context, _formUrl),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: kNavy,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Open form ↗',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
