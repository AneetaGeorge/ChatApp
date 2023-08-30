import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome Aneeta!',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.logout)
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.all(50),
                    padding: EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                        bottomLeft: Radius.circular(24)
                      )
                    ),
                    child: Column(
                      //Take min height
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                            'This is a message',
                            style: TextStyle(
                              fontSize: 14
                        )
                        ),
                        Image.network(
                          'https://static.wikia.nocookie.net/mcleodgaming/images/4/41/InuYasha.png/revision/latest?cb=20170820202304',
                          height: 200,)
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.all(50),
                    padding: EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                            bottomLeft: Radius.circular(24)
                        )
                    ),
                    child: Column(
                      //Take min height
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                            'This is a message',
                            style: TextStyle(
                                fontSize: 14
                            )
                        ),
                        Image.network(
                          'https://static.wikia.nocookie.net/mcleodgaming/images/4/41/InuYasha.png/revision/latest?cb=20170820202304',
                          height: 200,)
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.all(50),
                    padding: EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                            bottomLeft: Radius.circular(24)
                        )
                    ),
                    child: Column(
                      //Take min height
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                            'This is a message',
                            style: TextStyle(
                                fontSize: 14
                            )
                        ),
                        Image.network(
                          'https://static.wikia.nocookie.net/mcleodgaming/images/4/41/InuYasha.png/revision/latest?cb=20170820202304',
                          height: 200,)
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.all(50),
                    padding: EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                            bottomLeft: Radius.circular(24)
                        )
                    ),
                    child: Column(
                      //Take min height
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                            'This is a message',
                            style: TextStyle(
                                fontSize: 14
                            )
                        ),
                        Image.network(
                          'https://static.wikia.nocookie.net/mcleodgaming/images/4/41/InuYasha.png/revision/latest?cb=20170820202304',
                          height: 200,)
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.all(50),
                    padding: EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                            bottomLeft: Radius.circular(24)
                        )
                    ),
                    child: Column(
                      //Take min height
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                            'This is a message',
                            style: TextStyle(
                                fontSize: 14
                            )
                        ),
                        Image.network(
                          'https://static.wikia.nocookie.net/mcleodgaming/images/4/41/InuYasha.png/revision/latest?cb=20170820202304',
                          height: 200,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))
            ),
            child: Row (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.add, color: Colors.white,)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.send, color: Colors.white,)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
