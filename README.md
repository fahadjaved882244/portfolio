# Portfolio Website - Flutter

Welcome to the repository for my **Portfolio Website** built using **Flutter**. This project showcases my skills, experience, and projects in a clean, responsive, and visually appealing manner. The website is designed to be fully responsive, ensuring a seamless experience across devices, including mobile, tablet, and desktop.

---

## Table of Contents

1. [Project Overview](#project-overview)
2. [Features](#features)
3. [Technologies Used](#technologies-used)
4. [Project Structure](#project-structure)
5. [Setup and Installation](#setup-and-installation)
6. [Running the Project](#running-the-project)
7. [Deployment](#deployment)
8. [Contributing](#contributing)
9. [License](#license)
10. [Contact](#contact)

---

## Project Overview

This portfolio website is a **Flutter web application** designed to showcase my professional journey, skills, and projects. It includes the following sections:

- **Home**: A brief introduction about me.
- **About**: Detailed information about my background, skills, and experience.
- **Projects**: A showcase of my recent projects with descriptions, technologies used, and links to live demos or repositories.
- **Contact**: A form to get in touch with me.

The website adheres to **Material Design principles** and is optimized for performance, accessibility, and responsiveness.

---

## Features

- **Responsive Design**: The website adapts seamlessly to different screen sizes, including mobile, tablet, and desktop.
- **Dark Mode Support**: Includes a toggle for light and dark themes.
- **Interactive UI**: Smooth animations and transitions for an engaging user experience.
- **Project Showcase**: Detailed project cards with images, descriptions, and links.
- **Contact Form**: A functional form to send messages directly to my email.
- **SEO Optimization**: Basic SEO practices implemented for better visibility on search engines.

---

## Technologies Used

- **Flutter**: The primary framework used for building the web application.
- **Dart**: The programming language used for Flutter development.
- **Firebase**: Used for hosting and backend services (e.g., contact form submissions).
- **Responsive Framework**: Ensures the website is fully responsive across devices.
- **Material Design**: Follows Google's Material Design guidelines for a consistent and modern UI.
- **Git**: Version control for managing the codebase.

---

## Project Structure

The project is organized as follows:

lib/
├── main.dart # Entry point of the application
├── constants/ # Constants like colors, strings, and styles
├── models/ # Data models (e.g., Project, Skill)
├── screens/ # All the screens/pages of the app
│ ├── home_screen.dart # Home screen
│ ├── about_screen.dart # About screen
│ ├── projects_screen.dart # Projects screen
│ └── contact_screen.dart # Contact screen
├── widgets/ # Reusable UI components
│ ├── app_bar.dart # Custom app bar
│ ├── project_card.dart # Project card widget
│ └── theme_toggle.dart # Dark/light theme toggle
├── services/ # Backend services (e.g., Firebase integration)
└── utils/ # Utility functions and helpers


---

## Setup and Installation

Follow these steps to set up the project locally:

### Prerequisites

- **Flutter SDK**: Ensure you have Flutter installed. If not, follow the [official installation guide](https://flutter.dev/docs/get-started/install).
- **IDE**: Use **Android Studio** or **VS Code** with the Flutter and Dart plugins installed.
- **Git**: Install Git to clone the repository.

### Steps

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/portfolio-website-flutter.git
   cd portfolio-website-flutter

### Install Dependencies

flutter pub get