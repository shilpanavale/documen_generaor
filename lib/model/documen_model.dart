class DocumentModel{
  dynamic applicationNo ;
  dynamic  outwardNo ;
  dynamic outwardDate;
  dynamic applicationName ;
  dynamic applicationAddress ;
  dynamic   opponents;
      dynamic hearingDate,hearingTime ,area ,cts ,propertyAddress ,publicDate ,publicNoticeTime ;
  DocumentModel({
     this.applicationNo,
     this.outwardNo,
     this.outwardDate,
     this.applicationName,
     this.applicationAddress,
    required this.opponents,
    this.hearingDate,
    this.hearingTime,
    this.area,
    this.cts,
    this.propertyAddress,
    this.publicDate,
    this.publicNoticeTime

  });
  Map<String, dynamic> mapDocument() {
    return {
      'applicationNo': applicationNo,
      'outwardNo': outwardNo,
      'outwardDate': outwardDate,
      'applicationName':applicationName,
      'applicationAddress':applicationAddress,
      'opponents':opponents,
     // 'opponentAddress':opponentAddress,
      'hearingDate':hearingDate,
      'hearingTime':hearingTime,
      'area':area,
      'cts':cts,
      'propertyAddress':propertyAddress,
      'publicDate':publicDate,
      'publicNoticeTime':publicNoticeTime
    };
  }
}