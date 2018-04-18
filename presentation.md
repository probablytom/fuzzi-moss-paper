% Modelling Realistic User Behaviour in Socio-Technical System Simulation using Dynamic Code Fuzzing Aspects
%Tom Wallis and Tim Storer, School of Computing Science, University of Glasgow
% Aberystwyth, April 2018

---
header-includes:     "<style type='text/css'>.reveal section {text-align: left} .reveal h1, .reveal h2, .reveal h3, .reveal p {text-transform: none; text-align:left} .reveal h1 {font-size: 1.5em; } .floatleft {float: left} .reveal code {font-size: 14pt} </style>"

---

# About me

:::::::::::::: {.columns}
::: {.column width="60%"}
contents...
:::
::: {.column width="40%"}
![](tim.jpg)
:::
::::::::::::::

----

# Designing for user in <br/> Socio-Technical Systems

:::::::::::::: {.columns}
::: {.column style="width: 60%; text-align: left; float: left"}

Users really *are* the problem. Behaviour is:

 * Diverse, driven by different capabilities and expectations of systems.
 * Contingent on wider environmental factors.
 * Adaptive and evolutionary.

:::
::: {.column width="30%"}
![](ecounting.jpg)
:::
::::::::::::::

----

# Trying to predict the impact of user behaviour is *really hard*

:::::::::::::: {.columns}
:::{.column style="width: 60%; text-align: left; float: left"}

 * Idealised models miss vital nuance in real world behaviour.
 * Stochastic models depend on behaviour being homogeneous.
 * Detailed workflow models quickly become intractable.
:::
::: {.column width="30%"}
![](ambulance.jpg)
:::
::::::::::::::

----

# Coping Strategies in Information Systems Engineering

:::::::::::::: {.columns}
::: {.column style="width:40%; text-align: left; float: left"}

 * Build, fail, rebuild
 * Trial, error and revision
 * Workarounds
:::
::: {.column tyle="width:55%; text-align: left; float: left"}
![](heathrow.jpg)
:::
::::::::::::::

---

# Intuition: *Variability, contingency and adaption in user behaviour is a cross cutting concern.*

The same causes of variability affect many different workflows, so apply their effects as fuzzing aspects to functional descriptions of workflow behaviours.

:::{.notes}
Develop a modelling technique that enables a separation of concerns between models of information systems, idealised workflows and the effect of realistic behaviour applied to those workflows..
:::

----

# Our Approach - Fuzzi Moss and Friends

---

# Case Study Selection - Team Based Software Development

:::::::::::::: {.columns}
:::{.column style="width: 50%; text-align: left; float: left; font-size:24pt"}

 * Actors have different roles
 * Development work coordinated around a centralised VCS.
 * Well defined ideal workflows, but with potential for variability
 * Different coordination workflows possible
 * Limited empirical evidence as to efficacy of different workflows [George & Williams,Israilidis et al., Bhat, T. & Nagappan].

:::
:::{.column style="width: 45%; text-align: center; float: right"}
![](agile.png)
:::
::::::::::::::

:::{.notes}

 * developer, project manager
 * change management, specification, implementation, testing, debugging, refactoring
 * Waterfall, TDD

:::

---

<section>
<h1>The Domain Model of a Software Project</h1>
<img src="floats/full-class-diagram-1.jpg" alt="" style="width: 70%;"/>
</section>

<section>
<h3>Modelling Predictable Domain Properties - Debugging a Code Chunk</h3>

```{.python}
class Chunk(object):

    def debug(self, random, bug=None):

        if len(self.bugs) == 0:
            return False

        if bug is None or bug not in self.bugs:
            if random.unknown_bug_should_be_removed(self):
                bug = random.choose_bug(self)
                self.bugs.remove(bug)
        elif random.known_bug_should_be_removed(self):
            self.bugs.remove(bug)
            
    #...

```
</section>

---

# Workflow Class Model

<img src="floats/workflow-classes-1.jpg" alt="" style="width: 100%;"/>

---

<section>
<h1>Workflow Modelling Example - Change Management</h1>
<img src="floats/change-management-1.jpg" alt="" style="width: 60%;"/>
</section>

<section>
<h3> ... and the code</h3>

```{.python}
class ChangeManagement(object):

    # ...

    def commit_changes(self, random):
        while True:
            try:
                self.centralised_vcs_client.commit()
                self.centralised_vcs_client.update(random)
                break
            except CentralisedVCSException:
                self.centralised_vcs_client.update(random)
                for conflict in self.centralised_vcs_client.conflicts:
                    self.resolve(conflict, random)


```
</section>

