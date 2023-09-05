import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventas_pinar/ventas_pinar/infra/models/theme_model.dart';

class DrawerBar extends StatelessWidget {
  const DrawerBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeModel>(listen: false, context);
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Stack(children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 80,
                child: const Icon(Icons.person, size: 80),
              ),
              Positioned(
                  bottom: 5,
                  right: 10,
                  child: FloatingActionButton.small(
                    onPressed: () {},
                    child: const Icon(Icons.add_a_photo_outlined),
                  ))
            ]),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                TextButton.icon(
                    onPressed: () {
                      showModalBottomSheet(
                        // backgroundColor: Colors.white,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Text(
                                  'Ajustes del tema de la aplicacion :',
                                  style: TextStyle(fontSize: 22),
                                ),
                                const SizedBox(height: 20,),
                                Wrap(
                                  runSpacing: 10,
                                  // alignment: WrapAlignment.spaceAround,
                                  spacing: 8,
                                  children: [
                                    for (int i = 0; i < 15; i++)
                                      GestureDetector(
                                          onTap: () => themeChanger.color =
                                              Colors.primaries[i],
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    Colors.primaries[i],
                                              ),
                                              (i<9)? Text('Color #0${i + 1}') :
                                              Text('Color #${i + 1}')
                                            ],
                                          ))
                                  ],
                                ),
                                SwitchListTile.adaptive(
                                  title: const Text('Modo oscuro'),
                                  value: themeChanger.isDarkMode!,
                                  onChanged: (value) =>
                                      themeChanger.isDarkMode = value,
                                ),
                                // SwitchListTile.adaptive(
                                //   title: const Text('Modo claro'),
                                //   value: themeChanger.isLigthMode!,
                                //   onChanged: (value) =>
                                //       themeChanger.isLigthMode = value,
                                // ),
                              ],
                            ),
                          );

                          // return ListView.builder(
                          //   padding: const EdgeInsets.all(8),
                          //   physics: const BouncingScrollPhysics(),
                          //   shrinkWrap: true,
                          //   itemCount: 15,
                          //   itemBuilder: (context, index) {
                          //     return ListTile(
                          //       onTap:() {
                          //         themeChanger.color=Colors.primaries[index];
                          //       },
                          //       title: Text('Color # $index'),
                          //       subtitle: CircleAvatar(
                          //           backgroundColor: Colors.primaries[index]),
                          //     );
                          //   },
                          // );
                        },
                      );
                    },
                    icon: const Icon(Icons.dark_mode),
                    label: const Text('Ajustes')),
                const SizedBox(
                  height: 20,
                ),
                TextButton.icon(
                    onPressed: () {
                      showAboutDialog(
                          context: context,
                          applicationIcon: Icon(
                            Icons.sell_outlined,
                            color: Theme.of(context).primaryColor,
                          ),
                          applicationName: 'Se Vende en Pinar',
                          applicationVersion: '0.01',
                          children: [
                            const Text(
                                textAlign: TextAlign.justify,
                                'Officia laborum commodo elit commodo nisi. Eiusmod nulla exercitation officia occaecat elit exercitation eu occaecat aliqua non nisi incididunt velit aute. Ex velit cillum excepteur sint aliquip dolor fugiat sunt consectetur in officia. Velit non eu occaecat pariatur velit. Ipsum reprehenderit enim excepteur consectetur deserunt tempor.\nUllamco nisi cillum ex fugiat quis. Mollit duis officia voluptate eu sint magna Lorem labore et proident laboris consequat officia voluptate. Dolor mollit Lorem incididunt incididunt et in aliquip minim exercitation ipsum aliquip reprehenderit. Est occaecat officia proident et sint velit qui esse consectetur et est mollit. Adipisicing est pariatur ipsum exercitation nulla occaecat eu non in qui qui excepteur. Tempor esse nostrud non cupidatat anim do dolor duis in commodo non nisi duis. Est veniam ipsum veniam enim incididunt veniam incididunt qui aliqua labore reprehenderit aliqua.\nEu culpa deserunt nisi nostrud. Dolor adipisicing excepteur cupidatat laborum excepteur anim consectetur. Et dolore occaecat esse elit nostrud aliqua anim qui dolor ex officia dolore excepteur labore. Veniam elit officia elit ad nisi cillum qui velit sunt adipisicing. Amet duis ullamco irure fugiat in fugiat reprehenderit dolore minim labore sit consectetur. Minim reprehenderit consectetur magna aute nulla labore aute eiusmod quis in tempor mollit cillum eiusmod.')
                          ]);
                    },
                    icon: const Icon(Icons.people),
                    label: const Text('Sobre nosotros')),
                const SizedBox(
                  height: 20,
                ),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.person),
                    label: const Text('Editar perfil')),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
