input metauml;

iActivity.foreColor := white;
iActivity.iStack.iPict.iFont.name := "t1-zi4r-7";

iGuard.iFont.name := "t1-zi4r-7";

filenametemplate "%j-%c.mps";

prologues:= 3;

beginfig(1);

  Begin.b;
  
  Activity.AddFeature("add","feature");

  Activity.EnsureSufficientTests("ensure","sufficient","tests");

  Activity.CompleteFeature("complete","feature");

  Activity.RefactorFeature("refactor","feature");

  Branch.WorkCompleted;

  End.e;

  topToBottom(30)(b,WorkCompleted);

  topToBottom(30)(WorkCompleted, RefactorFeature);

  topToBottom(30)(AddFeature, EnsureSufficientTests);

  leftToRight(30)(CompleteFeature, EnsureSufficientTests);

  topToBottom(30)(RefactorFeature, CompleteFeature);

  leftToRight(30)(e, WorkCompleted);

  drawObjects(b, AddFeature, EnsureSufficientTests, CompleteFeature,
      RefactorFeature,WorkCompleted, e);

  clink(transition)(b, WorkCompleted);

  clink(transition)(AddFeature, EnsureSufficientTests);

  clink(transition)(EnsureSufficientTests, CompleteFeature);

  clink(transition)(CompleteFeature, RefactorFeature);

  clink(transition)(RefactorFeature, WorkCompleted);

  clink(transition)(WorkCompleted, e);

  link(transition)(pathStepY(WorkCompleted.e, AddFeature.n, 0));

  item(iGuard)("[more features?]")(obj.sw = WorkCompleted.e + (20,0));
  
endfig;

end;
