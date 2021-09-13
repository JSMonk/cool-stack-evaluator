-- include "common/showable";

class BaseCommand inherits Showable {
  name: String; 

  init() : BaseCommand { setName("") };

  show(): String { name };

  setName(n: String): BaseCommand {{
    name <- n;
    self;
  }};
};