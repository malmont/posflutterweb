import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pos_flutter/features/products/domain/entities/categoty/category.dart';
import 'package:pos_flutter/features/products/domain/entities/product/product.dart';
import 'package:pos_flutter/features/products/domain/entities/product/style.dart';
import 'package:pos_flutter/features/products/domain/entities/product/variant.dart';
import 'package:pos_flutter/features/products/domain/entities/product/size.dart'
    as ProductSize;
import 'package:pos_flutter/features/products/domain/entities/product/color.dart'
    as ColorSize;

import 'package:shimmer/shimmer.dart';

import '../../../../design/design.dart';

class ProductViewPage extends StatefulWidget {
  const ProductViewPage({super.key});

  @override
  State<ProductViewPage> createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  final List<Product> articles = [
    Product(
      id: '1',
      name: 'Article 1',
      description: 'Description de l\'article 1',
      price: 1999,
      purchasePrice: 1500,
      coefficientMultiplier: 2,
      barcode: '123456789',
      isBestseller: true,
      isNewArrival: false,
      isFeatured: false,
      isSpecialOffer: false,
      image:
          'https://cdn.pixabay.com/photo/2018/01/13/19/26/fashion-3080626_1280.jpg',
      quantity: 10,
      createdAt: DateTime.now(),
      tags: 'fashion,summer',
      slug: 'article-1',
      style: const Style(id: 1, name: 'Casual'),
      variants: const [
        Variant(
            id: 1,
            color: ColorSize.Color(id: 1, name: 'Red', codeHexa: '#FF0000'),
            size: ProductSize.Size(id: 1, name: 'M'),
            stockQuantity: 10),
      ],
      category: const [
        Category(
            id: 1,
            name: 'Vêtements',
            description: 'Description de la catégorie',
            image:
                'https://cdn.pixabay.com/photo/2018/01/13/19/26/fashion-3080626_1280.jpg'),
      ],
    ),
    Product(
      id: '2',
      name: 'Article 2',
      description: 'Description de l\'article 2',
      price: 2999,
      purchasePrice: 2200,
      coefficientMultiplier: 2,
      barcode: '987654321',
      isBestseller: false,
      isNewArrival: true,
      isFeatured: false,
      isSpecialOffer: true,
      image:
          'https://cdn.pixabay.com/photo/2018/01/13/19/26/fashion-3080626_1280.jpg',
      quantity: 5,
      createdAt: DateTime.now(),
      tags: 'fashion,winter',
      slug: 'article-2',
      style: const Style(id: 2, name: 'Sport'), // Suppression du const
      variants: const [
        Variant(
            id: 2,
            color: ColorSize.Color(id: 2, name: 'Blue', codeHexa: '#0000FF'),
            size: ProductSize.Size(id: 2, name: 'L'),
            stockQuantity: 5),
      ], // Suppression du const
      category: const [
        Category(
            id: 2,
            name: 'Accessoires',
            description: 'Description de la catégorie',
            image:
                'https://cdn.pixabay.com/photo/2016/03/27/20/53/handbags-1283575_1280.jpg'),
      ], // Suppression du const
    ),
    Product(
      id: '3',
      name: 'Article 3',
      description: 'Description de l\'article 3',
      price: 3999,
      purchasePrice: 3000,
      coefficientMultiplier: 2,
      barcode: '654321987',
      isBestseller: false,
      isNewArrival: true,
      isFeatured: true,
      isSpecialOffer: false,
      image:
          'https://cdn.pixabay.com/photo/2015/09/04/19/51/woman-922621_1280.jpg',
      quantity: 8,
      createdAt: DateTime.now(),
      tags: 'fashion,fall',
      slug: 'article-3',
      style: const Style(id: 3, name: 'Elegant'), // Suppression du const
      variants: const [
        Variant(
            id: 3,
            color: ColorSize.Color(id: 3, name: 'Green', codeHexa: '#00FF00'),
            size: ProductSize.Size(id: 3, name: 'S'),
            stockQuantity: 8),
      ], // Suppression du const
      category: const [
        Category(
            id: 3,
            name: 'Chaussures',
            description: 'Description de la catégorie',
            image:
                'https://cdn.pixabay.com/photo/2017/08/06/09/38/shoes-2591674_1280.jpg'),
      ], // Suppression du const
    ),
    Product(
      id: '3',
      name: 'Article 3',
      description: 'Description de l\'article 3',
      price: 3999,
      purchasePrice: 3000,
      coefficientMultiplier: 2,
      barcode: '654321987',
      isBestseller: false,
      isNewArrival: true,
      isFeatured: true,
      isSpecialOffer: false,
      image:
          'https://cdn.pixabay.com/photo/2015/09/04/19/51/woman-922621_1280.jpg',
      quantity: 8,
      createdAt: DateTime.now(),
      tags: 'fashion,fall',
      slug: 'article-3',
      style: const Style(id: 3, name: 'Elegant'), // Suppression du const
      variants: const [
        Variant(
            id: 3,
            color: ColorSize.Color(id: 3, name: 'Green', codeHexa: '#00FF00'),
            size: ProductSize.Size(id: 3, name: 'S'),
            stockQuantity: 8),
      ], // Suppression du const
      category: const [
        Category(
            id: 3,
            name: 'Chaussures',
            description: 'Description de la catégorie',
            image:
                'https://cdn.pixabay.com/photo/2017/08/06/09/38/shoes-2591674_1280.jpg'),
      ], // Suppression du const
    ),
    Product(
      id: '3',
      name: 'Article 3',
      description: 'Description de l\'article 3',
      price: 3999,
      purchasePrice: 3000,
      coefficientMultiplier: 2,
      barcode: '654321987',
      isBestseller: false,
      isNewArrival: true,
      isFeatured: true,
      isSpecialOffer: false,
      image:
          'https://cdn.pixabay.com/photo/2015/09/04/19/51/woman-922621_1280.jpg',
      quantity: 8,
      createdAt: DateTime.now(),
      tags: 'fashion,fall',
      slug: 'article-3',
      style: const Style(id: 3, name: 'Elegant'), // Suppression du const
      variants: const [
        Variant(
            id: 3,
            color: ColorSize.Color(id: 3, name: 'Green', codeHexa: '#00FF00'),
            size: ProductSize.Size(id: 3, name: 'S'),
            stockQuantity: 8),
      ], // Suppression du const
      category: const [
        Category(
            id: 3,
            name: 'Chaussures',
            description: 'Description de la catégorie',
            image:
                'https://cdn.pixabay.com/photo/2017/08/06/09/38/shoes-2591674_1280.jpg'),
      ], // Suppression du const
    ),
    Product(
      id: '3',
      name: 'Article 3',
      description: 'Description de l\'article 3',
      price: 3999,
      purchasePrice: 3000,
      coefficientMultiplier: 2,
      barcode: '654321987',
      isBestseller: false,
      isNewArrival: true,
      isFeatured: true,
      isSpecialOffer: false,
      image:
          'https://cdn.pixabay.com/photo/2015/09/04/19/51/woman-922621_1280.jpg',
      quantity: 8,
      createdAt: DateTime.now(),
      tags: 'fashion,fall',
      slug: 'article-3',
      style: const Style(id: 3, name: 'Elegant'), // Suppression du const
      variants: const [
        Variant(
            id: 3,
            color: ColorSize.Color(id: 3, name: 'Green', codeHexa: '#00FF00'),
            size: ProductSize.Size(id: 3, name: 'S'),
            stockQuantity: 8),
      ], // Suppression du const
      category: const [
        Category(
            id: 3,
            name: 'Chaussures',
            description: 'Description de la catégorie',
            image:
                'https://cdn.pixabay.com/photo/2017/08/06/09/38/shoes-2591674_1280.jpg'),
      ], // Suppression du const
    ),
    Product(
      id: '3',
      name: 'Article 3',
      description: 'Description de l\'article 3',
      price: 3999,
      purchasePrice: 3000,
      coefficientMultiplier: 2,
      barcode: '654321987',
      isBestseller: false,
      isNewArrival: true,
      isFeatured: true,
      isSpecialOffer: false,
      image:
          'https://cdn.pixabay.com/photo/2015/09/04/19/51/woman-922621_1280.jpg',
      quantity: 8,
      createdAt: DateTime.now(),
      tags: 'fashion,fall',
      slug: 'article-3',
      style: const Style(id: 3, name: 'Elegant'), // Suppression du const
      variants: const [
        Variant(
            id: 3,
            color: ColorSize.Color(id: 3, name: 'Green', codeHexa: '#00FF00'),
            size: ProductSize.Size(id: 3, name: 'S'),
            stockQuantity: 8),
      ], // Suppression du const
      category: const [
        Category(
            id: 3,
            name: 'Chaussures',
            description: 'Description de la catégorie',
            image:
                'https://cdn.pixabay.com/photo/2017/08/06/09/38/shoes-2591674_1280.jpg'),
      ], // Suppression du const
    ),
    Product(
      id: '3',
      name: 'Article 3',
      description: 'Description de l\'article 3',
      price: 3999,
      purchasePrice: 3000,
      coefficientMultiplier: 2,
      barcode: '654321987',
      isBestseller: false,
      isNewArrival: true,
      isFeatured: true,
      isSpecialOffer: false,
      image:
          'https://cdn.pixabay.com/photo/2015/09/04/19/51/woman-922621_1280.jpg',
      quantity: 8,
      createdAt: DateTime.now(),
      tags: 'fashion,fall',
      slug: 'article-3',
      style: const Style(id: 3, name: 'Elegant'), // Suppression du const
      variants: const [
        Variant(
            id: 3,
            color: ColorSize.Color(id: 3, name: 'Green', codeHexa: '#00FF00'),
            size: ProductSize.Size(id: 3, name: 'S'),
            stockQuantity: 8),
      ], // Suppression du const
      category: const [
        Category(
            id: 3,
            name: 'Chaussures',
            description: 'Description de la catégorie',
            image:
                'https://cdn.pixabay.com/photo/2017/08/06/09/38/shoes-2591674_1280.jpg'),
      ], // Suppression du const
    ),
    Product(
      id: '3',
      name: 'Article 3',
      description: 'Description de l\'article 3',
      price: 3999,
      purchasePrice: 3000,
      coefficientMultiplier: 2,
      barcode: '654321987',
      isBestseller: false,
      isNewArrival: true,
      isFeatured: true,
      isSpecialOffer: false,
      image:
          'https://cdn.pixabay.com/photo/2015/09/04/19/51/woman-922621_1280.jpg',
      quantity: 8,
      createdAt: DateTime.now(),
      tags: 'fashion,fall',
      slug: 'article-3',
      style: const Style(id: 3, name: 'Elegant'), // Suppression du const
      variants: const [
        Variant(
            id: 3,
            color: ColorSize.Color(id: 3, name: 'Green', codeHexa: '#00FF00'),
            size: ProductSize.Size(id: 3, name: 'S'),
            stockQuantity: 8),
      ], // Suppression du const
      category: const [
        Category(
            id: 3,
            name: 'Chaussures',
            description: 'Description de la catégorie',
            image:
                'https://cdn.pixabay.com/photo/2017/08/06/09/38/shoes-2591674_1280.jpg'),
      ], // Suppression du const
    ),
    Product(
      id: '3',
      name: 'Article 3',
      description: 'Description de l\'article 3',
      price: 3999,
      purchasePrice: 3000,
      coefficientMultiplier: 2,
      barcode: '654321987',
      isBestseller: false,
      isNewArrival: true,
      isFeatured: true,
      isSpecialOffer: false,
      image:
          'https://cdn.pixabay.com/photo/2015/09/04/19/51/woman-922621_1280.jpg',
      quantity: 8,
      createdAt: DateTime.now(),
      tags: 'fashion,fall',
      slug: 'article-3',
      style: const Style(id: 3, name: 'Elegant'), // Suppression du const
      variants: const [
        Variant(
            id: 3,
            color: ColorSize.Color(id: 3, name: 'Green', codeHexa: '#00FF00'),
            size: ProductSize.Size(id: 3, name: 'S'),
            stockQuantity: 8),
      ], // Suppression du const
      category: const [
        Category(
            id: 3,
            name: 'Chaussures',
            description: 'Description de la catégorie',
            image:
                'https://cdn.pixabay.com/photo/2017/08/06/09/38/shoes-2591674_1280.jpg'),
      ], // Suppression du const
    ),
    Product(
      id: '3',
      name: 'Article 3',
      description: 'Description de l\'article 3',
      price: 3999,
      purchasePrice: 3000,
      coefficientMultiplier: 2,
      barcode: '654321987',
      isBestseller: false,
      isNewArrival: true,
      isFeatured: true,
      isSpecialOffer: false,
      image:
          'https://cdn.pixabay.com/photo/2015/09/04/19/51/woman-922621_1280.jpg',
      quantity: 8,
      createdAt: DateTime.now(),
      tags: 'fashion,fall',
      slug: 'article-3',
      style: const Style(id: 3, name: 'Elegant'), // Suppression du const
      variants: const [
        Variant(
            id: 3,
            color: ColorSize.Color(id: 3, name: 'Green', codeHexa: '#00FF00'),
            size: ProductSize.Size(id: 3, name: 'S'),
            stockQuantity: 8),
      ], // Suppression du const
      category: const [
        Category(
            id: 3,
            name: 'Chaussures',
            description: 'Description de la catégorie',
            image:
                'https://cdn.pixabay.com/photo/2017/08/06/09/38/shoes-2591674_1280.jpg'),
      ], // Suppression du const
    ),
    Product(
      id: '3',
      name: 'Article 3',
      description: 'Description de l\'article 3',
      price: 3999,
      purchasePrice: 3000,
      coefficientMultiplier: 2,
      barcode: '654321987',
      isBestseller: false,
      isNewArrival: true,
      isFeatured: true,
      isSpecialOffer: false,
      image:
          'https://cdn.pixabay.com/photo/2015/09/04/19/51/woman-922621_1280.jpg',
      quantity: 8,
      createdAt: DateTime.now(),
      tags: 'fashion,fall',
      slug: 'article-3',
      style: const Style(id: 3, name: 'Elegant'), // Suppression du const
      variants: const [
        Variant(
            id: 3,
            color: ColorSize.Color(id: 3, name: 'Green', codeHexa: '#00FF00'),
            size: ProductSize.Size(id: 3, name: 'S'),
            stockQuantity: 8),
      ], // Suppression du const
      category: const [
        Category(
            id: 3,
            name: 'Chaussures',
            description: 'Description de la catégorie',
            image:
                'https://cdn.pixabay.com/photo/2017/08/06/09/38/shoes-2591674_1280.jpg'),
      ], // Suppression du const
    ),
    Product(
      id: '3',
      name: 'Article 3',
      description: 'Description de l\'article 3',
      price: 3999,
      purchasePrice: 3000,
      coefficientMultiplier: 2,
      barcode: '654321987',
      isBestseller: false,
      isNewArrival: true,
      isFeatured: true,
      isSpecialOffer: false,
      image:
          'https://cdn.pixabay.com/photo/2015/09/04/19/51/woman-922621_1280.jpg',
      quantity: 8,
      createdAt: DateTime.now(),
      tags: 'fashion,fall',
      slug: 'article-3',
      style: const Style(id: 3, name: 'Elegant'), // Suppression du const
      variants: const [
        Variant(
            id: 3,
            color: ColorSize.Color(id: 3, name: 'Green', codeHexa: '#00FF00'),
            size: ProductSize.Size(id: 3, name: 'S'),
            stockQuantity: 8),
      ], // Suppression du const
      category: const [
        Category(
            id: 3,
            name: 'Chaussures',
            description: 'Description de la catégorie',
            image:
                'https://cdn.pixabay.com/photo/2017/08/06/09/38/shoes-2591674_1280.jpg'),
      ], // Suppression du const
    ),
    Product(
      id: '3',
      name: 'Article 3',
      description: 'Description de l\'article 3',
      price: 3999,
      purchasePrice: 3000,
      coefficientMultiplier: 2,
      barcode: '654321987',
      isBestseller: false,
      isNewArrival: true,
      isFeatured: true,
      isSpecialOffer: false,
      image:
          'https://cdn.pixabay.com/photo/2015/09/04/19/51/woman-922621_1280.jpg',
      quantity: 8,
      createdAt: DateTime.now(),
      tags: 'fashion,fall',
      slug: 'article-3',
      style: const Style(id: 3, name: 'Elegant'), // Suppression du const
      variants: const [
        Variant(
            id: 3,
            color: ColorSize.Color(id: 3, name: 'Green', codeHexa: '#00FF00'),
            size: ProductSize.Size(id: 3, name: 'S'),
            stockQuantity: 8),
      ], // Suppression du const
      category: const [
        Category(
            id: 3,
            name: 'Chaussures',
            description: 'Description de la catégorie',
            image:
                'https://cdn.pixabay.com/photo/2017/08/06/09/38/shoes-2591674_1280.jpg'),
      ], // Suppression du const
    ),
  ];
  final List<Category> categories = const [
    Category(
      id: 1,
      name: 'Vêtements',
      description: 'Fashion items',
      image:
          'https://cdn.pixabay.com/photo/2015/09/04/19/51/woman-922621_1280.jpg',
    ),
    Category(
      id: 2,
      name: 'Accessoires',
      description: 'Accessories',
      image:
          'https://cdn.pixabay.com/photo/2015/09/04/19/51/woman-922621_1280.jpg',
    ),
    Category(
      id: 3,
      name: 'Chaussures',
      description: 'Shoes',
      image:
          'https://cdn.pixabay.com/photo/2015/09/04/19/51/woman-922621_1280.jpg',
    ),
    Category(
      id: 4,
      name: 'Chaussures',
      description: 'Shoes',
      image:
          'https://cdn.pixabay.com/photo/2015/09/04/19/51/woman-922621_1280.jpg',
    ),
    Category(
      id: 5,
      name: 'Chaussures',
      description: 'Shoes',
      image:
          'https://cdn.pixabay.com/photo/2015/09/04/19/51/woman-922621_1280.jpg',
    ),
  ];

