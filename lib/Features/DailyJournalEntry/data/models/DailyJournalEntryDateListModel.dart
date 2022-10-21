class DailyJournalEntryDateModel {
  List<DailyJournalEntryDateList> dailyJournalEntryList;
  List errors;
  bool result;

  DailyJournalEntryDateModel({
    required this.dailyJournalEntryList,
    required this.errors,
    required this.result,
  });

  factory DailyJournalEntryDateModel.fromJson(Map<dynamic, dynamic> json) {
    return DailyJournalEntryDateModel(
      dailyJournalEntryList: (json['DailyJournalEntryList'] as List)
          .map((json) => DailyJournalEntryDateList.fromJson(json))
          .toList(),
      errors: json['Errors'],
      result: json['Result'],
    );
  }
}

class DailyJournalEntryDateList {
  String countOfEntry;
  String dateMonth;
  String dateToGetList;

  DailyJournalEntryDateList({
    required this.countOfEntry,
    required this.dateMonth,
    required this.dateToGetList,
  });

  factory DailyJournalEntryDateList.fromJson(Map<dynamic, dynamic> json) {
    return DailyJournalEntryDateList(
      countOfEntry: json['CountOfEntry'].toString(),
      dateMonth: json['DateMonth'],
      dateToGetList: json['DateToGetList'],
    );
  }
}
