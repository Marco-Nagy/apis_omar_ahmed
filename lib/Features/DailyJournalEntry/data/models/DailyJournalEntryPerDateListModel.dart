class DailyJournalEntryPerDateModel {
  DailyJournalEntryPerDateModel({
    required this.dailyJournalEntryList,
    required this.errors,
    required this.paginationHeader,
    required this.result,
  });

  List<DailyJournalEntryList> dailyJournalEntryList;
  List errors;
  PaginationHeader paginationHeader;
  bool result;

  factory DailyJournalEntryPerDateModel.fromJson(Map<dynamic, dynamic> json) {
    return DailyJournalEntryPerDateModel(
      dailyJournalEntryList: (json['DailyJournalEntryList'] as List)
          .map((json) => DailyJournalEntryList.fromJson(json))
          .toList(),
      errors: json['Errors'] as List,
      paginationHeader: PaginationHeader.fromJson(json['PaginationHeader']),
      result: json['Result'],
    );
  }
}

class PaginationHeader {
  PaginationHeader({
    required this.currentPage,
    required this.itemsPerPage,
    required this.totalItems,
    required this.totalPages,
  });

  int currentPage;
  int itemsPerPage;
  int totalItems;
  int totalPages;

  factory PaginationHeader.fromJson(Map<dynamic, dynamic> json) {
    return PaginationHeader(
      currentPage: json['CurrentPage'] as int,
      itemsPerPage: json['ItemsPerPage'] as int,
      totalItems: json['TotalItems'] as int,
      totalPages: json['TotalPages'] as int,
    );
  }
}

class DailyJournalEntryList {
  DailyJournalEntryList({
    required this.active,
    required this.amountTranaction,
    required this.creationDate,
    required this.creationUser,
    required this.description,
    required this.documentNumber,
    required this.entryDate,
    required this.id,
    required this.serial,
    required this.status,
  });

  bool active;
  double amountTranaction;
  String creationDate;
  String creationUser;
  String description;
  String documentNumber;
  String entryDate;
  String id;
  String serial;
  bool status;

  factory DailyJournalEntryList.fromJson(Map<String, dynamic> json) {
    return DailyJournalEntryList(
      active: json['Active'],
      amountTranaction: json['AmountTranaction'],
      creationDate: json['CreationDate'].toString(),
      creationUser: json['CreationUser'].toString(),
      description: json['Description'].toString(),
      documentNumber: json['DocumentNumber'].toString(),
      entryDate: json['EntryDate'],
      id: json['ID'].toString(),
      serial: json['Serial'].toString(),
      status: json['Status'] as bool,
    );
  }
}
