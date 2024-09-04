import 'package:movie_app/core/models/movie.dart';
import 'package:movie_app/core/network/dio_network.dart';
import 'package:movie_app/core/network/end_points.dart';

class MovieViewModel {
  static Future<List<Movie>> getSimilarMovies(int movieId) async {
    // await Future.delayed(const Duration(seconds: 2));
    DioApiService dioApiService = DioApiService();
    var response = await dioApiService.getRequest(EndPoints.similar(movieId));
    List<Movie> movies = [];
    if (response.statusCode == 200) {
      final data = response.data;
      data['results'].forEach((movie) {
        movies.add(Movie.fromJson(movie));
      });
    }

    return movies;
  }

  static Future<Movie> getMovieInfo(int movieId) async {
    // await Future.delayed(const Duration(seconds: 2));
    DioApiService dioApiService = DioApiService();
    var response =
        await dioApiService.getRequest(EndPoints.movieDetails(movieId));

    Movie movie;
    if (response.statusCode == 200) {
      final data = response.data;
      movie = Movie.fullDetailsFromJson(data);
      print(movie.homePageUrl);
      print(data);
      return movie;
    } else {
      throw Exception('Failed to load movie');
    }
  }
}
/*
{
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/1pjOrzAqlQPifZkRi5h1zlO1VJ2.jpg",
      "genre_ids": [
        18,
        35,
        10749,
        10402
      ],
      "id": 243,
      "original_language": "en",
      "original_title": "High Fidelity",
      "overview": "When record store owner and compulsive list-compiler Rob Gordon gets dumped by his long-time girlfriend, Laura, because he hasn't changed since they met, he revisits his top five breakups of all time in order to figure out what went wrong. As he examines his failed attempts at romance and happiness, the process finds him being dragged, kicking and screaming, into adulthood.",
      "popularity": 21.119,
      "poster_path": "/e2LZGB62GMhv3Fo8tDZjY87I81a.jpg",
      "release_date": "2000-03-17",
      "title": "High Fidelity",
      "video": false,
      "vote_average": 7.127,
      "vote_count": 1938
    },
    {
      "adult": false,
      "backdrop_path": "/tIG8FwHRiHLOlWJdizp2oxdkSL2.jpg",
      "genre_ids": [
        14,
        28,
        27
      ],
      "id": 561,
      "original_language": "en",
      "original_title": "Constantine",
      "overview": "John Constantine has literally been to Hell and back. When he teams up with a policewoman to solve the mysterious suicide of her twin sister, their investigation takes them through the world of demons and angels that exists beneath the landscape of contemporary Los Angeles.",
      "popularity": 78.861,
      "poster_path": "/vPYgvd2MwHlxTamAOjwVQp4qs1W.jpg",
      "release_date": "2005-02-08",
      "title": "Constantine",
      "video": false,
      "vote_average": 7.091,
      "vote_count": 7040
    },
    {
      "adult": false,
      "backdrop_path": "/pxK1iK6anS6erGg4QePmMKbB1E7.jpg",
      "genre_ids": [
        12,
        28,
        53,
        878
      ],
      "id": 604,
      "original_language": "en",
      "original_title": "The Matrix Reloaded",
      "overview": "Six months after the events depicted in The Matrix, Neo has proved to be a good omen for the free humans, as more and more humans are being freed from the matrix and brought to Zion, the one and only stronghold of the Resistance.  Neo himself has discovered his superpowers including super speed, ability to see the codes of the things inside the matrix and a certain degree of pre-cognition. But a nasty piece of news hits the human resistance: 250,000 machine sentinels are digging to Zion and would reach them in 72 hours. As Zion prepares for the ultimate war, Neo, Morpheus and Trinity are advised by the Oracle to find the Keymaker who would help them reach the Source.  Meanwhile Neo's recurrent dreams depicting Trinity's death have got him worried and as if it was not enough, Agent Smith has somehow escaped deletion, has become more powerful than before and has fixed Neo as his next target.",
      "popularity": 52.908,
      "poster_path": "/9TGHDvWrqKBzwDxDodHYXEmOE6J.jpg",
      "release_date": "2003-05-15",
      "title": "The Matrix Reloaded",
      "video": false,
      "vote_average": 7.053,
      "vote_count": 10788
    },
    {
      "adult": false,
      "backdrop_path": "/533xAMhhVyjTy8hwMUFEt5TuDfR.jpg",
      "genre_ids": [
        12,
        28,
        53,
        878
      ],
      "id": 605,
      "original_language": "en",
      "original_title": "The Matrix Revolutions",
      "overview": "The human city of Zion defends itself against the massive invasion of the machines as Neo fights to end the war at another front while also opposing the rogue Agent Smith.",
      "popularity": 44.686,
      "poster_path": "/t1wm4PgOQ8e4z1C6tk1yDNrps4T.jpg",
      "release_date": "2003-11-05",
      "title": "The Matrix Revolutions",
      "video": false,
      "vote_average": 6.727,
      "vote_count": 9727
    },
    {
      "adult": false,
      "backdrop_path": "/1GJvBE7UWU1WOVi0XREl4JQc7f8.jpg",
      "genre_ids": [
        28,
        12,
        35,
        878
      ],
      "id": 607,
      "original_language": "en",
      "original_title": "Men in Black",
      "overview": "After a police chase with an otherworldly being, a New York City cop is recruited as an agent in a top-secret organization established to monitor and police alien activity on Earth: the Men in Black. Agent K and new recruit Agent J find themselves in the middle of a deadly plot by an intergalactic terrorist who has arrived on Earth to assassinate two ambassadors from opposing galaxies.",
      "popularity": 42.162,
      "poster_path": "/uLOmOF5IzWoyrgIF5MfUnh5pa1X.jpg",
      "release_date": "1997-07-02",
      "title": "Men in Black",
      "video": false,
      "vote_average": 7.199,
      "vote_count": 13558
    },
    {
      "adult": false,
      "backdrop_path": "/o1l6OCqA3pYDZHIc5L1s7CEzCMv.jpg",
      "genre_ids": [
        28,
        35,
        878
      ],
      "id": 608,
      "original_language": "en",
      "original_title": "Men in Black II",
      "overview": "Kay and Jay reunite to provide our best, last and only line of defense against a sinister seductress who levels the toughest challenge yet to the MIB's untarnished mission statement – protecting Earth from the scum of the universe. It's been four years since the alien-seeking agents averted an intergalactic disaster of epic proportions. Now it's a race against the clock as Jay must convince Kay – who not only has absolutely no memory of his time spent with the MIB, but is also the only living person left with the expertise to save the galaxy – to reunite with the MIB before the earth submits to ultimate destruction.",
      "popularity": 35.806,
      "poster_path": "/enA22EPyzc2WQ1VVyY7zxresQQr.jpg",
      "release_date": "2002-07-03",
      "title": "Men in Black II",
      "video": false,
      "vote_average": 6.369,
      "vote_count": 9762
    },
    {
      "adult": false,
      "backdrop_path": "/kdbLf3aTQsEXqYlH9vA4fzmnSFz.jpg",
      "genre_ids": [
        10752,
        18,
        28
      ],
      "id": 228150,
      "original_language": "en",
      "original_title": "Fury",
      "overview": "In the last months of World War II, as the Allies make their final push in the European theatre, a battle-hardened U.S. Army sergeant named 'Wardaddy' commands a Sherman tank called 'Fury' and its five-man crew on a deadly mission behind enemy lines. Outnumbered and outgunned, Wardaddy and his men face overwhelming odds in their heroic attempts to strike at the heart of Nazi Germany.",
      "popularity": 89.439,
      "poster_path": "/pfte7wdMobMF4CVHuOxyu6oqeeA.jpg",
      "release_date": "2014-10-15",
      "title": "Fury",
      "video": false,
      "vote_average": 7.533,
      "vote_count": 11740
    },
    {
      "adult": false,
      "backdrop_path": "/grqttbfM2KNiefTGPrJ4v9AcFZh.jpg",
      "genre_ids": [
        12,
        28
      ],
      "id": 228298,
      "original_language": "en",
      "original_title": "The Secret Code",
      "overview": "A superhero known as The Black Commando battles Nazi agents who use explosive gases and artificial lightning to sabotage the war effort.",
      "popularity": 4.961,
      "poster_path": "/5Sqc1PFR5Fvit9Cvhv5DceF0xsm.jpg",
      "release_date": "1942-09-04",
      "title": "The Secret Code",
      "video": false,
      "vote_average": 4.8,
      "vote_count": 3
    },
    {
      "adult": false,
      "backdrop_path": "/jxPNxqiwTRatJxXW5fardVKPBWj.jpg",
      "genre_ids": [
        878,
        28,
        12,
        18
      ],
      "id": 549956,
      "original_language": "fr",
      "original_title": "L'Incroyable Hulk : L'Homme Mystère",
      "overview": "",
      "popularity": 3.804,
      "poster_path": "/h4xV2oFYsskehfLEzaNKyHA2GmL.jpg",
      "release_date": "2009-01-15",
      "title": "L'Incroyable Hulk : L'Homme Mystère",
      "video": true,
      "vote_average": 3.5,
      "vote_count": 2
    },
    {
      "adult": false,
      "backdrop_path": "/2PDTWfuBWQKVC7aPAqJK5UCpz08.jpg",
      "genre_ids": [
        28,
        878
      ],
      "id": 557,
      "original_language": "en",
      "original_title": "Spider-Man",
      "overview": "After being bitten by a genetically altered spider at Oscorp, nerdy but endearing high school student Peter Parker is endowed with amazing powers to become the superhero known as Spider-Man.",
      "popularity": 95.345,
      "poster_path": "/gh4cZbhZxyTbgxQPxD0dOudNPTn.jpg",
      "release_date": "2002-05-01",
      "title": "Spider-Man",
      "video": false,
      "vote_average": 7.299,
      "vote_count": 18790
    },
    {
      "adult": false,
      "backdrop_path": "/8G6HCS82vNxgg5wp7oBDSk32XpF.jpg",
      "genre_ids": [
        28,
        12,
        878
      ],
      "id": 558,
      "original_language": "en",
      "original_title": "Spider-Man 2",
      "overview": "Peter Parker is going through a major identity crisis. Burned out from being Spider-Man, he decides to shelve his superhero alter ego, which leaves the city suffering in the wake of carnage left by the evil Doc Ock. In the meantime, Parker still can't act on his feelings for Mary Jane Watson, a girl he's loved since childhood. A certain anger begins to brew in his best friend Harry Osborn as well...",
      "popularity": 34.05,
      "poster_path": "/olxpyq9kJAZ2NU1siLshhhXEPR7.jpg",
      "release_date": "2004-06-25",
      "title": "Spider-Man 2",
      "video": false,
      "vote_average": 7.284,
      "vote_count": 14908
    },
    {
      "adult": false,
      "backdrop_path": "/w1oD1MzHjnBJc5snKupIQaSBLIh.jpg",
      "genre_ids": [
        28,
        12,
        878
      ],
      "id": 559,
      "original_language": "en",
      "original_title": "Spider-Man 3",
      "overview": "The seemingly invincible Spider-Man goes up against an all-new crop of villains—including the shape-shifting Sandman. While Spider-Man’s superpowers are altered by an alien organism, his alter ego, Peter Parker, deals with nemesis Eddie Brock and also gets caught up in a love triangle.",
      "popularity": 80.343,
      "poster_path": "/qFmwhVUoUSXjkKRmca5yGDEXBIj.jpg",
      "release_date": "2007-05-01",
      "title": "Spider-Man 3",
      "video": false,
      "vote_average": 6.429,
      "vote_count": 13903
    },
    {
      "adult": false,
      "backdrop_path": "/zlpZzccypkAYFZIyYLQcchl90ZC.jpg",
      "genre_ids": [
        878,
        28,
        80,
        10770
      ],
      "id": 225914,
      "original_language": "en",
      "original_title": "Spider-Man",
      "overview": "When an extortionist threatens to force a multi-suicide unless a huge ransom is paid, only Peter Parker can stop him with his new powers as Spider-Man.",
      "popularity": 21.319,
      "poster_path": "/jNxRHZ2cxVkNRtxgHuCtv7GY4JP.jpg",
      "release_date": "1977-09-14",
      "title": "Spider-Man",
      "video": false,
      "vote_average": 6.16,
      "vote_count": 178
    },
    {
      "adult": false,
      "backdrop_path": "/inQQLXDOkb3jwDqNqHF8Lnel6yU.jpg",
      "genre_ids": [
        878,
        12,
        27
      ],
      "id": 831,
      "original_language": "en",
      "original_title": "This Island Earth",
      "overview": "Aliens have landed and are hiding on Earth, but need Earth’s scientists to help them fight an inter-planetary war.",
      "popularity": 9.22,
      "poster_path": "/2viRDpHmhzQoreZok2auLjkVbSE.jpg",
      "release_date": "1955-06-01",
      "title": "This Island Earth",
      "video": false,
      "vote_average": 6,
      "vote_count": 212
    },
    {
      "adult": false,
      "backdrop_path": "/fe6HNvn81wFQR4DvVQgU4lxnraU.jpg",
      "genre_ids": [
        28,
        12,
        14
      ],
      "id": 847,
      "original_language": "en",
      "original_title": "Willow",
      "overview": "The evil Queen Bavmorda hunts the newborn princess Elora Danan, a child prophesied to bring about her downfall. When the royal infant is found by Willow, a timid farmer and aspiring sorcerer, he's entrusted with delivering her from evil.",
      "popularity": 28.816,
      "poster_path": "/d9xEILdvVRX8ZgFwPDbco6kKSaS.jpg",
      "release_date": "1988-05-20",
      "title": "Willow",
      "video": false,
      "vote_average": 7.019,
      "vote_count": 1883
    },
    {
      "adult": false,
      "backdrop_path": "/80uHK2xWwjlOxmfJ1wQB09omAht.jpg",
      "genre_ids": [
        10749,
        35,
        80,
        14
      ],
      "id": 854,
      "original_language": "en",
      "original_title": "The Mask",
      "overview": "When timid bank clerk Stanley Ipkiss discovers a magical mask containing the spirit of the Norse god Loki, his entire life changes. While wearing the mask, Ipkiss becomes a supernatural playboy exuding charm and confidence which allows him to catch the eye of local nightclub singer Tina Carlyle. Unfortunately, under the mask's influence, Ipkiss also robs a bank, which angers junior crime lord Dorian Tyrell, whose goons get blamed for the heist.",
      "popularity": 58.491,
      "poster_path": "/xbbXp9px4o8Oe7IbGd0yIbla8mZ.jpg",
      "release_date": "1994-07-29",
      "title": "The Mask",
      "video": false,
      "vote_average": 6.957,
      "vote_count": 10072
    },
    {
      "adult": false,
      "backdrop_path": "/x2wOlXuK4NzPDQ0OBZiJjNNOp6Y.jpg",
      "genre_ids": [
        28,
        12,
        878
      ],
      "id": 861,
      "original_language": "en",
      "original_title": "Total Recall",
      "overview": "Construction worker Douglas Quaid's obsession with the planet Mars leads him to visit Recall, a company who manufacture memories. Something goes wrong during his memory implant turning Doug's life upside down and even to question what is reality and what isn't.",
      "popularity": 46.306,
      "poster_path": "/wVbeL6fkbTKSmNfalj4VoAUUqJv.jpg",
      "release_date": "1990-06-01",
      "title": "Total Recall",
      "video": false,
      "vote_average": 7.301,
      "vote_count": 5661
    },
    {
      "adult": false,
      "backdrop_path": "/7py8kUCYaOdFn1TfVS87BDBySOz.jpg",
      "genre_ids": [
        35,
        12,
        878
      ],
      "id": 550988,
      "original_language": "en",
      "original_title": "Free Guy",
      "overview": "A bank teller discovers he is actually a background player in an open-world video game, and decides to become the hero of his own story. Now, in a world where there are no limits, he is determined to be the guy who saves his world his way before it's too late.",
      "popularity": 68.385,
      "poster_path": "/xmbU4JTUm8rsdtn7Y3Fcm30GpeT.jpg",
      "release_date": "2021-08-11",
      "title": "Free Guy",
      "video": false,
      "vote_average": 7.501,
      "vote_count": 8561
    },
    {
      "adult": false,
      "backdrop_path": "/z7VhtN4xkedXaQPGUevRMK7wo9M.jpg",
      "genre_ids": [
        35,
        37,
        18
      ],
      "id": 8388,
      "original_language": "en",
      "original_title": "¡Three Amigos!",
      "overview": "A trio of unemployed silent film actors are mistaken for real heroes by a small Mexican village in search of someone to stop a malevolent bandit.",
      "popularity": 22.803,
      "poster_path": "/gw8A3GW7BPPdkt71KkjiHXZBKl8.jpg",
      "release_date": "1986-12-12",
      "title": "¡Three Amigos!",
      "video": false,
      "vote_average": 6.297,
      "vote_count": 951
    },
    {
      "adult": false,
      "backdrop_path": "/a8UAXIEf83pyvP0dBhnUIzvEYmE.jpg",
      "genre_ids": [
        878,
        28,
        12
      ],
      "id": 8536,
      "original_language": "en",
      "original_title": "Superman II",
      "overview": "Three escaped criminals from the planet Krypton test the Man of Steel's mettle. Led by General Zod, the Kryptonians take control of the White House and partner with Lex Luthor to destroy Superman and rule the world. But Superman, who attempts to make himself human in order to get closer to Lois, realizes he has a responsibility to save the planet.",
      "popularity": 27.114,
      "poster_path": "/3xk5cno9BHcnwc97XO9k21aI1Zi.jpg",
      "release_date": "1980-12-12",
      "title": "Superman II",
      "video": false,
      "vote_average": 6.7,
      "vote_count": 2205
    }
  ],
  "total_pages": 9559,
  "total_results": 191180
}
*/