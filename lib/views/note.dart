import 'package:flutter/material.dart';

enum NoteMode { Editing, Adding }

class Note extends StatelessWidget {
  final NoteMode _noteMode;
  Note(this._noteMode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
                _noteMode == NoteMode.Adding ? 'Take a Note' : 'Edit a Note'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.all(26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: 'Write Your Title Here...',
                ),
              ),
              Container(height: 6),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Your Note...',
                ),
              ),
              Container(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _noteMode == NoteMode.Adding
                      ? Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: _NoteButton('Save', Colors.blue[600], () {
                            Navigator.pop(context);
                          }))
                      : _NoteButton('Save', Colors.blue[600], () {
                          Navigator.pop(context);
                        }),
                  _NoteButton('Discard', Colors.grey[600], () {
                    Navigator.pop(context);
                  }),
                  _noteMode == NoteMode.Editing
                      ? _NoteButton('Delete', Colors.red[600], () {
                          Navigator.pop(context);
                        })
                      : Container(),
                ],
              )
            ],
          ),
        ));
  }
}

class _NoteButton extends StatelessWidget {
  final String _text;
  final Color _color;
  final Function _onPressed;
  _NoteButton(this._text, this._color, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialButton(
      onPressed: _onPressed,
      child: Text(_text, style: TextStyle(color: Colors.white)),
      height: 40,
      minWidth: 100,
      color: _color,
    ));
  }
}
