
class Category {
  final String name;
  final int numOfCourses;
  final String image;

  Category(this.name, this.numOfCourses, this.image);
}

List<Category> categories = categoriesData
    .map((item) => Category(item['name'], item['courses'], item['image']))
    .toList();

var categoriesData = [
  {"name": "C++ and data Structre ", 'courses': 17, 'image': "images/marketing.png"},
  {"name": "Linux and SHEll", 'courses': 25, 'image': "images/ux_design.png"},
  {
    "name": "UML & Merise",
    'courses': 13,
    'image': "images/ARS.jpg"
  },
  {"name": "Servers and Networking", 'courses': 17, 'image': "images/biologie.jpg"},
];
