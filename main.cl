-- include "common/stack";
-- include "command/command-io";
-- include "command/command-executor";

class Main {
  io: CommandIO <- new CommandIO;
  stack: Stack <- new Stack;
  executor: CommandExecutor <- new CommandExecutor;

  main(): Object {
    while(true) loop
      executor.execute(io.in_command(), stack)
    pool
  };
};
