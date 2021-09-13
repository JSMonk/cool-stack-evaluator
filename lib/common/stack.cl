class Stack {
  list: List <- new List;

  peek(): Showable { list.first() };

  print(io: IO): IO { list.print(io) };

  pop(): Showable {
    let f: Showable <- list.first() in {
      list.removeFromStart();
      f;
    }
  };

  push(v: Showable): Stack {{
    list.addToStart(v);
    self;
  }};
};