filenametemplate "%j-%c.eps";

input boxes;

prologues:= 3;

input exteps;

input TEX;

verbatimtex
  \documentclass{article}
  \include{graphicx}
\newcommand{\BoxLabel}[2][75pt]{\parbox[t][25pt][c]{#1}{\centering\sf  #2}}

\newcommand{\LargeBoxLabel}[2][100pt]{\parbox[t][45pt][c]{#1}{\centering\sf  #2}}\begin{document}
etex

TEXPOST("\end{document}");


beginfig(1);

 % begineps "floats/full-class-diagram-1.eps";
 % endeps;

  boxit.ProblemDomainModel(btex \LargeBoxLabel{Problem Domain Model} \includegraphics{floats/full-class-diagram-1} etex);

  boxit.WorkflowModel(btex \begin{tabular}{c} Workflow model \\ x \end{tabular}  etex);

  boxit.VariableUserBehaviour(btex \begin{tabular}{c} External \\ Customer \end{tabular} etex);

 
  WorkflowModel.w = ProblemDomainModel.e + (30, 0);
  VariableUserBehaviour.w = WorkflowModel.e + (30, 0);
 
 
  drawboxed(ProblemDomainModel, WorkflowModel, VariableUserBehaviour);
    
  drawdblarrow (ProblemDomainModel.e -- WorkflowModel.w);

  drawdblarrow (WorkflowModel.e -- VariableUserBehaviour.w);


endfig;

end



end
