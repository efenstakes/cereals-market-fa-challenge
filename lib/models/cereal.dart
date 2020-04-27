

class Cereal {
  String id;
  String name;
  String grams;
  String description;
  String country;
  String size = 'Small';
  String image;
  

  Cereal({
    this.id,
    this.name,
    this.grams,
    this.description,
    this.country,
    this.size,
    this.image,
  });

}



List<Cereal> cerealList = [

  Cereal(
    id: '1',
    name: 'Pine Nut',
    country: 'Alaskan',
    description: 'Pine nut, also known as Castanea Mofillia is a heavy health food',
    size: 'Small',
    grams: '350',
    image: 'assets/images/ce2.jpg',
  ),
  
  Cereal(
    id: '2',
    name: 'Macau',
    country: 'American',
    description: 'Pine nut, also known as Castanea Mofillia is a heavy health food',
    size: 'Large',
    grams: '450',
    image: 'assets/images/ce3.jpg',
  ),
  
  Cereal(
    id: '3',
    name: 'Macau',
    country: 'Alaskan',
    description: 'Pine nut, also known as Castanea Mofillia is a heavy health food',
    size: 'Small',
    grams: '500',
    image: 'assets/images/ce1.jpg',
  ),
  
  Cereal(
    id: '4',
    name: 'Macadamia',
    country: 'Alaskan',
    description: 'Pine nut, also known as Castanea Mofillia is a heavy health food',
    size: 'Medium',
    grams: '350',
    image: 'assets/images/ce4.jpg',
  ),
  
  Cereal(
    id: '5',
    name: 'Ladash',
    country: 'Alaskan',
    description: 'Pine nut, also known as Castanea Mofillia is a heavy health food',
    size: 'Medium',
    grams: '750',
    image: 'assets/images/ce6.jpg',
  ),
  
  Cereal(
    id: '6',
    name: 'Cema',
    country: 'Ceman',
    description: 'Pine nut, also known as Castanea Mofillia is a heavy health food',
    size: 'Large',
    grams: '250',
    image: 'assets/images/ce5.png',
  ),

];