class Article {
  final String title;
  final String image;
  final String location;
  final String author;
  final int likes;
  final int comments;
  final int shares;
  final double rating;
  bool isLiked = false;

  Article(this.title, this.image, this.comments, this.likes, this.isLiked,
      this.location, this.shares, this.author, this.rating);
}

List<Article> articles = [
  Article(
    'Japan\'s second largest metropolitan area',
    'https://c4.wallpaperflare.com/wallpaper/490/528/841/landscape-mountains-sunlight-japan-wallpaper-preview.jpg',
    100,
    32000,
    true,
    'Osaka Japan',
    50,
    'Tobey Johnson',
    4,
  ),
  Article(
    'Known as the sleepless town for obvious reasons',
    'https://images.wallpaperscraft.com/image/single/night_lights_buildings_59511_1600x900.jpg',
    300,
    50000,
    true,
    'Kabuikicho Japan',
    1250,
    'Tim Salvatore',
    3.5,
  ),
  Article(
    'Japan\'s second largest metropolitan area',
    'https://c4.wallpaperflare.com/wallpaper/857/341/221/night-japan-city-street-wallpaper-preview.jpg',
    200,
    10000,
    true,
    'Tokyo Japan',
    1000,
    'Ely Marya',
    3,
  ),
];
