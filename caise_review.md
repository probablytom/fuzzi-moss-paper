First reviewer's review:
 
          >>> Summary of the submission <<<
 
The paper presents an approach for fuzzing of user behavior in the use of
information systems and claims that this will lead to improvements of the
modeling of user behavior used in the simulation of information systems (e.g.
workflows). This idea is shown in a case study comparing 2 software development
methods by simulation.
 
          >>> Evaluation <<<
 
In favor:
The introduction of the aspect of fuzzing in the modeling of user behavior in
information systems appears to be novel and could lead to improved IS designs
and better evaluation of IS designs.
Against:
I have severe reservations against the method applied.
- The hypothesis is not clearly and explicitly stated.
- The results are only shown in some plots.
- No tests concerning statistical significance were undertaken.
- The domain taken for the case study is lacking a good evidence basis. (As
written in the paper: “However, in the context of the case study, limited
empirical evidence does exist, …”
This is problematic, as we would like to know, whether introducing fuzzing
leads to better simulations in terms of higher conformance of the simulation
results with the actual behavior of the simulated system. The experiment
setting, however, tests whether the results of simulations of two systems
(software development methods in this case) differ when fuzzing is applied.
The question remains why this particular (quite special) application domain is
chosen and not another domain for which empirical data are available, in
particular as there are now several corpora of process logs (for process
mining) available which cover much more varied application domains of
information systems than the very special case of software development. This is
in particular noteworthy, as in the first sections process modelling (BPMN,
YAWL, etc.) are prominently discussed.
 
*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*
 
Second reviewer's review:
 
          >>> Summary of the submission <<<
 
The paper suggests an approach for explicating assumptions about the behavior
of human users who (collaboratively) interact with information systems. This
allows to simulate the use of information systems by human users, even in use
case scenarios in which the users or the systems show unforeseen behavior that
does not comply with the intentions of the system developers. In the presented
solution, assumptions about user behavior are captured as individual aspects
that are applied to modify ideal workflow models. The modified workflow models
then get executed to simulate the effects of the modeled human user behavior in
interaction with the information systems. Such an approach allows to gain more
insight about socio-technical systems formed by humans and information systems,
than it is possible with traditional research methods.
 
Sect. 1 motivates the demand for research in this field and presents the key
ideas to be elaborated. In Sect. 2 related work is discussed. Sect. 3
introduces an example case study in the domain of collaborative software
development, which is used as the basis for presenting the elaboration of the
approach in Sect. 4. An evaluation is given in Sect. 5, which consists of the
comparison of simulation runs for simulated waterfall versus test-based
development approaches in the example domain. Final conclusions of the paper
are summarized in Sect. 6.
 
          >>> Evaluation <<<
 
The research demand for developing a simulation method for human interaction
with information systems is well justified in the introductory section, e. g.,
by stating that “systems engineers lack the tools and methods to efficiently
model and accurately simulate the interaction between the information systems
and their organisational context” (p. 1).
 
The approach, which suggests to explicate human behavior as aspects that cause
modifications to ideal workflow models, is clearly presented and appears
plausible. Its presentation is supplemented by a prototypical implementation,
which is well reflected upon. The key idea of the approach is clearly pointed
out and appears feasible: to “propose and demonstrate the separate modelling
of behavioral irregularities from workflows themselves, showing that they can
be represented as cross-cutting concerns which can be applied to an idealised
workflow model” (p. 2). It can be questioned, whether user behavior is
actually “modeled” as the paper states, because the aspects to be developed
as formal explication of behavior are conceptualized in natural language, and
are implemented in the prototype using a programming language (see Fig. 3, p.
9). There is no separate modeling language involved. But speaking of
“modeling” is mainly a terminological question about how wide to understand
the term “model”; indeed one could argue that programs are models as well.
 
The paper explicates its research contributions clearly, which in the first
place is to develop “[a] method for simulating user interactions with
information systems that allows for the separate modelling of idealised
descriptions of workflows and the effects of irregularities on those
workflows” (p. 2). As a second contribution, “[a] demonstration of the
efficacy of the approach in a case study comparison of Test Driven Development
(TDD) and Waterfall software development” (p. 3) is mentioned. Given that the
first contribution already implies the conceptualization and realization of a
remarkable piece of research, the second contribution is comparably weak and is
not independent from the first one. It rather serves as an evaluation of the
developed approach. As the main contribution is already good enough for one
paper, the paper could be more focused and concentrate on this, and more
modestly treat the second point as an evaluation step and not as an independent
scientific contribution.
 
Related work is sufficiently reviewed, and the elaboration performed in the
paper is properly put in relation to existing approaches.
 
Only a few ideas seem to not have been thought over yet. For example, if in
real-world applications of the approach multiple kinds of user behavior aspects
were used, instead of the single “distraction” aspect presented in the
paper, how would interdependencies among multiple aspects have to be handled?
Most likely, the order of applying fuzzing aspects would have an influence on
the results, and there may be unwanted amplification or compensation
side-effects when multiple fuzzing aspects are used. These questions could have
been mentioned as future work which hopefully will be done as a succession to
this work.
 
The example scenario that is used for the case study is well motivated and uses
elements which are well-known to experts in the information systems discipline.
This way, the example is speaking and does not distract from the core
elaboration of the topic. In addition, the source code of the presented
prototype implementation is available via Github, which supports the
credibility of the presented work.
 
The evaluation of the developed approach consciously mentions that
“Evaluating the correctness of simulation techniques intended for large scale
systems is notoriously difficult, since the usual rationale for developing the
simulation is the lack of available empirical observations of the real world
phenomena” (p. 10). On the background of this careful warning, it is
convincingly made evident with the help of data visualizations that a
test-driven software development approach is more resilient to distracted
developers than a waterfall approach (Fig. 5, p. 12). In addition, it is
illustrated that under ideal behavior conditions, both approaches show
comparable results (Fig. 4, p. 11).
Unfortunately, the paper lacks some scientific reflection about these findings
and does not entirely made clear, why the observed results support
plausibility, and why not other relations could have been chosen to be visually
shown. This could be discussed more in-depth. Also, detail results could more
thoroughly be interpreted, e. g. “The decline in feature implementation when
either workflow is fuzzed appears to be highly linear” (p. 12): Why is this
so, and what meaning can be interpreted into this?
 
The conclusion briefly summarizes the achieved results of the paper, which on
their own already make up a quality paper that is good enough to be published.
But the conclusion goes even further and puts the achieved results in the light
of a broader research agenda which aims “towards simulation techniques that
can have predictive capabilities suitable for informing systems engineering
decisions” (p. 13). Indeed, this is a reasonable prospect and scientifically
very attractive. Besides its methodical contributions, the paper thus also
serves as a proof-of-concept on the methodological level and introduces a new
scientific perspective on the interaction of human users with information
systems.
 
The paper uses a very elaborated English language that is very well readable.
No grammatical flaws or relevant spelling mistakes were found by the reviewer.
(Only tiny spelling inconsistencies, such as “out perform” (p. 12, l. 2),
which is typically written as one word.) The reference to “Figure 5” in the
last sentence of the second paragraph on p. 12 is probably intended to
specifically point to Fig. 5b, because Fig. 5a does not show that “both SDLC
workflows appear to be largely immune to distraction up to the removal of
approximately 100 statements” (p. 12). The boxes around source code figures
do not have fully solid lines, which is most likely a LaTeX issue that can be
resolved.
 
*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*
 
Third reviewer's review:
 
          >>> Summary of the submission <<<
 
The paper proposes an approach to model ideal user behaviour as workflows, and
introduces irregularities in that behaviour as aspects which fuzz the model.
The approach is illustrated by an application to a case study of software
development workflows.
 
          >>> Evaluation <<<
 
The paper addresses a relevant and practical problem. The approach is
illustrated by means of an example that helps to better understand it. A huge
effort is put on the evaluation of the proposed approach.
 
I have serious concerns regarding the usability in practice of workflows by
means of Python, as proposed in the paper (see Section 3). In fact, with this
approach, most of the details of the workflow are hidden into implementation
details that make difficult to understand the overall flow structure.
 
It is also hard to guess how many "irregularities" will take place in practical
situations and how can they be modeled according to the proposal. Is this
actually scalable? How do we make sure that the designer does not introduce any
mistake while specifying this aspect?
 
There is no formal definition of the models to be specified nor of the
techniques used to interrupt the invocation of workflow task methods in the
background during the execution of the simulation. That makes difficult to
assess the significance of the contribution of the paper. In fact, only two
pages (out of fifteen) are devoted to explain how to model irregularities,
which is the most important novelty of the paper.
 
*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*=--=*