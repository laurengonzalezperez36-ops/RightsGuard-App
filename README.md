# RightsGuard

**A privacy-first bilingual iOS app providing immigrant rights information and legal resources.**

![iOS](https://img.shields.io/badge/iOS-17.0%2B-blue)
![Swift](https://img.shields.io/badge/Swift-5.9-orange)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 📱 About

RightsGuard helps immigrants understand their legal rights and find resources. The app is designed with privacy as the core principle:

- ✅ **No account creation required**
- ✅ **No data collection or tracking**
- ✅ **All data stays on your device**
- ✅ **Works completely offline**
- ✅ **Bilingual: English & Spanish**

### Features

- **Know Your Rights Library**: Educational articles about ICE encounters, workplace raids, traffic stops, and more
- **Resource Directory**: Searchable database of legal aid organizations, pro bono lawyers, and immigrant support services
- **Resource Matcher**: Anonymous intake form to find resources matching your specific needs
- **Complete Privacy**: No personal information ever leaves your device

---

## 🚀 Installation Guide

### Requirements

- **Mac computer** with macOS Sonoma (14.0) or later
- **Xcode 15** or later (free from Mac App Store)
- **iPhone or iPad** running iOS 17 or later
- **USB cable** to connect device to Mac

### Step-by-Step Installation

#### 1. Install Xcode

1. Open **Mac App Store**
2. Search for **"Xcode"**
3. Click **Get** (it's free but large, ~7GB download)
4. Wait for installation to complete (may take 30-60 minutes)

#### 2. Download RightsGuard

**Option A: Download ZIP**
1. Click the green **Code** button above
2. Select **Download ZIP**
3. Unzip the file to your Desktop

**Option B: Using Git (if installed)**

bash

git clone https://github.com/laurengonzalezperez36-ops/RightsGuard-App.git

cd RightsGuard-App

#### 3. Open Project in Xcode

1. Navigate to the downloaded folder
2. Double-click **RightsGuard.xcodeproj**
3. Xcode will open automatically

#### 4. Trust Developer Certificate (First Time Only)

1. In Xcode, click **RightsGuard** in the left sidebar
2. Under **Signing & Capabilities** tab
3. Check **"Automatically manage signing"**
4. Select your **Team** (use your Apple ID)
   - If you don't see a team, click **Add Account** and sign in with your Apple ID

#### 5. Connect Your iPhone/iPad

1. Plug device into Mac using USB cable
2. On your device, tap **Trust This Computer** if prompted
3. Enter your device passcode

#### 6. Select Your Device

1. In Xcode toolbar (top), click the device dropdown
2. Select your connected iPhone/iPad (not "Any iOS Device")

#### 7. Run the App

1. Click the **Play button (▶️)** in Xcode toolbar
2. Xcode will build the app (first time takes 2-3 minutes)
3. **On your device:** Go to Settings → General → VPN & Device Management
4. Tap your email → **Trust "[your email]"**
5. Return to home screen - RightsGuard icon will appear!

#### 8. Launch RightsGuard

Tap the RightsGuard icon on your device. The app is now fully functional!

### ⚠️ Important Notes

- **App expires after 7 days** with free Apple ID (just re-run from Xcode to reinstall)
- **No internet required** after installation
- **All data stays local** to your device

---

## 📖 How to Use

### Know Your Rights
- Browse scenarios (ICE encounters, workplace raids, etc.)
- Read detailed rights information in English or Spanish
- Available offline anytime

### Find Legal Help
- Search directory of legal resources
- Filter by state and pro bono availability
- View contact information and services offered

### Match Resources
- Fill out anonymous intake form
- Get personalized resource recommendations
- No data is stored or transmitted

### Settings
- Switch between English/Spanish
- View privacy policy
- All preferences stored locally only

---

## 🛡️ Privacy & Security

RightsGuard is built with privacy as the foundation:

- **Zero data collection**: No analytics, tracking, or telemetry
- **No internet connection**: Works completely offline
- **Local storage only**: Only language preference stored on device via UserDefaults
- **No account required**: No registration, login, or personal information
- **Open source**: All code is public for transparency

### What Data is Stored?

Only one preference:
- **Language choice** (English or Spanish) - stored locally in UserDefaults

That's it. Nothing else.

---

## 🏗️ Technical Details

**Built with:**
- Swift 5.9
- SwiftUI
- iOS 17+ (using `@Observable` macro)
- No external dependencies
- No networking code

**Project Structure:**
- `Models/` - Data models (LegalResource, RightsArticle, IntakeFormData)
- `ViewModels/` - Business logic and mock data services
- `Views/` - SwiftUI views and shared components
- `RightsGuardApp.swift` - App entry point with language settings

---

## 🤝 Contributing

This app was built to help immigrant communities. Contributions are welcome!

### Ways to Contribute

1. **Add more legal resources** - Edit `ResourceDirectoryViewModel.swift`
2. **Add more rights articles** - Edit `RightsLibraryViewModel.swift`
3. **Translate to other languages** - Add language support in models
4. **Improve UI/UX** - Suggest design improvements
5. **Report bugs** - Open an issue

### For Developers

**To add new resources:**
1. Edit `ViewModels/ResourceDirectoryViewModel.swift`
2. Add new `LegalResource` object to `allResources` array
3. Ensure bilingual names (English & Spanish)

**To add new articles:**
1. Edit `ViewModels/RightsLibraryViewModel.swift`
2. Add new `RightsArticle` to `allArticles` array
3. Include both English and Spanish content

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

This means you can:
- ✅ Use for personal or commercial purposes
- ✅ Modify and distribute
- ✅ Use in private projects
- ✅ Sublicense

---

## 🌟 For Organizations

**Are you an immigrant rights organization?**

This app is free to use and can be published under your organization's name in the App Store. I'm happy to:

- Provide full source code and documentation
- Customize branding for your organization
- Add specific resources for your community
- Assist with App Store submission

**Contact:** Open an issue or reach out via GitHub

---

## 🙏 Acknowledgments

Built with the goal of empowering immigrant communities with accessible, privacy-respecting technology.

Special thanks to all organizations providing pro bono legal services to immigrants.

---

## 🗺️ Roadmap

Future improvements:
- [ ] Android version
- [ ] Additional languages (Mandarin, Arabic, French/Creole, Haitian Creole)
- [ ] Offline downloadable resource database updates
- [ ] Emergency contact quick-dial feature
- [ ] Community-contributed translations
- [ ] Expanded legal resource database

---

## 📞 Support

**For Users:**
- This is educational information, not legal advice
- For legal help, contact resources listed in the app

**For Developers:**
- Open an issue on GitHub
- Pull requests are welcome

---

**Made with ❤️ for immigrant communities**