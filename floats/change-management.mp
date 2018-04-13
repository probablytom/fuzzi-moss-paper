input metauml;

filenametemplate "%j-%c.mps";

prologues:= 3;

defaultfont := "t1-zi4r-7";


iClass.foreColor := white;
iClass.iName.iFont.name := "t1-zi4r-7";
iClass.iStereotypeStack.iPict.iFont.name := "t1-zi4r-7";
iClass.iMethodStack.iPict.iFont.name := "t1-zi4r-7";
iClass.iAttributeStack.iPict.iFont.name := "t1-zi4r-7";

iAssoc.iFont.name := "t1-zi4r-7";

beginfig(1);

  Begin.b;

  Branch.WhileTrue;

  Branch.Try;

  Activity.updateA("update");

  Activity.updateB("update");

  Branch.ForConflict;

  Activity.resolve("Resolve");

endfig;

end
