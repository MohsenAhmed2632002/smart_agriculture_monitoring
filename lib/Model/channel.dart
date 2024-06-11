// class Channel {
//   final int id;
//   final String name;
//   final String description;
//   final String latitude;
//   final String longitude;
//   final String field1;
//   final String field2;
//   final String field3;
//   final String field4;
//   final String createdAt;
//   final String updatedAt;
//   final int lastEntryId;
//   final List<Feed> feeds;

//   Channel({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.latitude,
//     required this.longitude,
//     required this.field1,
//     required this.field2,
//     required this.field3,
//     required this.field4,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.lastEntryId,
//     required this.feeds,
//   });

//   factory Channel.fromJson(Map<String, dynamic> json) {
//     List<dynamic> feedList = json['feeds'] as List<dynamic>;
//     List<Feed> parsedFeeds = feedList.map((e) => Feed.fromJson(e)).toList();

//     return Channel(
//       id: json['channel']['id'],
//       name: json['channel']['name'],
//       description: json['channel']['description'],
//       latitude: json['channel']['latitude'],
//       longitude: json['channel']['longitude'],
//       field1: json['channel']['field1'],
//       field2: json['channel']['field2'],
//       field3: json['channel']['field3'],
//       field4: json['channel']['field4'],
//       createdAt: json['channel']['created_at'],
//       updatedAt: json['channel']['updated_at'],
//       lastEntryId: json['channel']['last_entry_id'],
//       feeds: parsedFeeds,
//     );
//   }
// }

// class Feed {
//   final String createdAt;
//   final int entryId;
//   final String field1;
//   final String field2;
//   final String field3;
//   final String field4;

//   Feed({
//     required this.createdAt,
//     required this.entryId,
//     required this.field1,
//     required this.field2,
//     required this.field3,
//     required this.field4,
//   });

//   factory Feed.fromJson(Map<String, dynamic> json) {
//     return Feed(
//       createdAt: json['created_at'],
//       entryId: json['entry_id'],
//       field1: json['field1'],
//       field2: json['field2'],
//       field3: json['field3'],
//       field4: json['field4'],
//     );
//   }
// }