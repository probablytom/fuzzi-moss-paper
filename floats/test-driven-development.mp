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

  Begin.beginDebug;

  Branch.WhileTrue;

  End.endDebug;

%%%

  Begin.beginTry;
  
  Activity.testExercise("exercise","test");

  Activity.Break("break");

  End.endTry;

  leftToRight(30)(beginTry, testExercise);
  topToBottom(30)(testExercise, Break);
  leftToRight(30)(endTry,Break);
  
  Group.TryBlock(beginTry, testExercise, Break, endTry);

  SuperActivity.Try("try")(TryBlock);

%%%

  Begin.beginExcept;

  Activity.Debug("debug");
  
  Activity.Commit("commit");

  End.endExcept;

  topToBottom(30)(Debug, Commit);

  leftToRight(30)(beginExcept, Debug);
  leftToRight(30)(endExcept, Commit);

  Group.ExceptBlock(beginExcept, Debug, Commit, endExcept);

  ExceptBlock.info.right := 20;
  ExceptBlock.info.left := 30;
  
  SuperActivity.Except("except")(ExceptBlock);

%%%

  leftToRight(30)(beginDebug, WhileTrue);

  topToBottom(30)(WhileTrue, Try, endDebug);

  leftToRight(60)(Try,Except);

  drawObjects(beginDebug, WhileTrue, Try, Except, endDebug);

%%%

  clink(transition)(beginDebug, WhileTrue);

  clink(transition)(WhileTrue, Try);

  clink(transition)(Try, Except);

  clink(transition)(Try, endDebug);
      
  link(transition)(pathManhattanY(Except.n, WhileTrue.e));
%%%
  
  clink(transition)(beginTry, testExercise);

  clink(transition)(testExercise, Break);

  clink(transition)(Break, endTry);


%%%

  clink(transition)(beginExcept, Debug);

  clink(transition)(Debug, Commit);

  clink(transition)(Commit, endExcept);

%%%




  item(iGuard)("[True]")(obj.w = 0.5[WhileTrue.s, Try.n]);

  item(iGuard)("[BugEncounteredException]")(obj.s = 0.5[Try.e, Except.w]);

endfig;

end
