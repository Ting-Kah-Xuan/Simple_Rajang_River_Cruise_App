class CruiseDestination {
  final String name;
  final String location;
  final String imageAsset;
  final String imageCaption;
  final String description;
  final int initialRating;
  final List<String> packages;

  const CruiseDestination({
    required this.name,
    required this.location,
    required this.imageAsset,
    required this.imageCaption,
    required this.description,
    required this.initialRating,
    required this.packages,
  });
  
  static const CruiseDestination rajangExpress = CruiseDestination(
    name: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    imageAsset: 'assets/images/rajang.jpg',
    imageCaption: 'Sibu Esplanade Landmark',
    description:
    "Experience the heart of Sibu along Malaysia's longest river, the Rajang. "
        'Cruise past historic temples, timber hubs, and traditional waterfront '
        'settlements while enjoying authentic Sarawakian hospitality.',
    initialRating: 43,
    packages: [
      'Private River Cruise',
      'Sunset Cruise',
      'Sunrise Cruise',
      'Rural Cruise',
      'SMI Park Cruise',
    ],
  );
}