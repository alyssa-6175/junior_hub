import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../providers/app_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _loading = false;
  String? _error;

  Future<void> _signInWithGoogle() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    final error = await context.read<AppProvider>().signInWithGoogle();
    if (!mounted) return;
    if (error != null) {
      setState(() {
        _error = error;
        _loading = false;
      });
    }
  }

  Future<void> _signInWithMicrosoft() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    final error = await context.read<AppProvider>().signInWithMicrosoft();
    if (!mounted) return;
    if (error != null) {
      setState(() {
        _error = error;
        _loading = false;
      });
    }
  }

  void _guest() => context.read<AppProvider>().continueAsGuest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF0F8),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 4,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [kNavy, kGold]),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: _LoginCard(
                  loading: _loading,
                  error: _error,
                  onGoogleSignIn: _signInWithGoogle,
                  onMicrosoftSignIn: _signInWithMicrosoft,
                  onGuest: _guest,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginCard extends StatelessWidget {
  final bool loading;
  final String? error;
  final VoidCallback onGoogleSignIn;
  final VoidCallback onMicrosoftSignIn;
  final VoidCallback onGuest;

  const _LoginCard({
    required this.loading,
    this.error,
    required this.onGoogleSignIn,
    required this.onMicrosoftSignIn,
    required this.onGuest,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kBorderLight),
        boxShadow: [
          BoxShadow(
            color: kNavy.withValues(alpha: 0.10),
            blurRadius: 32,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(height: 3, color: kNavy),
          Padding(
            padding: const EdgeInsets.fromLTRB(36, 36, 36, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo Header
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color:
                              kNavy, // You can remove this line if your logo already has a background color
                          borderRadius: BorderRadius.circular(14),
                        ),
                        clipBehavior: Clip
                            .antiAlias, // This ensures your image respects the rounded corners
                        child: Image.asset(
                          'assets/logo.png',
                          fit: BoxFit
                              .cover, // Use BoxFit.contain if the logo gets cut off
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Junior Hub',
                        style: GoogleFonts.inter(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: kNavy,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Eastside Preparatory School',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: kTextSecondary,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Instructions
                const Text(
                  'Sign in with your @eastsideprep.org account',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: kTextTertiary),
                ),
                const SizedBox(height: 16),

                // OAuth Buttons or Loading Spinner
                if (loading)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Center(
                      child: CircularProgressIndicator(color: kNavy),
                    ),
                  )
                else ...[
                  _OAuthButton(
                    logo: 'assets/google_logo.png',
                    label: 'Sign in with Google',
                    onTap: onGoogleSignIn,
                  ),
                  const SizedBox(height: 10),
                  _OAuthButton(
                    logo: 'assets/microsoft_logo.png',
                    label: 'Sign in with Microsoft',
                    onTap: onMicrosoftSignIn,
                  ),
                ],

                // Error Message
                if (error != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    error!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFFA32D2D),
                    ),
                  ),
                ],

                const SizedBox(height: 24),

                // Divider
                const Row(
                  children: [
                    Expanded(child: Divider(color: kBorderLight, thickness: 1)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Text(
                        'or',
                        style: TextStyle(fontSize: 12, color: kTextTertiary),
                      ),
                    ),
                    Expanded(child: Divider(color: kBorderLight, thickness: 1)),
                  ],
                ),

                const SizedBox(height: 18),

                // Guest Button
                OutlinedButton(
                  onPressed: onGuest,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: kNavy,
                    side: const BorderSide(color: kGold, width: 1.5),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Continue as Guest',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Guests can browse but cannot save, pin, or flag resources.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 11, color: kTextTertiary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── OAuth Button Component ───────────────────────────────────────────────────

class _OAuthButton extends StatelessWidget {
  final String logo;
  final String label;
  final VoidCallback onTap;

  const _OAuthButton({
    required this.logo,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: kSurface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kBorderLight),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(logo, width: 20, height: 20),
              const SizedBox(width: 10),
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: kTextPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