  int selectedCategoryId = 1;

  @override
  Widget build(BuildContext context) {
    var isSelected = true;
    return Scaffold(
      backgroundColor: const Color(0xff393C49),
      body: Row(
        children: [
          Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'LOLIBEE',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: 300,
                      child: TextField(
                        autofocus: false,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 20, bottom: 22, top: 22),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Icon(Icons.search),
                          ),
                          border: const OutlineInputBorder(),
                          hintText: "Search Product",
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 3.0),
                            borderRadius: BorderRadius.circular(26),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(26),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 3.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categories.map((category) {
                      bool isSelected = category.id == selectedCategoryId;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategoryId = category.id;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: isSelected
                                ? Colours.colorsButtonMenu
                                : Colours.primary100,
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                category.name,
                                style: TextStyle(
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 5.0,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              ArticleCard(article: articles[index]),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colours.primaryPalette,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Détails supplémentaires',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 16, color: Colours.white),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Informations diverses',
                    style: TextStyle(fontSize: 16, color: Colours.white),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Autre information importante',
                    style: TextStyle(fontSize: 16, color: Colours.white),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      style: CustomButtonStyle.customButtonStyle(
                        type: ButtonType.cancelButton,
                        isSelected: isSelected,
                      ),
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Text('Go cancelButton!'),
                    ),
                  ),
                  ElevatedButton(
                    style: CustomButtonStyle.customButtonStyle(
                      type: ButtonType.selectedButton,
                      isSelected: isSelected,
                    ),
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                    child: const Text("selectedButton"),
                  ),
                  ElevatedButton(
                    style: CustomButtonStyle.customButtonStyle(
                      type: ButtonType.validButton,
                      isSelected: isSelected,
                    ),
                    onPressed: () {
                      setState(() {});
                    },
                    child: const Text('validButton'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final Product article;

  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 200,
          width: 250,
          child: Card(
            color: Colours.primaryPalette,
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Text(
                    article.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article.price.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article.description,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -30,
          left: 0,
          right: 0,
          child: Center(
            child: CachedNetworkImage(
              imageUrl: article.image,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 60,
                backgroundImage: imageProvider,
              ),
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey.shade100,
                highlightColor: Colors.white,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey.shade200,
                ),
              ),
              errorWidget: (context, url, error) => const CircleAvatar(
                radius: 60,
                child: Icon(Icons.error),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
