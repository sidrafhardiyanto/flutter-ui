import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class MyTextField extends StatefulWidget {
  const MyTextField({super.key});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 20,
      controller: textController,
      decoration: const InputDecoration(
        labelText: "Nama",
        labelStyle: TextStyle(color: Colors.blueGrey),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        helperText: "Masukkan nama",
      ),
      onChanged: (value) {},
    );
  }
}

class MyListView extends StatelessWidget {
  MyListView({super.key});

  final List<String> categories = [
    "All",
    "Living Room",
    "Bedroom",
    "Dining Room",
    "Kitchen"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coding Flutter - ListView"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 35,
            child: CustomListView(
              categories: categories,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 200,
            child: CustomListView(
              categories: categories,
              scrollDirection: Axis.vertical,
            ),
          ),
          SizedBox(
            height: 200,
            child: CustomListView(
              categories: categories,
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.categories,
    required this.scrollDirection,
  });

  final List<String> categories;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: scrollDirection,
      children: List.generate(
        categories.length,
        (index) {
          return GestureDetector(
            onTap: () {},
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              child: Text(categories[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  )),
            ),
          );
        },
      ),
    );
  }
}

class MyWrap extends StatelessWidget {
  MyWrap({super.key});

  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.indigo,
    Colors.brown,
    Colors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coding Flutter - Wrap"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Wrap(
              spacing: 20,
              runSpacing: 10,
              children: colors.map((color) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.grey),
                      color: color,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 15,
                            offset: Offset.zero),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDropDown extends StatefulWidget {
  const MyDropDown({super.key});

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  String selected = "Dart";

  final List<String> dropDownList = const [
    "Dart",
    "Kotlin",
    "Java",
    "Javascript",
    "PHP",
    "Python",
    "Ruby",
    "Swift",
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text("Bahasa favorit: "),
        const SizedBox(width: 8),
        DropdownButton(
          value: selected,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 20,
          style: TextStyle(color: Colors.blue[600]),
          underline: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 3,
                ),
              ),
            ),
          ),
          items: dropDownList.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (val) {
            setState(() {
              if (val != null) selected = val;
              print(selected);
            });
          },
        ),
      ],
    );
  }
}

class MySwitch extends StatefulWidget {
  const MySwitch({super.key});

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool isOn = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Connect Instagram"),
        Switch(
          value: isOn,
          onChanged: (bool? val) {
            if (val != null) {
              setState(() {
                isOn = val;
                print("Switch: $isOn");
              });
            }
          },
        ),
      ],
    );
  }
}

class MyRadio extends StatefulWidget {
  const MyRadio({super.key});

  @override
  State<MyRadio> createState() => _MyRadioState();
}

class _MyRadioState extends State<MyRadio> {
  String sex = "pria";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Jenis Kelamin: "),
        const SizedBox(width: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: 'pria',
              groupValue: sex,
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    sex = value;
                    print("sex: $sex");
                  }
                });
              },
            ),
            const Text("Pria"),
          ],
        ),
        const SizedBox(width: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: "wanita",
              groupValue: sex,
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    sex = value;
                    print("sex: $sex");
                  }
                });
              },
            ),
            const Text("Wanita"),
          ],
        ),
      ],
    );
  }
}

class MyCheckbox extends StatefulWidget {
  const MyCheckbox({super.key});

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              if (value != null) {
                isChecked = value;
                print("setuju: $isChecked");
              }
            });
          },
        ),
        const SizedBox(width: 4),
        const Text(
          "Setuju syarat dan ketentuan.",
          style: TextStyle(decoration: TextDecoration.underline),
        ),
      ],
    );
  }
}

class MyDialog extends StatefulWidget {
  const MyDialog({super.key});

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Info'),
              content: const SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text('Your order was placed.'),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: const Text('Open Dialog'),
    );
  }
}

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({super.key});

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Your order was placed!'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Ok'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: const Text('Open BottomSheet'),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Two'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coding Flutter - TabBar"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.directions_boat)),
            Tab(icon: Icon(Icons.directions_bus)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text("Tab 1")),
          Center(child: Text("Tab 2")),
          Center(child: Text("Tab 3")),
        ],
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> menuItems = [
    {
      "title": "Home",
      "icon": Icons.home,
    },
    {
      "title": "Chart",
      "icon": Icons.shopping_cart,
    },
    {
      "title": "Favorites",
      "icon": Icons.star_border,
    },
    {
      "title": "Account",
      "icon": Icons.person,
    },
  ];

  int _selectedItem = 0;
  String _text = "Home";

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
      _text = menuItems[index]["title"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              color: Colors.blue[100],
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                accountName: const Text(
                  'Sidra Febrian Hardiyanto',
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: const Text(
                  "sidrafhardiyanto@karimunjawa.co.id",
                  style: TextStyle(color: Colors.black),
                ),
                currentAccountPicture: const CircleAvatar(
                  child: FlutterLogo(size: 50),
                ),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 160,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "UNISNU Jepara",
                style: TextStyle(color: Colors.black),
              ),
              background: FlutterLogo(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.blue[200],
                  height: 100,
                  child: Center(
                    child: Text(
                      "Item $index",
                      textScaler: const TextScaler.linear(2),
                    ),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Text(
                  'Kamu klik: $_text',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  height: 300,
                  child: MyTabBar(),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: const Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "List checklist ",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.check,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.blue,
                          content: Text('Your request is succesful'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      shadowColor: Colors.grey[20],
                      elevation: 5.0,
                    ),
                    child: Text(
                      "Add To Cart".toUpperCase(),
                      style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    top: 30,
                    bottom: 40,
                  ),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://picsum.photos/200'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedItemColor: Colors.black87,
        elevation: 32,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          height: 1.5,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          height: 1.5,
          fontSize: 12,
        ),
        items: menuItems
            .map(
              (item) => BottomNavigationBarItem(
                icon: Icon(item["icon"]),
                label: item["title"],
                activeIcon: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  child: Icon(item["icon"]),
                ),
              ),
            )
            .toList(),
        currentIndex: _selectedItem,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.emoji_emotions, color: Colors.yellow),
      ),
    );
  }
}
