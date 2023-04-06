import 'package:max_way/data/models/category/category_model.dart';
import 'package:max_way/data/models/product/product_model.dart';
import 'package:max_way/utils/images.dart';

final List<MaxWayCategory> maxWayCategories = [
  MaxWayCategory(
    name: "Pitsa",
    products: [
      MaxWayProduct(
        name: "Gavaya",
        description:
        "Горячая закуска с митболами из говядины, томатами, моцареллой и соусом чипотле",
        price: 45000,
        image: AppImages.gavayaPitsa,
      ),
      MaxWayProduct(
        name: "Mexica",
        description:
        "Горячая закуска с митболами из говядины, томатами, моцареллой и соусом чипотле",
        price: 64000,
        image: AppImages.mexicoPitsa,
      ),
      MaxWayProduct(
        name: "Hot achchiko",
        description:
        "Горячая закуска с митболами из говядины, томатами, моцареллой и соусом чипотле",
        price: 53000,
        image: AppImages.hotAchchikoPitsa,
      ),
    ],
  ),
  MaxWayCategory(
    name: "Burger",
    products: [
      MaxWayProduct(
        name: "Cheeseburger",
        description:
        "Горячая закуска с митболами из говядины, томатами, моцареллой и соусом чипотле",
        price: 23000,
        image: AppImages.cheeseburger,
      ),
      MaxWayProduct(
        name: "ChiliBurger",
        description:
        "Горячая закуска с митболами из говядины, томатами, моцареллой и соусом чипотле",
        price: 23000,
        image: AppImages.cheeseburger,
      ),
      MaxWayProduct(
        name: "Hamburger",
        description:
        "Горячая закуска с митболами из говядины, томатами, моцареллой и соусом чипотле",
        price: 23000,
        image: AppImages.cheeseburger,
      ),
    ],
  ),
  MaxWayCategory(
    name: "Kombo",
    products: [
      MaxWayProduct(
        name: "Kombo-1",
        description:
        "Горячая закуска с митболами из говядины, томатами, моцареллой и соусом чипотле",
        price: 23000,
        image: AppImages.firstKombo,
      ),
      MaxWayProduct(
        name: "Kombo-2",
        description:
        "Горячая закуска с митболами из говядины, томатами, моцареллой и соусом чипотле",
        price: 25000,
        image: AppImages.secondKombo,
      ),
      MaxWayProduct(
        name: "Kombo-1",
        description:
        "Горячая закуска с митболами из говядины, томатами, моцареллой и соусом чипотле",
        price: 30000,
        image: AppImages.firstKombo,
      ),
    ],
  ),
  MaxWayCategory(
    name: "Ichimliklar",
    products: [
      MaxWayProduct(
        name: "Sprite 1L",
        description:
        "Горячая закуска с митболами из говядины, томатами, моцареллой и соусом чипотле",
        price: 6000,
        image: AppImages.sprite,
      ),
      MaxWayProduct(
        name: "Coca Cola 1,5L",
        description:
        "Горячая закуска с митболами из говядины, томатами, моцареллой и соусом чипотле",
        price: 9000,
        image: AppImages.cocaCola,
      ),
      MaxWayProduct(
        name: "Fanta 1L",
        description:
        "Горячая закуска с митболами из говядины, томатами, моцареллой и соусом чипотле",
        price: 6000,
        image: AppImages.fanta,
      ),
    ],
  ),
];
