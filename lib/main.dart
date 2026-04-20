  import 'package:flutter/material.dart';

  void main() =>
      runApp(MaterialApp(debugShowCheckedModeBanner: false, home: home()));

  class home extends StatelessWidget {
    const home({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.png"),
              fit: BoxFit.cover,
            ),
          ),

          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context)
                    .size
                    .shortestSide, //tinggi menyesuaikan isi konten didalam container
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Color.fromRGBO(252, 219, 138, 0.8),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 100.0,
                          backgroundImage: AssetImage('images/profile.jpg'),
                        ),
                        Text(
                          "Kirito Kurosaki",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        Text(
                          "Student at SMK Wikrama Bogor",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => page2()),
                            );
                          },
                          child: Text("See More!"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  class page2 extends StatelessWidget {
    const page2({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color.fromRGBO(252, 219, 138, 0.8),
        body:SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16),

                // Back Button Row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 22,
                      ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Avatar
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('images/profile.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: 12),

              // Name below avatar
              Text(
                "Kirito Kurosaki",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 4),

              // Cards
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // About Card
                    _SectionCard(
                      title: "About", 
                      backgroundColor: Color.fromRGBO(191, 160, 49, 1), 
                      children: [
                        _bodyText("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
                      ],
                    ),

                    SizedBox(height: 16),

                    // Personal Traits
                    _SectionCard(
                      title: "Personal Traits", 
                      backgroundColor: Color.fromRGBO(255, 252, 239, 1), 
                      children: [
                        _bodyText("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
                      ],
                    ),

                    SizedBox(height: 16),

                    // Contact Card
                    _SectionCard(
                      title: "Contact", 
                      backgroundColor: Color.fromRGBO(191, 160, 49, 1), 
                      children: [
                        _contactItem("Email: Childmole-lester@example.com"),
                        _divider(),
                        _contactItem("Phone: 08123456789"),
                        _divider(),
                        _contactItem("Address: 123 Main Street, City, Country"),
                      ],
                    ),

                    SizedBox(height: 16),

                  ],
                )
              ),
            ],
          ),
        ),
        ),
      );
  }

  Widget _divider() => const Divider(
    height: 1,
    thickness: 1,
    color: Colors.black,
  );
  Widget _bodyText(String text) => Text(
    text,
    style: TextStyle(
      fontSize: 16,
      color: Colors.black,
      height: 1.5,
    ),
  );
  Widget _contactItem(String label) => Padding(
    padding: EdgeInsets.symmetric(vertical: 12),
    child: Text(
      label,
      style: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
  


class _SectionCard extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final List<Widget> children;

  const _SectionCard({
    required this.title,
    required this.backgroundColor,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }
}