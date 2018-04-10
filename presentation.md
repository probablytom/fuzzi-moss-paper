% Modelling Realistic User Behaviour in Socio-Technical System Simulation using Dynamic Code Fuzzing Aspects
%Tom Wallis and Tim Storer, School of Computing Science, University of Glasgow
% Aberystwyth, April 2018

---
header-includes:     "<style type='text/css'>.reveal h1, .reveal h2, .reveal h3 {text-transform: none;} .reveal h1 {font-size: 1.5em; } .floatleft {float: left} </style>"

---


## About me

:::::::::::::: {.columns}
::: {.column width="50%"}
contents...
:::
::: {.column width="50%"}
![](tim.jpg)
:::
::::::::::::::

----

## Designing for user in <br/> Socio-Technical Systems

:::::::::::::: {.columns}
::: {.column style="width: 60%; text-align: left"}

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
::: {.column width="60%"}

 * Idealised models are not representative
 * Stochastic models lack detail.
 * Detailed workflow models are intractable.
:::
::: {.column width="30%"}
![](ambulance.jpg)
:::
::::::::::::::

----

## Coping Strategies in Information Systems Engineering

:::::::::::::: {.columns}
::: {.column width="50%"}

 * Build, fail, rebuild
 * Trial, error and revision
 * Workarounds
:::
::: {.column width="30%"}
![](heathrow.jpg)
:::
::::::::::::::

---

## Intuition: Variability, contingency and adaption in user behaviour is a cross cutting concern.

The same causes of variability affect many different workflows, so apply their effects as fuzzing aspects to functional descriptions of workflow behaviours.

:::{.notes}
Develop a modelling technique that enables a separation of concerns between models of information systems, idealised workflows and the effect of realistic behaviour applied to those workflows..
:::

----

## Our Approach - Fuzzi Moss and Friends

---

## Case Study Selection

----

## Domain Model

---

## Modelling Predictable Domain Properties

---

## Workflow Model

---

## Workflow Modelling Example - Change Management

---

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
