-- include "common/showable";
-- include "commands/base-command";

class DisplayCommand inherits BaseCommand {
  init(): BaseCommand { setName("d") };
};
