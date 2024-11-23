import 'package:flutter/material.dart';
import 'package:uni_calculator_test/constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  String selectedLanguage = 'English';
  bool notificationsEnabled = true;
  String userName = 'Zakaria Reguig';
  String userEmail = 'zakig701@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000B2B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with back button
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 100.0,
                      height: 50.0,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryBlue, width: 1.4),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: primaryBlue,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    'Settings',
                    style: textStyle.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: primaryBlue),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // Profile Section
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: primaryBlue, width: 1.4),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    // Profile Picture
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryBlue, width: 1.4),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 40,
                        color: primaryBlue,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      userName,
                      style: textStyle.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: whiteBlue),
                    ),
                    Text(
                      userEmail,
                      style: textStyle.copyWith(
                        fontSize: 14,
                        color: Colors.white30,
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildActionButton(
                      'Edit Profile',
                      Icons.edit,
                      color: primaryBlue,
                      () {
                        // Implement edit profile functionality
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // Settings Options
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildSettingSection(
                        'App Settings',
                        [
                          _buildSettingItem(
                            'Language',
                            Icons.language,
                            trailing: DropdownButton<String>(
                              style: textStyle.copyWith(
                                fontSize: 15,
                                color: primaryBlue,
                              ),
                              iconEnabledColor: primaryBlue,
                              iconDisabledColor: darkBlue,
                              value: selectedLanguage,
                              underline: const SizedBox(),
                              items: ['English', 'Français', 'العربية']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontFamily: 'Helvetica',
                                      fontSize: 14,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    selectedLanguage = newValue;
                                  });
                                }
                              },
                              elevation: 0,
                              borderRadius: BorderRadius.circular(15.0),
                              menuWidth: 120.0,
                              dropdownColor: darkBlue,
                              iconSize: 20.0,
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                              ),
                            ),
                          ),
                          _buildSettingItem(
                            'Notifications',
                            Icons.notifications,
                            trailing: Switch(
                              value: notificationsEnabled,
                              onChanged: (value) {
                                setState(() {
                                  notificationsEnabled = value;
                                });
                              },
                              activeColor: primaryBlue,
                              activeTrackColor: const Color(0xFF0015FF),
                              inactiveThumbColor: const Color(0xFF0C37CD),
                              inactiveTrackColor: darkBlue,
                              trackOutlineColor: WidgetStateProperty.all(
                                  const Color(0x000c37cd)),
                              trackOutlineWidth: WidgetStateProperty.all(0.0),
                            ),
                          ),
                          _buildSettingItem(
                            'Dark Mode',
                            Icons.dark_mode,
                            trailing: Switch(
                              value: isDarkMode,
                              onChanged: (value) {
                                setState(() {
                                  isDarkMode = value;
                                });
                              },
                              activeColor: primaryBlue,
                              activeTrackColor: const Color(0xFF0015FF),
                              inactiveThumbColor: const Color(0xFF0C37CD),
                              inactiveTrackColor: darkBlue,
                              trackOutlineColor: WidgetStateProperty.all(
                                  const Color(0x000c37cd)),
                              trackOutlineWidth: WidgetStateProperty.all(0.0),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      _buildSettingSection(
                        'Other',
                        [
                          _buildSettingItem(
                            'About',
                            Icons.info_outline_rounded,
                            onTap: () {
                              // Implement about page navigation
                            },
                          ),
                          _buildSettingItem(
                            'Help & Support',
                            Icons.help_outline_rounded,
                            onTap: () {
                              // Implement help page navigation
                            },
                          ),
                          _buildSettingItem(
                            'Privacy Policy',
                            Icons.privacy_tip_outlined,
                            onTap: () {
                              // Implement privacy policy page navigation
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),

              // Logout Button
              _buildActionButton(
                'Logout',
                Icons.logout_rounded,
                () {
                  // Implement logout functionality
                },
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textStyle.copyWith(
              fontSize: 18, fontWeight: FontWeight.bold, color: whiteBlue),
        ),
        const SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: primaryBlue, width: 1.4),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: items,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingItem(
    String title,
    IconData icon, {
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        decoration: const BoxDecoration(
            // border: Border(
            //   bottom: BorderSide(
            //     color: PrimaryBlue,
            //     width: 1.4,
            //   ),
            // ),
            ),
        child: Row(
          children: [
            Icon(icon, size: 24, color: primaryBlue),
            const SizedBox(width: 15),
            Text(
              title,
              style: textStyle.copyWith(
                fontSize: 16,
                color: primaryBlue,
              ),
            ),
            const Spacer(),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
    String title,
    IconData icon,
    VoidCallback onTap, {
    Color color = Colors.green,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: color,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border.all(color: primaryBlue, width: 1.4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 8),
            Text(
              title,
              style: textStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