---

<section>
<h1>Workflow Modelling Example - Debugging</h1>
<img src="floats/debugging-1.jpg" alt="" style="width: 80%;"/>
</section>

<section>
<h3>... and the code </h3>

```{.python}
class Debugging(object):

	#...
	
    def debug_test(self, test, random):
        while True:
            try:
                test.exercise()
                break
            except BugEncounteredException as e:
                self.debug(test.feature, e.bug, random)
                self.change_management.commit_changes(random)

```
</section>

----


<section>
<h1>Workflow Modelling Example - <br/>Test Driven Development</h1>
<img src="floats/test-driven-development-1.jpg" alt="" style="width: 70%;"/>
</section>

<section>
<h3>... and the code </h3>

```{.python}
class TestDrivenDevelopment(object):

	#...

    def implement_feature_tdd(self, user_story, random):
        self.specification.add_feature(user_story.logical_name, user_story.size)
        self.testing.test_per_chunk_ratio(user_story.logical_name)
        self.implementation.implement_feature(user_story.logical_name)
        self.debugging.debug_feature(user_story.logical_name)
        self.refactoring.refactor_feature(user_story.logical_name)

    def work_from_backlog(self, product_backlog, random):
        while True:
            try:
                user_story = product_backlog.get(block=False)
                self.implement_feature_tdd(user_story, random)
            except Empty:
                break

```
</section>

----

# Aspect Weaving in Python

 * Desirable to separate idealised workflows and effects of realistic behaviour as a cross cutting concern.
 * Aspects allow for *quantification* and *obliviousness*.
 * Our implementation in Python: Asp


# Aspect Weaving Implementation

<section>
1. Replace the `object.__get_attribute__()` method to intercept all method invocations, to define an anonymous `wrap` function as substitute for the target method:

```{.python}
def weave_clazz(clazz, advice):

    def __weaved_getattribute__(self, item):
        attribute = object.__getattribute__(self, item)

            def wrap(*args, **kwargs):
            
            #...

            return wrap

    clazz.__getattribute__ = __weaved_getattribute__
```

</section>

<section style="text-align:left">

2. In `wrap`, retrieve *advice* for a target method from a user supplied dictionary:

```{.python}
            def wrap(*args, **kwargs):

                reference_function = attribute.im_func
                # Ensure that advice key is unbound method for instance methods.
                advice_key = getattr(attribute.im_class, attribute.func_name)

                aspect = advice.get(advice_key, identity)
```
</section>

<section>
3. In `wrap`, apply an aspect *prelude* to the target method and context:

```{.python}
            def wrap(*args, **kwargs):

                reference_function = attribute.im_func
                # Ensure that advice key is unbound method for instance methods.
                advice_key = getattr(attribute.im_class, attribute.func_name)

                aspect = advice.get(advice_key, identity)
                
                aspect.prelude(attribute, self, *args, **kwargs)
```

</section>

<section>
4. In `wrap`, execute the target method:

```{.python}
            def wrap(*args, **kwargs):

                reference_function = attribute.im_func
                # Ensure that advice key is unbound method for instance methods.
                advice_key = getattr(attribute.im_class, attribute.func_name)

                aspect = advice.get(advice_key, identity)
                
                aspect.prelude(attribute, self, *args, **kwargs)
                result = reference_function(*args, **kwargs)

```

</section>

<section>
5. In `wrap`, apply an aspect *encore* to the method, context and any return value, then return the result.

```{.python}
            def wrap(*args, **kwargs):

                reference_function = attribute.im_func
                # Ensure that advice key is unbound method for instance methods.
                advice_key = getattr(attribute.im_class, attribute.func_name)

                aspect = advice.get(advice_key, identity)
                
                aspect.prelude(attribute, self, *args, **kwargs)
                result = reference_function(*args, **kwargs)
                return aspect.encore(attribute, self, result)
                
```

</section>


# Altering Workfows with Dynamic Code Fuzzing using PyDySoFu

An *aspect prelude* that alters a reference representation of a function's abstract syntax tree each time the function is invoked. 

---

# A simple example -<br/> [washing your hands](https://github.com/twsswt/pydysofu/blob/master/tutorial.ipynb)

