// class Fontdata {
//   static const parcifico = "../data/fonts/Pacifico/Pacifico-Regular.ttf";
//   static const karla = "../data/fonts/Karla/Karla-Regular.ttf";
//   static const karla_m = "../data/fonts/Karla/Karla-Medium.ttf";
//   static const karla_mi = "../data/fonts/Karla/Karla-MediumItalic.ttf";
//   static const karla_b = "../data/fonts/Karla/Karla-SemiBold.ttf";
//   static const karla_bi = "../data/fonts/Karla/Karla-SemiBoldItalic.ttf";
// }

final List<Map<String, dynamic>> Modules = [
  {
    "name": "Introduction",
    "notes": [
      "first paragraph, The NumPy histogram function applied to an array returns a pair of vectors: "
          'the histogram of the array and a vector of the bin edges. Beware: matplotlib also has a function to build histograms (called hist, as in Matlab) '
          'that differs from the one in NumPy. The main difference is that pylab.hist plots the histogram automatically, while numpy.'
          'histogram only generates the data.',
      "Second paragraph, The NumPy histogram function applied to an array returns a pair of vectors: "
          'the histogram of the array and a vector of the bin edges. Beware: matplotlib also has a function to build histograms (called hist, as in Matlab) '
          'that differs from the one in NumPy. The main difference is that pylab.hist plots the histogram automatically, while numpy.'
          'histogram only generates the data.',
      "Third paragraph, The NumPy histogram function applied to an array returns a pair of vectors: "
          'the histogram of the array and a vector of the bin edges. Beware: matplotlib also has a function to build histograms (called hist, as in Matlab) '
          'that differs from the one in NumPy. The main difference is that pylab.hist plots the histogram automatically, while numpy.'
          'histogram only generates the data.',
    ],
    'image': "campus-1",
    'video': '',
    'pdf': '',
  },
  {
    "name": "Starting",
    "notes": [
      "first paragraph, The NumPy histogram function applied to an array returns a pair of vectors: "
          'the histogram of the array and a vector of the bin edges. Beware: matplotlib also has a function to build histograms (called hist, as in Matlab) '
          'that differs from the one in NumPy. The main difference is that pylab.hist plots the histogram automatically, while numpy.'
          'histogram only generates the data.',
      "Second paragraph, The NumPy histogram function applied to an array returns a pair of vectors: "
          'the histogram of the array and a vector of the bin edges. Beware: matplotlib also has a function to build histograms (called hist, as in Matlab) '
          'that differs from the one in NumPy. The main difference is that pylab.hist plots the histogram automatically, while numpy.'
          'histogram only generates the data.',
      "Third paragraph, The NumPy histogram function applied to an array returns a pair of vectors: "
          'the histogram of the array and a vector of the bin edges. Beware: matplotlib also has a function to build histograms (called hist, as in Matlab) '
          'that differs from the one in NumPy. The main difference is that pylab.hist plots the histogram automatically, while numpy.'
          'histogram only generates the data.',
    ],
    'image': "campus-1",
    'video': '',
    'pdf': '',
  },
  {
    "name": "Body",
    "notes": [
      "first paragraph, The NumPy histogram function applied to an array returns a pair of vectors: "
          'the histogram of the array and a vector of the bin edges. Beware: matplotlib also has a function to build histograms (called hist, as in Matlab) '
          'that differs from the one in NumPy. The main difference is that pylab.hist plots the histogram automatically, while numpy.'
          'histogram only generates the data.',
      "Second paragraph, The NumPy histogram function applied to an array returns a pair of vectors: "
          'the histogram of the array and a vector of the bin edges. Beware: matplotlib also has a function to build histograms (called hist, as in Matlab) '
          'that differs from the one in NumPy. The main difference is that pylab.hist plots the histogram automatically, while numpy.'
          'histogram only generates the data.',
      "Third paragraph, The NumPy histogram function applied to an array returns a pair of vectors: "
          'the histogram of the array and a vector of the bin edges. Beware: matplotlib also has a function to build histograms (called hist, as in Matlab) '
          'that differs from the one in NumPy. The main difference is that pylab.hist plots the histogram automatically, while numpy.'
          'histogram only generates the data.',
    ],
    'image': "classroom",
    'video': '',
    'pdf': '',
  },
  {
    "name": "Concluding",
    "notes": [
      "first paragraph, The NumPy histogram function applied to an array returns a pair of vectors: "
          'the histogram of the array and a vector of the bin edges. Beware: matplotlib also has a function to build histograms (called hist, as in Matlab) '
          'that differs from the one in NumPy. The main difference is that pylab.hist plots the histogram automatically, while numpy.'
          'histogram only generates the data.',
      "Second paragraph, The NumPy histogram function applied to an array returns a pair of vectors: "
          'the histogram of the array and a vector of the bin edges. Beware: matplotlib also has a function to build histograms (called hist, as in Matlab) '
          'that differs from the one in NumPy. The main difference is that pylab.hist plots the histogram automatically, while numpy.'
          'histogram only generates the data.',
      "Third paragraph, The NumPy histogram function applied to an array returns a pair of vectors: "
          'the histogram of the array and a vector of the bin edges. Beware: matplotlib also has a function to build histograms (called hist, as in Matlab) '
          'that differs from the one in NumPy. The main difference is that pylab.hist plots the histogram automatically, while numpy.'
          'histogram only generates the data.',
    ],
    'image': "campus-2",
    'video': '',
    'pdf': '',
  }
];

