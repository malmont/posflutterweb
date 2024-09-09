import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../design/design.dart';

class ProductViewPage extends StatefulWidget {
  const ProductViewPage({super.key});

  @override
  State<ProductViewPage> createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  final List<Article> articles = [
    Article(
        image:
            'https://cdn.pixabay.com/photo/2015/01/15/13/06/woman-600238_1280.jpg',
        name: 'Article 1',
        price: '€19.99',
        comment: 'Très bon produit!'),
    Article(
        image:
            'https://cdn.pixabay.com/photo/2018/01/13/19/26/fashion-3080626_1280.jpg',
        name: 'Article 2',
        price: '€29.99',
        comment: 'Produit recommandé.'),
    Article(
        image:
            'https://cdn.pixabay.com/photo/2015/09/04/19/51/woman-922621_1280.jpg',
        name: 'Article 3',
        price: '€39.99',
        comment: 'Vraiment fantastique.'),
  ];

  void _addArticle() {
    // Ajouter un nouvel article à la liste
    setState(() {
      articles.add(Article(
        image:
            'https://cdn.pixabay.com/photo/2015/01/15/13/06/woman-600238_1280.jpg',
        name: 'Nouvel Article',
        price: '€49.99',
        comment: 'Ceci est un nouvel article ajouté!',
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    var isSelected = true;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste d\'Articles'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed:
                _addArticle, // Ajouter un article lorsque le bouton est pressé
          ),
        ],
      ),
      backgroundColor: const Color(0xff393C49),
      body: Row(
        children: [
          // GridView qui occupe 70% de l'espace horizontal
          Expanded(
            flex: 7,
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // 4 cartes par ligne
                    crossAxisSpacing: 10.0, // Espacement horizontal
                    mainAxisSpacing: 5.0, // Espacement vertical
                    childAspectRatio:
                        0.55, // Aspect ratio ajusté pour les cartes
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
          // Colonne à droite qui occupe 30% de l'espace horizontal
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
                  // Ajout d'autres éléments ici
                  const SizedBox(height: 10),
                  const Text(
                    'Autre information importante',
                    style: TextStyle(fontSize: 16, color: Colours.white),
                  ),

                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      style: CustomButtonStyle.customButtonStyle(
                          type: ButtonType.cancelButton,
                          isSelected: isSelected),
                      onPressed: () {},
                      child: const Text('Go cancelButton!'),
                    ),
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

class Article {
  final String image;
  final String name;
  final String price;
  final String comment;

  Article({
    required this.image,
    required this.name,
    required this.price,
    required this.comment,
  });
}

class ArticleCard extends StatelessWidget {
  final Article article;

  ArticleCard({required this.article});

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
                    article.price,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article.comment,
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
          top: -30, // Position de l'image au-dessus de la carte
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
