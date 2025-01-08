
class PlacesSearch {
  final String description;
  final String placeID;

  PlacesSearch({required this.description, required this.placeID});

  factory PlacesSearch.fromJson(Map<String, dynamic> json) {
    return PlacesSearch(
      description: json['description'],
      placeID: json['place_id']
    );
  }

  @override
  String toString() {
    return 'PlacesSearch(description: $description, placeID: $placeID)';
  }


}
