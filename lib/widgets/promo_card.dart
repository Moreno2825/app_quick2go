import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'https://images.pexels.com/photos/1132047/pexels-photo-1132047.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/5945641/pexels-photo-5945641.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ];
    return SizedBox(
      width: double.infinity,
      height: 220,
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
        autoplay: true,
        autoplayDelay: 15000,
      ),
    );
  }
}
