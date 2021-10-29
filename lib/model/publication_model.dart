class Publication {
  String title;
  String desc;
  String imageUrl;
  List<Paragraphe> paragraphe;
  String type;
  DateTime creationDate;
  bool isFav;

  Publication(this.creationDate, this.type, this.isFav,
      {this.title, this.desc, this.imageUrl, this.paragraphe});
}

class Paragraphe {
  String title;
  String texte;

  Paragraphe({this.title, this.texte});
}

List publications = [
  new Publication(DateTime.now(), "article", false,
      title: "Publi 1",
      desc: "desc ergraeq",
      imageUrl:
          "https://images.unsplash.com/photo-1508672019048-805c876b67e2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1093&q=80",
      paragraphe: [
        new Paragraphe(title: "Para 1", texte: "text 1kzjfugbenkla"),
        new Paragraphe(title: "Para 2", texte: "text 2mjhjbjogigyuhiy")
      ],
  ),
  new Publication(DateTime.now(), "article", false,
      title: "Publi 2",
      desc: "desc ergraeq",
      imageUrl:
      "https://images.unsplash.com/photo-1631027761930-bc3bcfd2be74?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
      paragraphe: [
        new Paragraphe(title: "Para 1", texte: "text 1kzjfugbenkla"),
        new Paragraphe(title: "Para 2", texte: "text 2mjhjbjogigyuhiy")
      ]
  ),
  new Publication(DateTime.now(), "article", false,
      title: "Ma premère publication",
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tortor quam, sodales a nunc sit amet, ullamcorper commodo nibh. Nunc id nisi vitae metus posuere gravida non sed erat.",
      imageUrl:
      "https://images.unsplash.com/photo-1630798248935-0ceb55bf0fff?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80",
      paragraphe: [
        new Paragraphe(title: "Aliquam sed auctor magna", texte: "Nunc elementum non tortor tincidunt convallis. Fusce ullamcorper convallis dolor vel ornare. Donec non ex sed arcu aliquet rutrum ut elementum augue. Nunc in arcu arcu. Morbi venenatis massa orci, vitae interdum enim hendrerit ut. Aenean euismod elit at posuere elementum. Donec luctus vitae lectus a efficitur. Sed volutpat mollis sem non fermentum. Donec semper elit id nulla accumsan, congue fermentum enim vulputate. Aliquam mi nunc, vulputate eget eleifend vitae, ullamcorper ut purus."),
        new Paragraphe(title: "Quisque sit amet mi sapien", texte: "Pellentesque sed erat sodales ex dapibus accumsan feugiat non neque. Nunc ultricies nisi quis eros rutrum dapibus. Etiam vel auctor lorem. In fringilla ornare dictum. Sed semper sit amet massa ut laoreet. Curabitur molestie neque non viverra aliquet. Maecenas pellentesque libero sollicitudin ex dictum scelerisque."),
        new Paragraphe(title: "Suspendisse potenti", texte: "Aliquam pharetra neque ac nisi sagittis, et vestibulum dui pulvinar. Suspendisse id condimentum tellus, nec fringilla justo. Cras pharetra massa euismod, pellentesque est id, ultricies dui. Nullam quam purus, elementum eget purus eu, cursus sollicitudin nisl.")
      ]
  )
];
