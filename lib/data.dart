class Data {
  static var lsLesson = {
    "People": {
      "selected": true,
      "lsWord": [
        "one",
        "People",
        "I",
        "I and you",
        "both of us",
        "he",
        "he and she",
        "they both",
        "the man",
        "the woman",
        "the child",
        "a family",
        "my family",
        "My family is here.",
        "I am here.",
        "You are here.",
        "He is here and she is here.",
        "We are here.",
        "You are here.",
        "They are all here.",
      ],
    },
    "Family Members": {
      "selected": false,
      "lsWord": [
        "two",
        "Family Members",
        "the grandfather",
        "the grandmother",
        "he and she",
        "the father",
        "the mother",
        "he and she",
        "the son",
        "the daughter",
        "he and she",
        "the brother",
        "the sister",
        "he and she",
        "the uncle",
        "the aunt",
        "he and she",
        "We are a family.",
        "The family is not small.",
        "The family is big.",
      ],
    },
  };

  static List lsAsso = [];

  static void fillLsAsso() {
    lsLesson.forEach((key, value) {
      if (value["selected"] == true) {
        print(JSON.decode(value["lsWord"]));
        // for (String word in value["lsWord"]) {

        // }
      }
    });
  }

  // static List lsLesson = [
  //   "People",
  //   "Family Members",
  // ];

  // List lsWord = [
  //   "one",
  //   "People",
  //   "I",
  //   "I and you",
  //   "both of us",
  //   "he",
  //   "he and she",
  //   "they both",
  //   "the man",
  //   "the woman",
  //   "the child",
  //   "a family",
  //   "my family",
  //   "My family is here.",
  //   "I am here.",
  //   "You are here.",
  //   "He is here and she is here.",
  //   "We are here.",
  //   "You are here.",
  //   "They are all here.",

  //   "two",
  //   "Family Members",
  //   "the grandfather",
  //   "the grandmother",
  //   "he and she",
  //   "the father",
  //   "the mother",
  //   "he and she",
  //   "the son",
  //   "the daughter",
  //   "he and she",
  //   "the brother",
  //   "the sister",
  //   "he and she",
  //   "the uncle",
  //   "the aunt",
  //   "he and she",
  //   "We are a family.",
  //   "The family is not small.",
  //   "The family is big.",
  // ];
}