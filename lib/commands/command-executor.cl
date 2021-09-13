-- include "common/stack";
-- include "commands/base-command";
-- include "commands/eval-command";
-- include "commands/plus-command";
-- include "commands/stop-command";
-- include "commands/swap-command";
-- include "commands/value-command";
-- include "commands/display-command";

class CommandExecutor {
  execute(cmd: BaseCommand, stack: Stack): Object {
    case cmd of
      p:PlusCommand => handlePlus(p, stack);      
      d:DisplayCommand => handleDisplay(d, stack);      
      e:EvalCommand => handleEval(e, stack);      
      s:SwapCommand => handleSwap(s, stack);      
      i:ValueCommand => handleValue(i, stack);      
      r:Object => abort();
    esac
  };

  handlePlus(p: PlusCommand, stack: Stack): Object {
    stack.push(p)
  };

  handleSwap(s: SwapCommand, stack: Stack): Object {
    stack.push(s)
  };

  handleValue(v: ValueCommand, stack: Stack): Object {
    stack.push(v)
  };


  handleDisplay(d: DisplayCommand, stack: Stack): Object {
    stack.print(new IO)
  };

  handleStop(x: StopCommand, stack: Stack): Object {
    abort()
  };

  handleEval(e: EvalCommand, stack: Stack): Object {
    case stack.peek() of
      p:PlusCommand => { stack.pop(); executePlusOn(stack); };
      s:SwapCommand => { stack.pop(); executeSwapOn(stack); };
      e:Object => e;
    esac
  };

  executePlusOn(stack: Stack): Object {
    case stack.pop() of
      v1: ValueCommand => case stack.pop() of
        v2: ValueCommand => stack.push((new ValueCommand).setValue(v1.getValue() + v2.getValue()));
        v2: Object => abort();
      esac;
      v1: Object => abort();
    esac
  };

  executeSwapOn(stack: Stack): Object {
    case stack.pop() of
      v1: BaseCommand => case stack.pop() of
        v2: BaseCommand => {
          stack.push(v1);
          stack.push(v2);
        };
        v2: Object => abort();
      esac;
      v1: Object => abort();
    esac
  };
};