<section>
```{.python}
class Hands(object):
    def __init__(self):
        self.clean = False
        self.soaped = False
        
class GetDirtyWorkflow(object):
    
    is_workflow = True
    
    def __init__(self, washable):
        self.washable = washable
        
    def dirty(self):
        self.washable.clean = False
        self.washable.soaped = False

class RinseWorkflow(object):

    is_workflow = True

    def __init__(self, washable):
        self.washable = washable

    def rinse(self):
        self.washable.soaped = False


class WashWorkflow(object):

    is_workflow = True

    def __init__(self, washable):
        self.washable = washable
        self.rinse = RinseWorkflow(washable)

    def add_soap(self):
        self.washable.soaped = True

    def scrub(self):
        if self.washable.soaped:
            self.washable.clean = True

    def wash(self):
       self.add_soap()
       self.scrub()
       self.rinse.rinse()
       
from pydysofu import fuzz_clazz
from pydysofu.core_fuzzers import shuffle_steps

advice = {
    WashWorkflow.wash: shuffle_steps
}
fuzz_clazz(WashWorkflow, advice)

hands = Hands()
get_dirty_workflow = GetDirtyWorkflow(hands)
wash_workflow = WashWorkflow(hands)

for _ in range(0, 10):
    get_dirty_workflow.dirty()
    wash_workflow.wash()
    print hands.clean
```
</section>

<section>
The output is something like:

```
True
False
True
True
False
False
True
False
False
False
```
</section>



# Implementation in PyDySoFu

<section>
 1. In the prelude, retrieve the appropriate fuzzing function from a dictionary and invoke `fuzz function`:

 ```{.python}
 
 class FuzzingAspect(IdentityAspect):
     def prelude(self, attribute, context):
        reference_function = attribute.im_func
        advice_key = getattr(attribute.im_class, attribute.func_name)

        fuzzer = self.fuzzing_advice.get(advice_key, identity)
        fuzz_function(reference_function, fuzzer, context)
 ```

</section>

<section>

2. In `fuzz_function` Recover the source code for a target method, build a copy of it's AST and pass to a visitor:

 ```{.python style="font-size: 24pt"}
 def fuzz_function(reference_function, fuzzer, context):
    func_source = inspect.getsourcelines(reference_function)[0]
    reference_syntax_tree = ast.parse(''.join(func_source))

    fuzzed_syntax_tree = copy.deepcopy(reference_syntax_tree)
    workflow_transformer = WorkflowTransformer(fuzzer=fuzzer, context=context)
    workflow_transformer.visit(fuzzed_syntax_tree)
 ```

</section>

<section>
3. In the visitor, extract the body of a function and apply the fuzzer:

```{.python}
    def visit_FunctionDef(self, node):
        result = self.generic_visit(node)
        node.body = self.fuzzer(node.body, self.context)
        return result
```

</section>


<section>
5. Compile the fuzzed AST and replace the target function's code object.

```{.python}
def fuzz_function(reference_function, fuzzer=identity, context=None):
    reference_syntax_tree = get_reference_syntax_tree(reference_function)

    fuzzed_syntax_tree = copy.deepcopy(reference_syntax_tree)
    workflow_transformer = WorkflowTransformer(fuzzer=fuzzer, context=context)
    workflow_transformer.visit(fuzzed_syntax_tree)

    compiled_module = compile(fuzzed_syntax_tree, '<potentially custom>', 'exec')
    reference_function.func_code = compiled_module.co_consts[0]


```

</section>

---

# Modelling Distraction

Projects)

---

# Case Study Experimental Setup

# Results

#

# Take away: model irregular user behaviour separately as cross cutting concerns.

Future:

 * Bigger, better case studies
 * Application of fuzzing to other representations
 * Validate models of irregular behaviour using process log data sets.

---

# Questions, Paper and Code.

Wallis, T and Storer T.  *Modelling Realistic User Behaviour in Information Systems Simulation as Fuzzing Aspects*. To Appear, CAISE Forum 2018.

Code repositories:

 * [http://github.com/twsswt/theatre_ag](http://github.com/twsswt/theatre_ag)
 * [http://github.com/twsswt/pydysofu](http://github.com/twsswt/pydysofu)
 * [http://github.com/probablytom/asp]([http://github.com/probablytom/asp)
 * [http://github.com/twsswt/fuzzi-moss](http://github.com/twsswt/fuzzi-moss)
 * [http://github.com/twsswt/softdev-workflow](http://github.com/twsswt/softdev-workflow)



