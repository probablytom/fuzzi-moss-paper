import pydysofu
import random

class AWorkflow(object):
    def __init__(self, environment):
        self.environment = environment
    
    def a_method(self):
        self.environment.append(1)
        self.environment.append(2)
        self.environment.append(3)

environment = list()
target = AWorkflow(environment)

def shuffle_steps(steps, context):
    result = list(steps)
    random.shuffle(result)
    return result

advice = {AWorkflow.a_method: shuffle_steps}
pydysofu.fuzz_clazz(AWorkflow, advice)

target.a_method()
print environment
