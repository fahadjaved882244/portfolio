# Portfolio Website - Flutter

Welcome to the repository for my **Portfolio Website** built using **Flutter** and **Microsoft Azure**. This project showcases my skills, experience, and projects in a clean, responsive, and visually appealing manner. The website is designed to be fully responsive, ensuring a seamless experience across devices, including mobile, tablet, and desktop.

---

## Table of Contents

1. [Project Overview](#project-overview)
2. [Features](#features)
3. [Technologies Used](#technologies-used)
4. [Project Structure](#project-structure)
5. [Setup and Installation](#setup-and-installation)
6. [Running the Project](#running-the-project)
7. [Deployment](#deployment)
8. [License](#license)
9. [Contact](#contact)

---

## Project Overview

This portfolio website is a **Flutter web application** designed to showcase my professional journey, skills, and projects. It includes the following sections:

- **Home**: A brief introduction about me.
- **About**: Detailed information about my background, skills, and experience.
- **Projects**: A showcase of my recent projects with descriptions and links to live demos.
- **Contact**: A form to get in touch with me.

The website adheres to **Material Design principles** and is optimized for performance, accessibility, and responsiveness.

---

## Features

- **Responsive Design**: The website adapts seamlessly to different screen sizes, including mobile, tablet, and desktop.
- **Interactive UI**: Smooth animations and transitions for an engaging user experience.
- **Dark Mode Support**: Includes a toggle for light and dark themes.
- **Deep Linking**: Enables navigation directly to specific pages via URLs.
- **Azure DevOps**: Configured a CI/CD pipeline using Azure DevOps service.
- **Azure Hosting**: Deployment and hosting on Azure cloud infrastructure.

---

## Technologies Used

| SDLC Phase      | Technologies Used |
|---------------|-----------------|
| **Planning**   | Trello |
| **Design**     | Material 3 |
| **Development** | Flutter, Riverpod, GoRouter  |
| **Database** | Azure Cosmo Db  |
| **Testing**    | Unit Testing, Widget Testing |
| **Deployment** | Azure Static Web Apps  |
| **CI/CD** | Azure DevOps |

### Explanation of Technologies

- **Trello**: A Kanban project management tool used for task tracking and collaboration.
- **Material 3**: The latest design system by Google, providing modern UI components and themes.
- **Flutter**: A UI toolkit for building natively compiled applications across multiple platforms from a single codebase.
- **Riverpod**: A declarative and compile safe state management library, offering improved performance and testability. 
- **GoRouter**: A declarative routing package for managing navigation in Flutter applications.
- **Azure Cosmo DB**: A globally distributed, NoSQL database service optimized for scalability and performance.
- **Unit Testing**: A methodology for testing individual components of the application to ensure correctness.
- **Widget Testing**: A testing framework for verifying UI components and interactions in Flutter applications.
- **Azure Static Web Apps**: A cloud service for deploying and hosting static applications with automated scaling.
- **Azure DevOps**: A suite of development tools for version control, CI/CD pipelines, and project management.


---

## Project Structure

The project is organized as follows:

## Project Structure

This Flutter project follows a **Feature-First** approach combined with the **MVC (Model-View-Controller) architecture** to ensure modularity, scalability, and maintainability. Below is the directory structure:

```
project_root/
│── lib/
│   │   
│   │── core/			# Contains global utilities, constants, and shared services
│   │   
│   │── data/			# Handles data sources (APIs, local storage, etc.)
│   │   
│   │── features/		# Organizes code by feature
│   │   │── feature_name/
│   │   │   │── controller/	# Business logic and state management
│   │   │   │── model/		   # Data structures and domain models
│   │   │   │── view/		   # UI components and widgets
│   │   │       │── widgets/        # Reusable widgets specific to the feature
│   │   │       │── view.dart       # UI code of the specific feature
│   │   │
│   │── routes/      # Handles app navigation
│   │── main.dart    # Application entry point
│
│── assets/			# Contains images, fonts, and other static resources
│── pubspec.yaml	# Dependencies and project metadata
│── README.md		# Project documentation
```

Each feature within the `features/` directory is self-contained, following the MVC pattern to maintain a clean separation of concerns.


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
   git clone https://github.com/fahadjaved882244/portfolio.git
   cd portfolio

2. **Install Dependencies**:
   ```bash
   flutter pub get

3. **Run the Project**:
   ```bash
   flutter run -d chrome

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

## Contact

If you have any questions or feedback, feel free to reach out:

- **Email**: fahadjaved882244@gmail.com

- **LinkedIn**: [linkedin.com/fahadjaved882244](https://www.linkedin.com/in/fahadjaved882244/)

- **GitHub**: [github.com/fahadjaved882244](https://github.com/fahadjaved882244)

---

Thank you for visiting my portfolio website repository! 🚀
