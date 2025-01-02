import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

class PostersScreen extends StatelessWidget {
  const PostersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Consts.color,
        child: BlocProvider<PostersCubit>(
          create: (context) => PostersCubit()..initialize(),
          child: SelectionArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(Consts.padding),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: [
                        Align(
                          child: Text(
                            'MODUS OPERANDI',
                            textAlign: TextAlign.center,
                            style: Consts.typographyHeader,
                          ),
                        ),
                        Text(
                          'Once in a while I design the posters for my friends for some special occassions. It started as a joke (and in fact it still is) - basically each of these works was created to capture some more-or-less funny reference / thought addressed to specific person.  Personally I found comfort in creating these abominations - if any of my friends hung any of them on the wall - good for them. As a rule of thumb I print each poster once. I put the works here as a low-quality pictures. The quality of the upload is shit, but if anyone would be so stupid to think of selling these in any form - I do not give permission for such actions.',
                          textAlign: TextAlign.justify,
                          style: Consts.typography,
                        ),
                        PosterTile(
                          title: 'South Park: You' 're getting old',
                          description:
                              "It is where the joke began. These 2 beauties are based on my favourite all-time classic South Park episode `You're getting old` Both posters reference the episode running joke - the gutter-level try-hard unfunny wild scenarios from the Adam Sandlers movies (well, that was true for movies with him at that time - although he did had good acts like i.e. \"Funny People\"). I have to admit I always had a penchant for the anti-comedy. Posters were created for my Sunday-South-Park-Discussion-Club members, as my farewell gift.",
                          posters: [
                            'images/posters/SP_1.jpg',
                            'images/posters/SP_2.jpg',
                          ],
                        ),
                        PosterTile(
                          title: 'One for the neck',
                          description:
                              'The funny story about this one is that I could not find the poster for a given size - so I decided to create my own. The excerpt comes from `Binge, Boil & Blow` by KMFDM - as a tribute to one and only Lord of The Lard - Mr Watts, who actually delivered/redefined my musical taste. So the concept was to take my favourite illiteration by Him and present it with the image that I though represents it most accurately. The choice was pretty damn obvious as eyes close-ups are disturbing/disgusting to me. Literally, every time when in horror movie something happens with eyes I scream like a child.',
                          posters: ['images/posters/Disturb.jpg'],
                        ),
                        PosterTile(
                          title: 'Where is here?',
                          description:
                              "My daughter had a philosophical moment when she asked me `Where is here`. I thought it was <i>golden</i> question at that time. Without further ado, we tried a photoshoot of her and provided the text. Whole process took like 15-30 minutes, so the whole poster is rather undercooked. It though have a little-nice filter added which gradually desaturates/darkens the whole picture in a semi-random fashion. This is why the photo has vertical strips. Interestingly enough, the alternative version of the poster had the brightening effect and I actually liked it more. However, I had very weird deja-vu feeling about that version - and I still can't shake this feeling off. That was very unnverving feeling.",
                          posters: ['images/posters/Where.png'],
                        ),
                        PosterTile(
                          title: 'Head trauma',
                          description:
                              "In order to process some events in my life I decided to do some posters for people in my life that had significant impact. I imposed some rules - i.e. every poster had to be shoot in a different style, some things (i.e. font) should be similar, every photo shoot should be done by myself without any 3-rd person interference, every consecutive poster should consequently be more body-centric - I wanted posters to focus on me/my body therefore by proxy share it with others - its a concept that I would be outrageous for myself few years ago. I put here SFW versions of the posters, because some of them were actually more `steamy`.  One note: again Mr Watts sneaked into my posters as the `Violence` poster contains the lyrics from the song of the same title.",
                          posters: [
                            'images/posters/Violence.png',
                            'images/posters/Vanishing.png',
                            'images/posters/Easy.png',
                            'images/posters/Blue.png',
                          ],
                        ),
                        PosterTile(
                          title: 'Coil Saves',
                          description:
                              "Failed attempt for a more baroque poster - actually original design was minimalistic, but at some point I decided to go nuts with the colors. I wanted the final result to melt the viewer eyes - and on screen it might actually does. The print on the other hand... butchered the poster as it does look quite pixelated.",
                          posters: ['images/posters/Coil_Saves.png'],
                        ),
                        PosterTile(
                          title: '<3 Attack',
                          description:
                              "Poster made in Hit-&-Run fashion - wife asked me if I was able to pull off one minimal poster as a wedding gift for her friend. Of course we fell out about the final design as I like monochromatic orange one, and she liked bottle green. We ended up printing both ( ͡° ͜ʖ ͡°)",
                          posters: [
                            'images/posters/Attak_1.png',
                            'images/posters/Attak_2.png',
                          ],
                        ),
                        PosterTile(
                          title: 'Grow Fonder',
                          description: "The one that grew on me for some time - yet to be printed",
                          posters: [
                            'images/posters/Fonder_1.png',
                            'images/posters/Fonder_2.png',
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PosterTile extends StatelessWidget {
  const PosterTile({
    super.key,
    required this.title,
    required this.description,
    required this.posters,
  });

  final String title;
  final String description;
  final List<String> posters;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              Align(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Consts.typographyHeader,
                ),
              ),
              Text(
                description,
                textAlign: TextAlign.justify,
                style: Consts.typography,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (final poster in posters)
                    Image.asset(
                      poster,
                      width: Consts.posterWidth,
                      height: Consts.posterHeight,
                    )
                ],
              ),
              SizedBox(height: Consts.padding),
            ],
          ),
        ],
      );
}
