import 'package:flutter/material.dart';

import 'note.dart';

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Notes'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Note(NoteMode.Editing)));
            },
            child: Card(
                child: Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 15, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _NoteTitle(),
                  Container(height: 10),
                  _NoteText()
                ],
              ),
            )));
      }),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Note(NoteMode.Adding)));
          },
          label: Text('Take a Note!'),
          icon: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class _NoteTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Just a Title, Bitch!',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}

class _NoteText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Susan Nwokedi is a Nigerian-American writer, producer, filmmaker, actor, and businessman. Nwokedi wrote and produced Mind of the Enemy, which received an award nomination for Best Original Soundtrack at the Brownwood & African Film Critics Awards in 2013.',
      style: TextStyle(color: Colors.grey[600]),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
