class ImageAssets {
  static const logo = '../assets/images/logo.png';
  static const logo_trans = '../assets/images/logo-transparent.png';
}

// class FontAssets {
//   static const parcifico = "../assets/fonts/Pacifico/Pacifico-Regular.ttf";
//   static const karla = "../assets/fonts/Karla/Karla-Regular.ttf";
//   static const karla_m = "../assets/fonts/Karla/Karla-Medium.ttf";
//   static const karla_mi = "../assets/fonts/Karla/Karla-MediumItalic.ttf";
//   static const karla_b = "../assets/fonts/Karla/Karla-SemiBold.ttf";
//   static const karla_bi = "../assets/fonts/Karla/Karla-SemiBoldItalic.ttf";
// }

final List<Map<String, dynamic>> Courses = [
  {'name': 'Biology Fundamentals', 'info': 'This is a text that will be displayed', 'instructors': ['Mbah Lesky', 'Jik Alvin'], 'dataAdded': DateTime.now(), 'duration': const Duration(days: 10, hours: 12, minutes: 30), 'type': 'science'},
  {'name': 'Chemistry Fundamentals', 'info': 'This is a text that will be displayed, This is a text that will be displayed, This is a text that will be displayed, This is a text that will be displayed, This is a text that will be displayed', 'instructors': ['Mbah Lesky'], 'dataAdded': DateTime.now(), 'duration': const Duration(days: 10, hours: 12, minutes: 30), 'type': 'science'},
  {'name': 'Maths Fundamentals', 'info': 'This is a text that will be displayed', 'instructors': ['Blessed Lionson','Mbah Lesky', 'Some Other'], 'dataAdded': DateTime.now(), 'duration': const Duration(days: 23, hours: 12), 'type': 'arts'},
  {'name': 'Computer Fundamentals', 'info': 'This is a text that will be displayed', 'instructors': ['Mbah Lesky', 'Marco Marc'], 'dataAdded': DateTime.now(), 'duration': const Duration(days: 14, minutes: 30), 'type': 'war'},
  {'name': 'English Fundamentals', 'info': 'This is a text that will be displayed', 'instructors': ['Mbah Lesky', 'Olga Yoo'], 'dataAdded': DateTime.now(), 'duration': const Duration(days: 10, hours: 12, minutes: 30), 'type': 'stories'},
  {'name': 'French Fundamentals', 'info': 'This is a text that will be displayed', 'instructors': ['Mbah Lesky', 'Lionson King', 'Some Other', 'First Jedi', 'Marco Marc', 'Olga Yoo'], 'dataAdded': DateTime.now(), 'duration': const Duration(days: 10, hours: 12, minutes: 30), 'type': 'politics'},
  {'name': 'Other Couurse Fundamentals', 'info': 'This is a text that will be displayed', 'instructors': ['Mbah Lesky'], 'dataAdded': DateTime.now(), 'duration': const Duration(days: 10, hours: 12, minutes: 30), 'type': 'literature'},
];

final all_images = ['campus-1', 'campus-2', 'classroom'];