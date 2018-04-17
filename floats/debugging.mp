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

  Begin.beginChangeManagement;

  Branch.WhileTrue;

  End.endChangeManagement;

%%%

  Begin.beginTry;
  
  Activity.UpdateA("update");

  Activity.Commit("commit");

  Activity.Break("break");

  End.endTry;

  leftToRight(30)(beginTry, Commit);
  topToBottom(30)(Commit, UpdateA, Break);
  leftToRight(30)(endTry,Break);
  
  Group.TryBlock(beginTry, Commit, UpdateA, Break, endTry);

  SuperActivity.Try("try")(TryBlock);

%%%

  Begin.beginExcept;

  Activity.UpdateB("update");

  Branch.ForConflict;
  
  Activity.Resolve("resolve");

  End.endExcept;

  topToBottom(30)(UpdateB, ForConflict, Resolve);

  leftToRight(30)(beginExcept, UpdateB);
  leftToRight(30)(endExcept, ForConflict);

  Group.ExceptBlock(beginExcept, UpdateB, ForConflict, Resolve, endExcept);

  ExceptBlock.info.right := 20;
  ExceptBlock.info.left := 30;
  
  SuperActivity.Except("except")(ExceptBlock);

%%%

  leftToRight(30)(beginChangeManagement, WhileTrue);

  topToBottom(30)(WhileTrue, Try, endChangeManagement);

  leftToRight(60)(Try,Except);

  drawObjects(beginChangeManagement, WhileTrue, Try, Except, endChangeManagement);

%%%

  clink(transition)(beginChangeManagement, WhileTrue);

  clink(transition)(WhileTrue, Try);

  clink(transition)(Try, Except);

  clink(transition)(Try, endChangeManagement);
      

%%%
  
  clink(transition)(beginTry, Commit);

  clink(transition)(Commit, UpdateA);

  clink(transition)(UpdateA, Break);

  clink(transition)(Break, endTry);


%%%

  clink(transition)(beginExcept, UpdateB);

  clink(transition)(UpdateB, ForConflict);

  clink(transition)(ForConflict)(Resolve);

  clink(transition)(ForConflict, endExcept);

  link(transition)(pathStepX(Resolve.e, ForConflict.e, 15));

  link(transition)(pathManhattanY(Except.n, WhileTrue.e));


  item(iGuard)("[True]")(obj.w = 0.5[WhileTrue.s, Try.n]);

  item(iGuard)("[for each conflict]")(obj.e = 0.5[ForConflict.s, Resolve.n]);

  item(iGuard)("[VCSException]")(obj.s = 0.5[Try.e, Except.w]);

endfig;

end
