-- include "common/showable";
-- include "commands/base-command";

class PlusCommand inherits BaseCommand {
  init(): BaseCommand { setName("+") };
};
