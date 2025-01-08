import 'package:aali_portfolio/data/project_model.dart';
import 'package:aali_portfolio/data/skills_model.dart';
import 'package:aali_portfolio/data/experience_model.dart';

class MyData {
  /// List of experience [Title] [Source] [TimePeriod] [Points] [indicatorIcon]
  static const List<ExperienceModel> experience = [
    // React Development
    ExperienceModel(
      title: "React Developer",
      source: "React - The Complete Guide 2024 by Maximilian",
      timePeriod: "December 2024",
      indicatorIcon: "asset/svg/react.svg",
      points: <String>[
        "Completed Maximilian Schwarzmüller's React course, mastering React fundamentals and advanced concepts.",
        "Built dynamic web applications using React, Next.js, and Redux Toolkit.",
        "Gained expertise in state management, server-side rendering, and API integrations.",
        "Worked on real-world projects showcasing responsive designs and efficient code.",
      ],
    ),

    // Cybersecurity
    ExperienceModel(
      title: "Cybersecurity",
      source: "Google Certification Course",
      timePeriod: "September 2024",
      indicatorIcon: "asset/svg/cybersecurity_dev_indicator.svg",
      points: <String>[
        "Studying cybersecurity fundamentals, including vulnerability assessment.",
        "Gaining hands-on experience in secure coding and threat modeling.",
        "Exploring applications of cybersecurity in app and web development.",
        "Working on network security and data protection projects.",
      ],
    ),

    // Machine Learning
    ExperienceModel(
      title: "Machine Learning",
      source: "Academic Project",
      timePeriod: "June 2024",
      indicatorIcon: "asset/svg/machine_learning_dev_indicator.svg",
      points: <String>[
        "Developed a project predicting campus placements based on academic data.",
        "Gained experience in data preprocessing, feature engineering, and evaluation.",
        "Improved model accuracy through parameter tuning.",
        "Explored predictive analysis with real-world datasets.",
      ],
    ),

    // Python Development
    ExperienceModel(
      title: "Python Developer",
      source: "Angela Yu's 100 Days of Python Course & Personal Projects",
      timePeriod: "November 2023",
      indicatorIcon: "asset/svg/python_dev_indicator.svg",
      points: <String>[
        "Completed Angela Yu's 100 Days of Python course, mastering Python programming.",
        "Built projects like Snake, Pong, web scrapers, and automation scripts.",
        "Created data analysis dashboards using Pandas and Matplotlib.",
        "Developed Flask web apps with REST APIs and database integration.",
      ],
    ),

    // Flutter Development
    ExperienceModel(
      title: "Flutter Developer",
      source: "Self-Initiated Projects & Angela Yu's Flutter Bootcamp",
      timePeriod: "June 2023",
      indicatorIcon: "asset/svg/flutter.svg",
      points: <String>[
        "Completed Angela Yu's Flutter Development Bootcamp, gaining expertise in cross-platform app development.",
        "Developed apps for academic and personal projects, focusing on practical problem-solving.",
        "Built a Shorts News Feed App with efficient API integration and a clean, user-friendly UI.",
        "Mastered state management with GetX and applied it to projects like EngineeringHub and NewsSnippets.",
      ],
    ),

    // Web Development
    ExperienceModel(
      title: "Web Developer",
      source: "Web Development Bootcamp by Angela Yu & Additional Projects",
      timePeriod: "January 2023",
      indicatorIcon: "asset/svg/web_dev_indicator.svg",
      points: <String>[
        "Mastered full-stack development using HTML, CSS, JavaScript, Node.js, and MongoDB.",
        "Developed responsive projects, including Blog App, To-Do List App, and e-commerce websites.",
        "Gained experience in backend development with Express.js and database integration.",
        "Worked on SEO optimization, web animations, and enhancing user experience.",
      ],
    ),
  ];

  /// List of logos that are used in widget globe on about section
  static const List<String> logos = [
    "asset/svg/android.svg",
    "asset/svg/api.svg",
    "asset/svg/aws.svg",
    "asset/svg/c.svg",
    "asset/svg/canva.svg",
    "asset/svg/cplusplus.svg",
    "asset/svg/css.svg",
    "asset/svg/dart.svg",
    "asset/svg/docker.svg",
    "asset/svg/figma.svg",
    "asset/svg/firebase.svg",
    "asset/svg/flutter.svg",
    "asset/svg/getx.svg",
    "asset/svg/git.svg",
    "asset/svg/github.svg",
    "asset/svg/html.svg",
    "asset/svg/java.svg",
    "asset/svg/javascript.svg",
    "asset/svg/lightroom.svg",
    "asset/svg/linkedin.svg",
    "asset/svg/mongodb.svg",
    "asset/svg/mysql.svg",
    "asset/svg/nextjs.svg",
    "asset/svg/photoshop.svg",
    "asset/svg/php.svg",
    "asset/svg/postman.svg",
    "asset/svg/python.svg",
    "asset/svg/r.svg",
    "asset/svg/react.svg",
    "asset/svg/vscode.svg",
  ];

