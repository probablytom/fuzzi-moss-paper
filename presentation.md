% Modelling Realistic User Behaviour in Socio-Technical System Simulation using Dynamic Code Fuzzing Aspects
%Tom Wallis and Tim Storer, School of Computing Science, University of Glasgow
% Aberystwyth, April 2018

---
header-includes:     "<style type='text/css'>.reveal h1, .reveal h2, .reveal h3, .reveal p {text-transform: none; text-align:left} .reveal h1 {font-size: 1.5em; } .floatleft {float: left} </style>"

---


## About me

:::::::::::::: {.columns}
::: {.column width="60%"}
contents...
:::
::: {.column width="40%"}
![](tim.jpg)
:::
::::::::::::::

----

## Designing for user in <br/> Socio-Technical Systems

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

## Trying to predict the impact of user behaviour is *really hard*

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

## Coping Strategies in Information Systems Engineering

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

## Intuition: *Variability, contingency and adaption in user behaviour is a cross cutting concern.*

The same causes of variability affect many different workflows, so apply their effects as fuzzing aspects to functional descriptions of workflow behaviours.

:::{.notes}
Develop a modelling technique that enables a separation of concerns between models of information systems, idealised workflows and the effect of realistic behaviour applied to those workflows..
:::

----

## Our Approach - Fuzzi Moss and Friends

---

## Case Study Selection - Team Based Software Development

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

----

## Domain Model

<img src="floats/full-class-diagram-1.jpg" alt="" style="width: 80%;"/>

---

### Modelling Predictable Domain Properties - Debugging a Code Chunk

```
    def debug(self, random, bug=None):

        if len(self.bugs) == 0:
            return False

        if bug is None or bug not in self.bugs:
            if random.unknown_bug_should_be_removed(self):
                bug = random.choose_bug(self)
                self.bugs.remove(bug)
        elif random.known_bug_should_be_removed(self):
            self.bugs.remove(bug)

```

---

## Workflow Class Model

![](floats/workflow-classes-1.jpg)

---

## Workflow Modelling Example - Change Management

---

### ... and the code

## Workflow Modelling Example - Debugging

----

## Workflow Modelling Example - Test Driven Development

----

## Dynamic Aspect Weaving in Python

----

## Code Fuzzing

----

## Modelling Distraction

---

## Evaluation Strategy

---

## Simulation Setup

---

## No fuzzing - Commits versus Project Size

---

## No fuzzing - Mean Time to Failure versus Project Size

---

## Effect of Distraction on Feature Completion

---

## Effect of Distraction on Mean Time to Failure (Large Projects)

---

## Take away: model irregular user behaviour separately as cross cutting concerns.

Future:

 * Bigger, better case studies
 * Application of fuzzing to other representations
 * Validate models of irregular behaviour using process log data sets.

---

## Questions, Paper and Code.

Wallis, T and Storer T.  *Modelling Realistic User Behaviour in Information Systems Simulation as Fuzzing Aspects*. To Appear, CAISE 2018.

Code repositories
 * http://github.com/twsswt/theatre_ag
 * http://github.com/twsswt/pydysofu
 * http://github.com/probablytom/asp
 * http://github.com/twsswt/fuzzi-moss
 * http://github.com/twsswt/softdev-workflow
