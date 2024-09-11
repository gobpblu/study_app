import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:study_app/core/res/db_paths.dart';
import 'package:study_app/features/auth/domain/repository/user_local_repository.dart';

import '../../ratings/models/user_rating.dart';
import '../../words/models/word.dart';
import '../../words/models/word_with_points.dart';

class RealtimeDatabaseService {
  FirebaseDatabase db = FirebaseDatabase.instance;
  final UserLocalRepository _userRepository;

  RealtimeDatabaseService({
    required UserLocalRepository userRepository,
  }) : _userRepository = userRepository;

  Future<List<Word>> loadWords(int startId, int endId) async {
    final ref = db.ref('words/1-20/words');
    final snap = await ref.get();
    snap.children.forEach((element) {
      print(element.value);
    });
    print('I work: ${ref.path}');
    final snapshot = ref.child('1');
    // snapshot.children.forEach((element) {
    //   print(element);
    // });
    print(snapshot);
    final value = await snapshot.get();
    print(value.value);
    return [];
  }

  Future<bool> uploadRatingsFromLocal2({required Map<dynamic, dynamic> map}) async {
    final uid = _userRepository.getUser().uniqueId;

    DatabaseReference ref = db.ref("words/ratings/topics/$uid");
    TransactionResult result = await ref.runTransaction((Object? ratingObject) {
      Map<dynamic, dynamic> updateMap = {};
      if (ratingObject == null) {
        updateMap = map;
      } else {
        print(ratingObject);
      }

      return Transaction.success(updateMap);
    });
    return result.committed;
  }

  Future<bool> uploadRatingsFromLocal({required Map<dynamic, dynamic> map}) async {
    final uid = _userRepository.getUser().uniqueId;

    DatabaseReference ref = db.ref("words/ratings/topics/$uid");
    TransactionResult result = await ref.runTransaction((Object? ratingObject) {
      Map<dynamic, dynamic> updateMap = {};
      print('THE METHOD IS WORKING');
      if (ratingObject == null) {
        updateMap = map;
      } else {
        print('I don\'t work');
        updateMap = Map<dynamic, dynamic>.from(ratingObject as Map);
        print(updateMap);
        for (var entry in map.entries) {
          if (entry.key == 'overall_rating') {
            updateMap.update(entry.key, (value) => value + entry.value, ifAbsent: () => entry.value);
          } else if (updateMap[entry.key] == null) {
            print('I work == null: ${updateMap.entries}');
            updateMap.putIfAbsent(entry.key, () => entry.value);
          } else {
            final topicWords = entry.value as Map<dynamic, dynamic>;
            for (var topicEntry in topicWords.entries) {
              if (updateMap[entry.key][topicEntry.key] == null) {
                print('I work: updateMapEntryKey:${updateMap[entry.key]}'
                    '\nupdateMapEntryKeyTopicEntryKey:${updateMap[entry.key][topicEntry.key]}');
                (updateMap[entry.key] as Map).putIfAbsent(topicEntry.key, () => topicEntry.value);
              } else if (topicEntry.value is int) {
                print('I work is int');
                (updateMap[entry.key] as Map).update(
                  topicEntry.key,
                  (value) => value + topicEntry.value,
                  ifAbsent: () => topicEntry.value,
                );
              } else if (topicEntry.value is Map) {
                print('I work is map: ${topicEntry.value}');
                final words = topicEntry.value as Map<String, dynamic>;
                for (var word in words.entries) {
                  print('word: $word');
                  (updateMap[entry.key][topicEntry.key] as Map)
                      .update(word.key, (value) => value + word.value, ifAbsent: () => word.value);
                }
              }
            }
          }
        }
      }
      print('updateMap Here: $updateMap');

      return Transaction.success(updateMap);
    });

    debugPrint('User rating with id $uid is committed: ${result.committed}\n'
        '\nSnapshot value is:${result.snapshot.value}');
    return result.committed;
  }