  /// List of skills sets i have [AppDevelopment] [Backend Development] [Web Development] [UI/UX Design]
  static List<SkillsModel> skills = [
    SkillsModel(
      title: "App Development",
      logoUrl: "asset/svg/app_development.svg",
      info: "Cross-platform apps with sleek design",
    ),
    SkillsModel(
      title: "Web Development",
      logoUrl: "asset/svg/web_development.svg",
      info: "Responsive and modern websites.",
    ),
    SkillsModel(
      title: "Backend Development",
      logoUrl: "asset/svg/backend_development.svg",
      info: "Scalable backends and APIs.",
    ),
    SkillsModel(
      title: "UI/UX Design",
      logoUrl: "asset/svg/ui_ux_designer.svg",
      info: "User-friendly, aesthetic designs.",
    ),
  ];

  /// List of projects that i have made [Title] [Description] [Image] [Repo Url] [Tech - tags]
  static List<ProjectModel> projects = [
    ProjectModel(
      title: "GoSafe",
      subtitle: "Navigate safer routes with real-time alerts.",
      description:
          'GoSafe is a safety mobile app designed to help users navigate safer routes by analyzing crime rates. It uses location, microphone, and call permissions to provide real-time safety alerts, monitor risky sounds, and trigger emergency actions like sending alerts to parents and calling police stations. GoSafe ensures quick responses during critical situations and peace of mind for users traveling alone or in unfamiliar areas.',
      image: "asset/image/GoSafe.png",
      sourceUrl: "https://google.com",
      tags: ['Flutter', 'Dart', 'Firebase', 'Google Maps API', 'ML Model', 'GetX'],
    ),
    ProjectModel(
      title: "EngineeringHub",
      subtitle: "Connect and collaborate with peers easily.",
      description:
          'EngineeringHub is a platform that connects students across various engineering colleges in the same university. It allows users to join groups based on their department and semester, enabling communication and resource sharing. Students can chat, share notes, and discuss academic topics. With Firebase for authentication, and PHP and SQL for backend management, the app fosters collaboration among students.',
      image: "asset/image/EngineeringHub.png",
      sourceUrl: "https://google.com",
      tags: ['Flutter', 'Dart', 'Firebase', 'PHP', 'SQL', 'GetX'],
    ),
    ProjectModel(
      title: "NewsSnippet",
      subtitle: "Bite-sized news for on-the-go updates.",
      description:
          'NewsSnippet delivers bite-sized news updates, inspired by the InShorts app. It provides users with quick, relevant news stories in a user-friendly interface. The app uses efficient API handling to deliver real-time news, with fast loading times and easy navigation, ensuring a smooth and seamless experience for users looking to stay informed on-the-go.',
      image: "asset/image/NewsSnippet.png",
      sourceUrl: "https://google.com",
      tags: ['Flutter', 'Dart', 'GetX', 'Firebase', 'API Integration'],
    ),
    ProjectModel(
      title: "TaskPilot",
      subtitle: "Stay productive with intuitive task management.",
      description:
          'TaskPilot is a productivity app that helps users manage their tasks effectively. Users can create to-do lists, set reminders, and get notified. The app offers intuitive features to add, edit, delete, or mark tasks as complete. With a sleek design and user-friendly interface, TaskPilot ensures users stay on track and never miss an important task.',
      image: "asset/image/TaskPilot.png",
      sourceUrl: "https://google.com",
      tags: ["Flutter", "Hive", "Dart", "Local Notification"],
    ),
    ProjectModel(
      title: "Foodie",
      subtitle: "Showcasing advanced UI design in Flutter.",
      description:
          'Foodie is a visually rich app built with Flutter to showcase advanced UI techniques. It features smooth animations, custom transitions, and a dynamic interface for a highly engaging user experience. The app highlights the power of Flutter in creating aesthetic and performant designs.',
      image: "asset/image/Foodie.png",
      sourceUrl: "https://google.com",
      tags: ['Flutter', 'Dart', 'Custom Animations', 'UI/UX'],
    ),
  ];

  /// List of social button source urls
  static const List<String> socialLinks = [
    "https://github.com/ahmad-dev7",
    "https://www.linkedin.com/in/aali-dev/",
    "https://stackoverflow.com/users/20099380/ahmad-ali",
    "https://devfolio.co/@aalidev7",
  ];

  /// List of social button icon path
  static const List<String> socialIcons = [
    "asset/svg/github.svg",
    "asset/svg/linkedin.svg",
    "asset/svg/stackoverflow.svg",
    "asset/svg/devfolio.svg",
  ];

  /// List of languages
  static const List<String> languages = [
    'English',
    'Hindi (हिन्दी),',
    'Urdu (اردو)',
    'Marathi (मराठी)',
  ];

  static const String contactSectionIntro =
      "I'm always interested in hearing about new projects and opportunities. Let's create something amazing together.";

  static const String skillSectionIntro =
      "I'm a passionate software developer with expertise in Dart, JavaScript, and frameworks like Flutter and Node.js. I excel at crafting efficient, scalable, and intuitive applications, combining clean code with a user-focused approach. With a knack for problem-solving and attention to detail, I deliver solutions that not only meet but exceed expectations. Let’s collaborate to turn your vision into reality!";
  static const String projectSectionIntro =
      "Following projects showcases my skills and experience through real-world examples of my work. Each project is briefly described with links to code repositories and live demos in it. It reflects my ability to solve complex problems, work with different technologies, and manage projects effectively.";
}
