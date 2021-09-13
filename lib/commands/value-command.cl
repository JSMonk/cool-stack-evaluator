-- include "common/atoi";
-- include "common/showable";
-- include "commands/base-command";

class ValueCommand inherits BaseCommand {
  value: Int;
  converter: A2I <- new A2I;

  getValue(): Int { value };
  setValue(v: Int): BaseCommand {{
    value <- v;
    setName(converter.i2a(v));
  }};
};
