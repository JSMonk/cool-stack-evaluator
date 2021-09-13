class ListItem {
  value: Showable;
  next: ListItem;

  isNil(): Bool { false };

  getValue(): Showable { value };
  setValue(v: Showable): Object { new Nil };
  
  getNext(): ListItem { next };
  setNext(n: ListItem): Object { new Nil };
};

class Nil inherits ListItem {
  isNil(): Bool { true };
};

class Value inherits ListItem {
  init(v: Showable, n: ListItem): Value {{
    value <- v;
    next <- n;
    self;
  }};

  getValue() : Showable { value };
  setValue(v: Showable): Object { value <- v };

  getNext() : ListItem { next };
  setNext(n: ListItem): Object { next <- n };
};

class List {
  head: ListItem <- new Nil;
  end: ListItem <- head;

  newValue(value: Showable, next: ListItem): Value {
    (new Value).init(value, next)
  };

  isEmpty(): Bool { 
    case head of
      v:Nil => true;
      v:Value => false;
    esac
  };

  first(): Showable {
    if (head.isNil()) then {
      abort();
      head.getValue();
    } else
      head.getValue()
    fi
  };

  addToStart(v: Showable): List {{
    if (head.isNil()) then {
        head <- newValue(v, head);
        end <- head;
    } else
        head <- newValue(v, head)
    fi;
    self;
  }};

  removeFromStart(): List {
    if (head.isNil()) then
      self
    else { 
      head <- head.getNext();
      self;
    } fi
  };


  print(io: IO): IO {
    let curr: ListItem <- head in {
      while (not curr.isNil()) loop {
        io.out_string(curr.getValue().show());
        io.out_string(" <- ");
        curr <- curr.getNext();
      } pool;
      io.out_string("nil\n");
    }
  };
};
