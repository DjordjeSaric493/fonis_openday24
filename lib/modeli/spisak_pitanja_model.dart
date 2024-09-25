//prvo bacim pogled na JSON-e sa pitanjima, ako se sećate onog Voyage kvizića od prošle godine
//jsoni su prvo bili sa tutorijala (kanal dbestech) i cgpt je uz moju pomoć napravio pitanja
//TODO:(PREŽOLINO) baci pogled na pitanja i vidi jel treba još nešto da se menja/ubacuje

//staviću nazive na engleskom, lakše mi je da pohvatam šta i kako ide

//ovo je generisano sa sajta jsontodart.com uz moje izmene
//kopiraš json, napišeš naziv modela koji hoćeš, daš da generiše, nalepiš kod, ispraviš i tjt
class SpisakPitanjaModel {
  String id;
  String title;
  String? imageUrl;
  String description;
  int timeSeconds;
  List<Questions>? questions; //može i ne mora da ima

  SpisakPitanjaModel(
      {required this.id,
      required this.title,
      this.imageUrl,
      required this.description,
      required this.timeSeconds,
      this.questions});

  SpisakPitanjaModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        title = json['title'] as String,
        imageUrl = json['image_url'] as String,
        description = json['description'] as String,
        timeSeconds = json['time_seconds'],
        questions = (json['questions'] as List)
            //dynamic-ekcplicitni tip promenljive e unutar map f-je
            //isključuj statičku proveru tj ne gledaj šta je e dok se ne izvrši kod

            .map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image_url'] = this.imageUrl;
    data['description'] = this.description;
    data['time_seconds'] = this.timeSeconds;

    return data;
  }
}

class Questions {
  String id;
  String question;
  List<Answers> answers;
  String? correctAnswer;

  //  'required' za obavezne parametre
  Questions({
    required this.id,
    required this.question,
    required this.answers,
    this.correctAnswer,
  });

  // inicijalizacijski list
  Questions.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        question = json['question'],
        /*if (json['answers'] != null) {
      answers = new List<Answers>();
      json['answers'].forEach((v) {
        answers.add(new Answers.fromJson(v));
      });
    } izgenerisano parče koda koje ne želim*/
        answers = (json['answers'] as List) // extract listu odgovora iz JSON-a
            .map((e) => Answers.fromJson(
                e)) // mapiraj svaki element na instancu Answers
            .toList(),
        correctAnswer =
            json['correct_answer']; // dodeljuje vrednost 'correct_answer'

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['question'] = this.question;
    data['answers'] = this
        .answers
        .map((v) => v.toJson())
        .toList(); // Konvertuj listu Answers u JSON
    data['correct_answer'] =
        this.correctAnswer; // Dodeli vrednost za 'correct_answer'
    return data;
  }
}

class Answers {
  String? identifier; // Opcionalni identifikator odgovora.
  String? answer; // Opcionalni tekst odgovora.

  // Konstruktor za inicijalizaciju promenljivih.
  Answers({this.identifier, this.answer});

  // Named konstruktor za kreiranje instance iz JSON objekta.
  Answers.fromJson(Map<String, dynamic> json)
      : identifier =
            json['identifier'] as String?, // Ekstrahuj 'identifier' iz JSON-a.
        answer = json['answer'] as String?; // Ekstrahuj 'answer' iz JSON-a.

  // Metoda za konverziju instance u JSON format.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =
        <String, dynamic>{}; // Inicijalizacija prazne mape.
    data['identifier'] = identifier; // Dodeljuje vrednost za 'identifier'.
    data['answer'] = answer; // Dodeljuje vrednost za 'answer'.
    return data; // Vraća mapu.
  }
}
