input metauml;

iActivity.foreColor := white;
iActivity.iStack.iPict.iFont.name := "t1-zi4r-7";

iGuard.iFont.name := "t1-zi4r-7";

filenametemplate "%j-%c.mps";

prologues:= 3;

beginfig(1);

  Begin.b;
  
  Activity.RefactorFeature("developer","refactor");

  Branch.WorkCompleted;

  End.e;

  topToBottom(30)(b,WorkCompleted);

  topToBottom(30)(WorkCompleted, RefactorFeature);
  
  leftToRight(30)(e, WorkCompleted);

  drawObjects(b, RefactorFeature,WorkCompleted, e);

  clink(transition)(b, WorkCompleted);

  clink(transition)(RefactorFeature, WorkCompleted);

  clink(transition)(WorkCompleted, e);

  link(transition)(pathStepX(WorkCompleted.e, RefactorFeature.e, 70));

  item(iGuard)("[dependencies > target metric?]")(obj.sw = WorkCompleted.e + (0,0));
  
endfig;

end;
