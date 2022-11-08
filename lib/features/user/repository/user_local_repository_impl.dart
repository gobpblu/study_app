import 'package:firebase_auth/firebase_auth.dart';

import 'user_local_repository.dart';

class UserLocalRepositoryImpl extends UserLocalRepository {
  late User user;

  @override
  User getUser() => user;

  @override
  void saveUser(User user) {
    print('Current USER: $user');
    this.user = user;
  }

/* void saveRatings({
    required int startIndex,
    required int endIndex,
    required String uid,
    required int rating,
    required String training,
    required List<WordWithPoints> words,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final ratings = jsonDecode(prefs.getString('ratings') ?? '') as Map<String, dynamic>;
    print(ratings);
    'words/ratings/$uid/$startIndex-$endIndex'
    if (ratings['words'] != null) {
      if (ratings['words']['ratings'] != null) {
        if (ratings['words']['ratings'][uid] != null) {
          if (ratings['words']['ratings'][uid]['$startIndex-$endIndex'] != null) {

          } else {
            ratings['words']['ratings'][uid]['$startIndex-$endIndex'] = {

            };
            ratings['words']['ratings'][uid]['$startIndex-$endIndex']
          }
        } else {
          ratings['words']['ratings'][uid] = {
            '$startIndex-$endIndex': {

            },
            'overall_rating': rating
          };
        }
      } else {
        ratings['words']['ratings'] = {
          uid: {
            '$startIndex-$endIndex': {

            }
          }
        };
      }
    } else {
      ratings['words'] = {
        'ratings': {
          uid: {
            '$startIndex-$endIndex': {

            }
          }
        }
      };
    }
    Map<String, dynamic> userRating;
    if (ratingObject == null) {
      userRating = {
        'common_rating': rating,
        training: rating,
      };
      int rightAnswers = 0;
      int wrongAnswers = 0;
      for (var word in words) {
        userRating['${word.id}'] = {'points': word.points};
        word.isRight ? rightAnswers++ : wrongAnswers++;
      }
      userRating['right_answers'] = rightAnswers;
      userRating['wrong_answers'] = wrongAnswers;
    } else {
      userRating = Map<String, dynamic>.from(ratingObject as Map);
      userRating['common_rating'] =
          (userRating['common_rating'] ?? 0) + rating;
      userRating[training] = (userRating[training] ?? 0) + rating;

      int rightAnswers = 0;
      int wrongAnswers = 0;
      for (var word in words) {
        if (userRating['${word.id}'] != null) {
          userRating['${word.id}']['points'] =
              (userRating['${word.id}']['points'] ?? 0) + word.points;
        } else {
          userRating['${word.id}'] = {'points': word.points};
        }
        word.isRight ? rightAnswers++ : wrongAnswers++;
      }
      userRating['right_answers'] =
          (userRating['right_answers'] ?? 0) + rightAnswers;
      userRating['wrong_answers'] =
          (userRating['wrong_answers'] ?? 0) + wrongAnswers;
    }
  }*/
}
