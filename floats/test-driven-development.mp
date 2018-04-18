input metauml;

filenametemplate "%j-%c.eps";

prologues:= 3;

defaultfont := "t1-zi4r-7";


iClass.foreColor := white;
iClass.iName.iFont.name := "t1-zi4r-7";
iClass.iStereotypeStack.iPict.iFont.name := "t1-zi4r-7";
iClass.iMethodStack.iPict.iFont.name := "t1-zi4r-7";
iClass.iAttributeStack.iPict.iFont.name := "t1-zi4r-7";

iAssoc.iFont.name := "t1-zi4r-7";

beginfig(1);

%%%

  Begin.beginTry;
  Activity.GetUserStory("user_story = ", "product_backlog.get()");
  Activity.Implement("implement_feature_tdd");
  End.endTry;

  leftToRight(30)(beginTry, GetUserStory);
  topToBottom(30)(GetUserStory, Implement);
  leftToRight(30)(endTry, Implement);

  Group.TryBlock(beginTry, GetUserStory, Implement, endTry);
  

  SuperActivity.Try("try")(TryBlock);
  
%%%

  Begin.beginExcept;
  Activity.break("break");
  End.endExcept;

%%%

  topToBottom(30)(beginExcept, break, endExcept);
  Group.exceptBlock(beginExcept, break, endExcept);

  SuperActivity.Except("except")(exceptBlock);

%%%

  Begin.beginWorkFromBackLog;
  
  Branch.WhileTrue;

  End.endWorkFromBackLog;

  topToBottom(30)(beginWorkFromBackLog, WhileTrue, Try);

  leftToRight(30)(Try, Except, endWorkFromBackLog);

%%%
  
  drawObjects(beginWorkFromBackLog, WhileTrue, Try, Except, endWorkFromBackLog);

%%%

  clink(transition)(beginTry, GetUserStory);
  clink(transition)(GetUserStory, Implement);
  clink(transition)(Implement, endTry);

%%%

  clink(transition)(beginExcept, break);
  clink(transition)(break, endExcept);

%%%
  
  clink(transition)(beginWorkFromBackLog, WhileTrue);
  clink(transition)(WhileTrue, Try);
  clink(transition)(WhileTrue, Try);
  clink(transition)(Try, Except);

  clink(transition)(Except, endWorkFromBackLog);

  link(transition)(pathStepX(Try.w, WhileTrue.w, -10));

%%%

  item(iGuard)("[Empty]")(obj.s = 0.5[Try.e, Except.w]);
  item(iGuard)("[True]")(obj.w = 0.5[Try.n, WhileTrue.s]);

endfig;

end