  Future writeRating({
    required int startIndex,
    required int endIndex,
    required String uid,
    required int rating,
    required String training,
    required List<WordWithPoints> words,
  }) async {
    final userUrl = 'words/ratings/$uid/$startIndex-$endIndex';
    final userRatingRef = db.ref(userUrl);
    print('$userRatingRef');
    TransactionResult result = await userRatingRef.runTransaction((Object? ratingObject) {
      print('ratingObject: $ratingObject');
      Map<String, dynamic> userRating;
      if (ratingObject == null) {
        userRating = {
          'common_rating': rating,
          training: rating,
        };
        int rightAnswers = 0;
        int wrongAnswers = 0;
        for (var word in words) {
          userRating[word.word] = {'points': word.points};
          word.isRight ? rightAnswers++ : wrongAnswers++;
        }
        userRating['right_answers'] = rightAnswers;
        userRating['wrong_answers'] = wrongAnswers;
      } else {
        userRating = Map<String, dynamic>.from(ratingObject as Map);
        userRating['common_rating'] = (userRating['common_rating'] ?? 0) + rating;
        userRating[training] = (userRating[training] ?? 0) + rating;

        int rightAnswers = 0;
        int wrongAnswers = 0;
        for (var word in words) {
          if (userRating[word.word] != null) {
            userRating[word.word]['points'] = (userRating[word.word]['points'] ?? 0) + word.points;
            userRating[word.word]['correct_answers'] =
                (userRating[word.word]?['correct_answers'] ?? 0) + (word.isRight ? 1 : 0);
            userRating[word.word]['wrong_answers'] =
                (userRating[word.word]?['wrong_answers'] ?? 0) + (word.isRight ? 0 : 1);
          } else {
            userRating[word.word] = {
              'points': word.points,
              'correct_answers': word.isRight ? 1 : 0,
              'wrong_answers': word.isRight ? 0 : 1,
            };
          }
          word.isRight ? rightAnswers++ : wrongAnswers++;
        }
        userRating['right_answers'] = (userRating['right_answers'] ?? 0) + rightAnswers;
        userRating['wrong_answers'] = (userRating['wrong_answers'] ?? 0) + wrongAnswers;
      }
      print('userRating: $userRating');
      return Transaction.success(userRating);
    });

    debugPrint('User rating with id $uid is committed: ${result.committed}\n'
        '\nSnapshot value is:${result.snapshot.value}');
  }

  Future writeOverallRating(String uid, int rating) async {
    final overallWordsRatingRef = db.ref('words/ratings/$uid');
    TransactionResult result = await overallWordsRatingRef.runTransaction((Object? ratingsObject) {
      Map<String, dynamic> userRatings;
      if (ratingsObject == null) {
        userRatings = {overallRating: rating};
      } else {
        userRatings = Map<String, dynamic>.from(ratingsObject as Map);
        userRatings[overallRating] = (userRatings[overallRating] ?? 0) + rating;
      }
      return Transaction.success(userRatings);
    });
    debugPrint('User overall rating with id $uid is committed: ${result.committed}\n'
        '\nSnapshot value is:${result.snapshot.value}');
  }

  Future writeAchievements(
    String uid,
    int currentGuessedWordsSeries,
  ) async {
    final userAchievementsUrl = 'achievements/$uid/words';
    final userAchievementsRef = db.ref(userAchievementsUrl);

    TransactionResult achievementsResult = await userAchievementsRef.runTransaction((Object? currentUserAchievements) {
      Map<String, dynamic> userAchievements;
      if (currentUserAchievements == null) {
        userAchievements = {
          currentWordsSeries: currentGuessedWordsSeries,
          bestWordsSeries: currentGuessedWordsSeries,
        };
      } else {
        userAchievements = Map<String, dynamic>.from(currentUserAchievements as Map);
        userAchievements[currentWordsSeries] = currentGuessedWordsSeries;
        userAchievements[bestWordsSeries] = (userAchievements[bestWordsSeries] ?? 0) > currentGuessedWordsSeries
            ? (userAchievements[bestWordsSeries] ?? 0)
            : currentGuessedWordsSeries;
      }
      return Transaction.success(userAchievements);
    });
  }

  Future<bool> saveUsernameByUid(String username, String uid) async {
    final userUrl = 'users/$uid';
    final userRef = db.ref(userUrl);
    TransactionResult result = await userRef.runTransaction((Object? currentUser) {
      Map<String, dynamic> userMap;
      if (currentUser == null) {
        userMap = {'username': username};
      } else {
        userMap = Map<String, dynamic>.from(currentUser as Map);
        userMap['username'] = userMap['username'] ?? username;
      }
      return Transaction.success(userMap);
    });
    debugPrint('User with id $uid is committed: ${result.committed}\n'
        '\nSnapshot value is:${result.snapshot.value}');
    return result.committed;
  }

  Future<List<UserRating>> loadAllTrainingsRatings(String topic) async {
    const topicsUrl = 'words/ratings/topics';
    final topicsRef = db.ref(topicsUrl);
    final snapshot = await topicsRef.get();
    final userRatings = <UserRating>[];
    for (var user in snapshot.children) {
      final username = await getUsername(user.key as String);
      final points = (user.value as Map)[topic]?['common_rating'] ?? 0;
      userRatings.add(UserRating(username: username, points: points));
    }
    return userRatings;
  }

  Future<String> getUsername(String uid) async {
    final userUrl = 'users/$uid';
    final userRef = db.ref(userUrl);
    final snapshot = await userRef.get();
    return (snapshot.value as Map)['username'];
  }

  Future<int> getTopicRating(String topic) async {
    final uid = _userRepository.getUser().uniqueId;
    final ratingUrl = 'words/ratings/topics/$uid/$topic/';
    final ratingRef = db.ref(ratingUrl);
    final snapshot = await ratingRef.get();
    return snapshot.value is Map ? (snapshot.value as Map)['common_rating'] : 0;
  }
}
