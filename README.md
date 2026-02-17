# Aaliyah's Collection Store – MAD1 Assignment
[![Flutter Version](https://img.shields.io/badge/Flutter-3.8.1+-02569B?logo=flutter)](https://flutter.dev)
[![Design](https://img.shields.io/badge/Design-Material--3-blue)](https://m3.material.io/)

**Aaliyah's Collection Store** is a high-fidelity mobile application prototype built with **Flutter**. Developed for the **COMP50011: Mobile App Development I** module, it focuses on achieving a professional "Material Design" look and feel, multi-platform responsiveness, and seamless user interactions.

---

## 📖 Table of Contents
- [Assignment Overview](#-assignment-overview)
- [Key UI/UX Features](#-key-uiux-features)
- [Responsive Implementation](#-responsive-implementation)
- [Navigation Logic](#-navigation-logic)
- [Tech Stack](#-tech-stack)
- [Installation & Setup](#-installation--setup)
- [Folder Structure](#-folder-structure)

---

## 🎯 Assignment Overview
This project fulfills the requirements for **MAD1 Assignment 2**, demonstrating:
*   Conformity to Android Platform requirements using Flutter.
*   A premium "Material 3" aesthetic with no placeholder content.
*   System-based Light and Dark mode adaptation.
*   Advanced component usage (Cards, Scrollable Lists, and Custom Forms).

---

## ✨ Key UI/UX Features

### 🎨 Material Design Excellence
*   **Dynamic Theming:** Automatic Light/Dark mode switching with accessible color palettes.
*   **Typography:** Integration of **Google Fonts (Poppins)** for a modern, clean reading experience.
*   **Custom Components:** Bespoke `ProductCard` designs, interactive carousels, and modular form widgets.

### ⚡ Smooth Interactions
*   **Micro-interactions:** Custom Slide + Fade Transitions when navigating between Master (Shop) and Detail (Product) views.
*   **Real-time Feedback:** State management using **Provider** to update Wishlist and Cart badges instantly.

---

## 📱 Responsive Implementation
The app is engineered to work across various Android screen sizes and orientations:
*   **Grid Adaptation:** Using `LayoutBuilder`, the product grid intelligently switches from a 2-column layout on phones to a 4-column layout on tablets.
*   **Orientation Handling:** Views are wrapped in `SingleChildScrollView` and `SafeAreas` to ensure content remains useful and visually pleasing in both Portrait and Landscape modes.

---

## 🚀 Navigation Logic
The application utilizes a multi-layered navigation system:
1.  **Onboarding:** A clean `WelcomeScreen` providing paths to Auth.
2.  **Authentication:** Login and Signup screens with `Form` validation.
3.  **Main Hub:** A fixed `BottomNavigationBar` (Material 3) providing access to the five core app sections:
    - **Home:** Featured banners and best sellers.
    - **Shop:** Full product catalog.
    - **Wishlist:** Favorite items management.
    - **Cart:** Shopping cart overview.
    - **Profile:** User account settings.

---

## 🛠️ Tech Stack
*   **Framework:** Flutter (Dart)
*   **State Management:** Provider
*   **Design System:** Material 3
*   **Fonts:** Poppins (Google Fonts)
*   **Icons:** Material Symbols & Cupertino Icons

---

## 🚀 Installation & Setup
1. **Clone the repository:**
   ```bash
   git clone https://github.com/salmamuzam/AaliyahsCollectionStore.git
   ```
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Run the application:**
   ```bash
   flutter run
   ```
---

## 📂 Folder Structure
  ```bash
  lib/
  ├── src/
  │   ├── constants/       # Theme colors, sizes, and static text strings
  │   ├── features/        # Feature-First architecture (Auth & Core Shop)
  │   │   ├── authentication/ # Screens for Login, Signup, and Welcome
  │   │   └── core/           # Screens for Home, Shop, Cart, and Profile
  │   └── provider/        # State Management (Cart & Favorite logic)
  ├── utils/               # Global theme configurations and validators
  └── main.dart            # App entry point and theme orchestration
  ```
