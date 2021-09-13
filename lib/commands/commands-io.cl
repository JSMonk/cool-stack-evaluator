class CommandIO inherits IO {
  converter: A2I <- new A2I;

  out_command(cmd: BaseCommand): IO {
    out_string(cmd.show())
  };

  in_command(): BaseCommand {
    let str: String <- in_string() in
      if (str = "+") then
        (new PlusCommand).init()
      else if (str = "s") then
        (new SwapCommand).init()
      else if (str = "d") then
        (new DisplayCommand).init()
      else if (str = "e") then
        (new EvalCommand).init()
      else if (str = "x") then
        (new StopCommand).init()
      else
        (new ValueCommand).setValue(converter.a2i(str))
      fi fi fi fi fi
  };
};
