import 'package:aluminex_client/features/home/cubit/home_cubit.dart';
import 'package:aluminex_client/features/home/cubit/home_cubit_states.dart';
import 'package:aluminex_client/features/home/widgets/order_banner.dart';
import 'package:aluminex_client/features/home/widgets/social_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeCubit homeCubit = HomeCubit();

  @override
  void initState() {
    super.initState();
    homeCubit.initialize();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://aluminexbrasil.com.br/wp-content/uploads/2020/07/6-2.jpg',
      'https://aluminexbrasil.com.br/wp-content/uploads/2020/07/1-2.jpg',
      'https://aluminexbrasil.com.br/wp-content/uploads/2020/07/2-2.jpg',
      'https://aluminexbrasil.com.br/wp-content/uploads/2020/07/13-1.jpeg',
      'https://aluminexbrasil.com.br/wp-content/uploads/2020/07/19-1.jpeg',
      'https://aluminexbrasil.com.br/wp-content/uploads/2020/07/52-1.jpg',
      'https://aluminexbrasil.com.br/wp-content/uploads/2020/07/68-1.jpeg',
      'https://aluminexbrasil.com.br/wp-content/uploads/2020/07/109-2.jpeg',
      'https://aluminexbrasil.com.br/wp-content/uploads/2020/07/110-2.jpeg',
      'https://aluminexbrasil.com.br/wp-content/uploads/2020/07/116-1.jpeg'
    ];
    return Material(
      color: Colors.grey.shade300,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
      child: BlocBuilder<HomeCubit, HomeCubitState>(
        bloc: homeCubit,
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is HomeErrorState) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is HomeLoadedState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      'Nossa galeria',
                      style: GoogleFonts.robotoSlab(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlayInterval: const Duration(seconds: 2),
                        height: 200,
                        autoPlay: true,
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: NetworkImage(images[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Acompanhe seus pedidos',
                      style: GoogleFonts.robotoSlab(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .25,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.orders.length,
                        itemBuilder: (context, index) {
                          return OrderBanner(
                            order: state.orders[index],
                          );
                        },
                      ),
                    ),
                    Text(
                      'Nossas redes sociais',
                      style: GoogleFonts.robotoSlab(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async {
                            var whatsappUrl = "https://wa.me/15561984906040";

                            await launchUrl(Uri.parse('https://www.linkedin.com/in/matheus-felipe-477216208/'));
                          },
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset(
                              'assets/images/wpp_icon.png',
                            ),
                          ),
                        ),
                        const SocialButton(
                          assetPath: 'assets/images/instagram_icon.png',
                          url: 'https://www.instagram.com/aluminexbrasil/',
                        ),
                        const SocialButton(
                          assetPath: 'assets/images/youtube_icon.png',
                          url: 'https://www.youtube.com/watch?v=11hdTsMC710',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }

          return const Text('Outro erro');
        },
      ),
    );
  }
}
