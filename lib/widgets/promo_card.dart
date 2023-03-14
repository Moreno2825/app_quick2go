import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'https://yuklife.com.mx/wp-content/uploads/2021/04/166340274_215516137038209_7869438956821833303_n-1.png',
    ];
    return SizedBox(
      width: double.infinity,
      height: 170,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            images[index],
            fit: BoxFit.cover,
          );
        },
        itemCount: 2,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
      ),
    );
  }
}