final List<Map<String, dynamic>> Courses = [
  {
    'isLearning': false,
    'image': 'campus-1',
    'name': 'Biology Fundamentals',
    'info': 'This is a text that will be displayed',
    'instructors': ['Mbah Lesky', 'Jik Alvin'],
    'dataAdded': DateTime.now(),
    'duration': const Duration(days: 10, hours: 12, minutes: 30),
    'type': 'science',
    'modules': Modules,
  },
  {
    'isLearning': false,
    'image': 'campus-2',
    'name': 'Chemistry Fundamentals',
    'info':
        'This is a text that will be displayed, This is a text that will be displayed, This is a text that will be displayed, This is a text that will be displayed, This is a text that will be displayed',
    'instructors': ['Mbah Lesky'],
    'dataAdded': DateTime.now(),
    'duration': const Duration(days: 10, hours: 12, minutes: 30),
    'type': 'science',
    'modules': Modules,
  },
  {
    'isLearning': true,
    'image': 'classroom',
    'name': 'Maths Fundamentals',
    'info': 'This is a text that will be displayed',
    'instructors': ['Blessed Lionson', 'Mbah Lesky', 'Some Other'],
    'dataAdded': DateTime.now(),
    'duration': const Duration(days: 23, hours: 12),
    'type': 'arts',
    'modules': Modules,
  },
  {
    'isLearning': false,
    'image': 'campus-1',
    'name': 'Computer Fundamentals',
    'info': 'This is a text that will be displayed',
    'instructors': ['Mbah Lesky', 'Marco Marc'],
    'dataAdded': DateTime.now(),
    'duration': const Duration(days: 14, minutes: 30),
    'type': 'war',
    'modules': Modules,
  },
  {
    'isLearning': true,
    'image': 'classroom',
    'name': 'English Fundamentals',
    'info': 'This is a text that will be displayed',
    'instructors': ['Mbah Lesky', 'Olga Yoo'],
    'dataAdded': DateTime.now(),
    'duration': const Duration(days: 10, hours: 12, minutes: 30),
    'type': 'stories',
    'modules': Modules,
  },
  {
    'isLearning': false,
    'image': 'campus-2',
    'name': 'French Fundamentals',
    'info': 'This is a text that will be displayed',
    'instructors': [
      'Mbah Lesky',
      'Lionson King',
      'Some Other',
      'First Jedi',
      'Marco Marc',
      'Olga Yoo',
    ],
    'dataAdded': DateTime.now(),
    'duration': const Duration(days: 10, hours: 12, minutes: 30),
    'type': 'politics'
  },
  {
    'isLearning': false,
    'image': 'campus-1',
    'name': 'Other Couurse Fundamentals',
    'info': 'This is a text that will be displayed',
    'instructors': ['Mbah Lesky'],
    'dataAdded': DateTime.now(),
    'duration': const Duration(days: 10, hours: 12, minutes: 30),
    'type': 'literature',
    'modules': Modules,
  },
];

final all_images = ['campus-1', 'campus-2', 'classroom'];
