import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:personal_portfolio/shared/constants/commonStyle.dart';
import 'package:personal_portfolio/model/Service.dart';

import 'model/Education.dart';
import 'model/Experience.dart';
import 'model/Project.dart';
import 'model/Social.dart';
import 'model/Technology.dart';

class DashboardController extends GetxController {
RxBool switchMode = false.obs;

RxList<bool> hovers=[
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
].obs;
onHover(int index,bool value){
  hovers[index]=value;
}


List<Service> services = [
  Service(
    title: "App Developer",
    icon: CommonStyle.flutter,
  ),
  Service(
    title: "Web Developer",
    icon: CommonStyle.web,
  ),
  Service(
    title: "React Developer",
    icon: CommonStyle.react,
  ),
  Service(
    title: "Backend Developer",
    icon: CommonStyle.backend,
  ),
];

List<Technology> technologies = [
  Technology(name: "HTML 5", icon: CommonStyle.html),
  Technology(name: "CSS 3", icon: CommonStyle.css),
  Technology(name: "JavaScript", icon: CommonStyle.javascript),
  Technology(name: "Ruby", icon: CommonStyle.ruby),
  Technology(name: "Ruby On Rails", icon: CommonStyle.ror),
  Technology(name: "React JS", icon: CommonStyle.reactjs),
  Technology(name: "Redux Toolkit", icon: CommonStyle.redux),
  Technology(name: "Material UI", icon: CommonStyle.mi),
  Technology(name: "Tailwind CSS", icon: CommonStyle.tailwind),
  Technology(name: "Node JS", icon: CommonStyle.nodejs),
  Technology(name: "SQL", icon: CommonStyle.sql),
  Technology(name: "JWT", icon: CommonStyle.jwt),
  Technology(name: "git", icon: CommonStyle.git),
  Technology(name: "figma", icon: CommonStyle.figma),
  // Technology(name: "Jira", icon: CommonStyle.jira),
  Technology(name: "Dialog flow", icon: CommonStyle.df),
  Technology(name: "Flutter", icon: CommonStyle.flutter),

];

List<Experience> experiencesData = [
  Experience(
    title: "Flutter Developer",
    companyName: "Fincare Small finance Bank",
    icon: CommonStyle.fincare, // Assuming 'fincare' is an asset path in Flutter
    iconBg: "#383E56",
    date: "Jun 2022 - ongoing",
    points: [
      "Developing and maintaining App using Flutter and Material Design and other related technologies.",
      "Develop reusable Widgets and write efficient code using GetX",
    ],
  ),
  Experience(
    title: "React.js Developer",
    companyName: "Schrocken Inc.",
    icon: CommonStyle.schrocken, // Assuming 'schrocken' is an asset path in Flutter
    iconBg: "#383E56",
    date: "May 2022 - April 2023",
    points: [
      "Developing and maintaining web applications using React.js and other related technologies.",
      "Collaborating with cross-functional teams including designers, product managers, and other developers to create high-quality products.",
      "Implementing responsive design and ensuring cross-browser compatibility.",
      "Participating in code reviews and providing constructive feedback to other developers.",
      "Expertise in developing intuitive and visually appealing designs using Material UI",
      "Develop reusable components and write efficient code using React hooks",
      "Familiarity with version control tools such as Git and working in an Agile environment",
      "Simplified access to the Redux store for better state management and code organization.",
      "Successfully implemented Redux hooks to meet project functional requirements."
    ],
  ),
  Experience(
    title: "Associate NodeJS Developer",
    companyName: "Celebal Technology",
    icon: CommonStyle.ct, // Assuming 'ct' is an asset path in Flutter
    iconBg: "#E6DEDD",
    date: "Sep 2021 - May 2022",
    points: [
      "Developing and maintaining chatbots using Node.Js and other related technologies.",
      "Expertise in using Dialogflow to build chatbots with natural language processing capabilities.",
      "Skilled in integrating chatbots with third-party APIs.",
      "Understanding of chatbot design patterns for creating effective and engaging chatbots.",
      "Conversational design skills to create meaningful conversations in chatbots",
      "Problem-solving skills to identify and troubleshoot issues in chatbot development."
    ],
  ),
  Experience(
    title: "ROR Developer",
    companyName: "Chetu Inc.",
    icon: CommonStyle.chetu, // Assuming 'chetu' is an asset path in Flutter
    iconBg: "#383E56",
    date: "Jan 2022 - Jan 2023",
    points: [
      "Developing and maintaining web applications using React.js and other related technologies.",
      "Collaborating with cross-functional teams including designers, product managers, and other developers to create high-quality products.",
      "Implementing responsive design and ensuring cross-browser compatibility.",
      "Participating in code reviews and providing constructive feedback to other developers.",
    ],
  ),
];

List<Education> educations = [
  Education(
    title: "B.Tech",
    collegeName: "Greater Noida Institute Of Technology",
    icon: CommonStyle.gniot, // Replace with actual icon asset reference
    iconBg: "#383E56",
    date: "May 2015 - May 2019",
    branch: 'Computer Science Engineering',
    percentage: '69.2%',
  ),
  Education(
    title: "Intermediate",
    collegeName: "Jawahar Navodaya Vidyalaya RangaReddy Hyderabad",
    icon: CommonStyle.jnvs,
    iconBg: "#383E56",
    date: "May 2012 - May 2015",
    branch: 'Mathematics',
    percentage: '82.2%',
  ),
  Education(
    title: "Matriculation",
    collegeName: "Jawahar Navodaya Vidyalaya Supaul Bihar",
    icon: CommonStyle.jnvs,
    iconBg: "#383E56",
    date: "May 2010 - May 2012",
    branch: 'Mathematics',
    percentage: '84.6%',
  )
];

List<Project> projects = [
  Project(
    name: "Relationship Manager Website",
    description:
    "FincareOne is the Mobile Application aims to create a feature-rich clone of the Microsoft Kaizala mobile application using Flutter, GetX, and Material Design. By leveraging these technologies, the application will offer a seamless and user-friendly communication and collaboration experience, encompassing messaging, group interactions, task management, polls, and more. The use of Firebase and a well-designed backend will ensure real-time synchronization and data security. The end result will be a powerful and efficient communication platform suitable for organizations and individuals.",
    tags: [
      {"name": "Flutter", "color": "redTextGradient"},
      {"name": "Material Design", "color": "blueTextGradient"},
      {"name": "GetX", "color": "greenTextGradient"},
    ],
    image: CommonStyle.crossSell,
    sourceCodeLink: "https://github.com/",
  ),  Project(

    name: "Relationship Manager App",
    description:
    "FincareOne is the Mobile Application aims to create a feature-rich clone of the Microsoft Kaizala mobile application using Flutter, GetX, and Material Design. By leveraging these technologies, the application will offer a seamless and user-friendly communication and collaboration experience, encompassing messaging, group interactions, task management, polls, and more. The use of Firebase and a well-designed backend will ensure real-time synchronization and data security. The end result will be a powerful and efficient communication platform suitable for organizations and individuals.",
    tags: [
      {"name": "Flutter", "color": "redTextGradient"},
      {"name": "Material Design", "color": "blueTextGradient"},
      {"name": "GetX", "color": "greenTextGradient"},
    ],
    image: CommonStyle.crossSell,
    sourceCodeLink: "https://github.com/",
  ),
  Project(
    name: "FincareOne | Branch Change Class Change",
    description:
    "FincareOne is the Mobile Application aims to create a feature-rich clone of the Microsoft Kaizala mobile application using Flutter, GetX, and Material Design. By leveraging these technologies, the application will offer a seamless and user-friendly communication and collaboration experience, encompassing messaging, group interactions, task management, polls, and more. The use of Firebase and a well-designed backend will ensure real-time synchronization and data security. The end result will be a powerful and efficient communication platform suitable for organizations and individuals.",
    tags: [
      {"name": "Flutter", "color": "redTextGradient"},
      {"name": "Material Design", "color": "blueTextGradient"},
      {"name": "GetX", "color": "greenTextGradient"},
    ],
    image: CommonStyle.crossSell,
    sourceCodeLink: "https://github.com/",
  ),
  Project(
    name: "FincareOne | CrossSell",
    description:
    "FincareOne is the Mobile Application aims to create a feature-rich clone of the Microsoft Kaizala mobile application using Flutter, GetX, and Material Design. By leveraging these technologies, the application will offer a seamless and user-friendly communication and collaboration experience, encompassing messaging, group interactions, task management, polls, and more. The use of Firebase and a well-designed backend will ensure real-time synchronization and data security. The end result will be a powerful and efficient communication platform suitable for organizations and individuals.",
    tags: [
      {"name": "Flutter", "color": "redTextGradient"},
      {"name": "Material Design", "color": "blueTextGradient"},
      {"name": "GetX", "color": "greenTextGradient"},
    ],
    image: CommonStyle.crossSell,
    sourceCodeLink: "https://github.com/",
  ),
  Project(
    name: "Cell and Gene Therapy",
    description:
    "Cell and Gene Therapy project, which involves developing a next-generation ecosystem for therapy that utilizes the biological properties of cells/DNA/RNA to target and cure diseases. The therapies consist of living cells, which act as the drug and produce the desired therapeutic effect. Examples include stem cell-based treatments, bone marrow transplants, and CAR-Ts. The CGT solution ecosystem includes a range of stakeholders, such as Pharma Companies/Sponsors, Treating Hospitals, Patients, Apheresis/Collection Centers, Specialty Distributors, Logistics, CDMOs, QC Labs, Monitoring Hospitals, and Insurance providers.",
    tags: [
      {"name": "js", "color": "redTextGradient"},
      {"name": "react", "color": "blueTextGradient"},
      {"name": "redux", "color": "greenTextGradient"},
      {"name": "material ui", "color": "pinkTextGradient"},
      {"name": "css", "color": "blueTextGradient"},
    ],
    image: CommonStyle.cgt,
    sourceCodeLink: "https://github.com/",
  ),
  Project(
    name: "Mosymphony | Quality Event Module",
    description:
    "Mosymphony is a cutting-edge application designed to streamline contract manufacturing processes for enterprises in the pharmaceutical industry. The platform fosters transparency and communication between Pharma sponsors and CMOs, while the quality event module tracks and records every event and quality control to ensure accountability. By providing secure communication channels, reliable data sharing, and real-time updates, Mosymphony builds trust and guarantees smooth manufacturing and distribution processes.",
    tags: [
      {"name": "js", "color": CommonStyle.redTextGradient.toString()},
      {"name": "react", "color": "blueTextGradient"},
      {"name": "redux", "color": "greenTextGradient"},
      {"name": "material ui", "color": "pinkTextGradient"},
      {"name": "css", "color": "blueTextGradient"},
    ],
    image: CommonStyle.qem,
    sourceCodeLink: "https://github.com/",
  ),
  Project(
    name: "Netflix Clone",
    description:
    "The Netflix Clone project is aimed at creating a replica of the popular streaming platform, Netflix, using React and GraphQL. The project will allow users to browse and watch movies and TV shows, just like on the original platform.",
    tags: [
      {"name": "ReactJS", "color": "greenTextGradient"},
      {"name": "GraphQL API", "color": "blueTextGradient"},
      {"name": "DataStax AstraDB", "color": "yellowTextGradient"},
      {"name": "Netlify", "color": "blueTextGradient"},
    ],
    image: CommonStyle.netflix,
    sourceCodeLink: "https://github.com/arun2github/workshop-graphql-netflix",
  ),
  Project(
    name: "Node Mailer",
    description:
    "The project is aimed at building an application that enables users to send a large number of emails using Node.js and the nodemailer library. The application will allow users to compose and send personalized emails to a large number of recipients with ease.",
    tags: [
      {"name": "NodeJS", "color": "greenTextGradient"},
      {"name": "js", "color": "blueTextGradient"},
      {"name": "sql", "color": "yellowTextGradient"},
    ],
    image: CommonStyle.nodeMailer,
    sourceCodeLink: "https://github.com/arun2github/Nodemailer/tree/master",
  ),
];


final List<SocialMedia> socialMediaList = [
  SocialMedia(
    name: 'Linkedin',
    img: CommonStyle.ln, // Replace with your actual image asset or URL
    sourceLink: "https://www.linkedin.com/in/imarunjnv/",
  ),
  SocialMedia(
    name: 'Instagram',
    img: CommonStyle.instagram, // Replace with your actual image asset or URL
    sourceLink: 'https://www.instagram.com/infamous_fluky/',
  ),
  SocialMedia(
    name: 'Facebook',
    img: CommonStyle.fb, // Replace with your actual image asset or URL
    sourceLink: 'https://www.facebook.com/arun.disambiguation?mibextid=ZbWKwL',
  ),
  SocialMedia(
    name: 'GitHub',
    img: CommonStyle.github,
    sourceLink: 'https://github.com/arun2github',
  ),
];


RxList serviceList = <Service>[].obs;
RxList technologyList = <Technology>[].obs;
RxList experienceList = <Experience>[].obs;
RxList educationList = <Education>[].obs;
RxList projectList = <Project>[].obs;
RxList socialList = <SocialMedia>[].obs;



void fetchServices() {
  // Assign the services list to the observable list
  serviceList.assignAll(services);
}
void fetchTechnologies() {
  // Assign the services list to the observable list
  technologyList.assignAll(technologies);
  print('technologyList ********************');
}
void fetchExperiences() {
  // Assign the services list to the observable list
  experienceList.assignAll(experiencesData);

}
void fetchEducation() {
  // Assign the services list to the observable list
  educationList.assignAll(educations);

}
void fetchProjectList() {
  // Assign the services list to the observable list
  projectList.assignAll(projects);

}
void fetchSocialMediaList() {
  // Assign the services list to the observable list
  socialList.assignAll(socialMediaList);

}

@override
void onInit() {
  print('***************************************');
  // Call fetchServices on initialization
  fetchServices();
  fetchTechnologies();
  fetchExperiences();
  fetchEducation();
  fetchProjectList();
  fetchSocialMediaList();
  super.onInit();
}
}