import 'dart:collection';

import 'package:moviedb/core/models/movie.dart';

final dummyUpcomming = Movie(
    1,
    'title',
    7.8,
    'https://akcdn.detik.net.id/visual/2020/09/02/anoa.jpeg?w=650',
    'https://akcdn.detik.net.id/visual/2020/09/02/anoa.jpeg?w=650');

final dummyUpcommingList = <Movie>[
  dummyUpcomming,
  dummyUpcomming,
  dummyUpcomming,
];

final dummyUpcommingRes = LinkedHashSet.from(dummyUpcommingList);

final dummyUpcommingResApi = {
  "page": 1,
  "results": [
    {
      "poster_path": "/pEFRzXtLmxYNjGd0XqJDHPDFKB2.jpg",
      "adult": false,
      "overview": "A lighthouse keeper and his wife living off the coast of Western Australia raise a baby they rescue from an adrift rowboat.",
      "release_date": "2016-09-02",
      "genre_ids": [
        18
      ],
      "id": 283552,
      "original_title": "The Light Between Oceans",
      "original_language": "en",
      "title": "The Light Between Oceans",
      "backdrop_path": "/2Ah63TIvVmZM3hzUwR5hXFg2LEk.jpg",
      "popularity": 4.546151,
      "vote_count": 11,
      "video": false,
      "vote_average": 4.41
    },
    {
      "poster_path": "/udU6t5xPNDLlRTxhjXqgWFFYlvO.jpg",
      "adult": false,
      "overview": "Friends hatch a plot to retrieve a stolen cat by posing as drug dealers for a street gang.",
      "release_date": "2016-09-14",
      "genre_ids": [
        28,
        35
      ],
      "id": 342521,
      "original_title": "Keanu",
      "original_language": "en",
      "title": "Keanu",
      "backdrop_path": "/scM6zcBTXvUByKxQnyM11qWJbtX.jpg",
      "popularity": 3.51555,
      "vote_count": 97,
      "video": false,
      "vote_average": 6.04
    },
    {
      "poster_path": "/1BdD1kMK1phbANQHmddADzoeKgr.jpg",
      "adult": false,
      "overview": "On January 15, 2009, the world witnessed the \"Miracle on the Hudson\" when Captain \"Sully\" Sullenberger glided his disabled plane onto the frigid waters of the Hudson River, saving the lives of all 155 aboard. However, even as Sully was being heralded by the public and the media for his unprecedented feat of aviation skill, an investigation was unfolding that threatened to destroy his reputation and his career.",
      "release_date": "2016-09-08",
      "genre_ids": [
        36,
        18
      ],
      "id": 363676,
      "original_title": "Sully",
      "original_language": "en",
      "title": "Sully",
      "backdrop_path": "/nfj8iBvOjlb7ArbThO764HCQw5H.jpg",
      "popularity": 3.254896,
      "vote_count": 8,
      "video": false,
      "vote_average": 4.88
    },
  ],
  "dates": {
    "maximum": "2016-09-22",
    "minimum": "2016-09-01"
  },
  "total_pages": 12,
  "total_results": 222
};

// final dummyUpcommingResApi = [
//   {
//     "id": 1,
//     "title": "title",
//     "rating": 7.8,
//     "poster": "poster",
//     "backdrop": "backdrop",
//   },
//   {
//     "id": 2,
//     "title": "title",
//     "rating": 7.8,
//     "poster": "poster",
//     "backdrop": "backdrop",
//   },
//   {
//     "id": 3,
//     "title": "title",
//     "rating": 7.8,
//     "poster": "poster",
//     "backdrop": "backdrop",
//   },
// ];
