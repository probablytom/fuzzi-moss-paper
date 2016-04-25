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

  Class.Feature("Feature")("size")("extend()", "debug()", "refactor()", "operate()");

  Class.Chunk("Chunk")()("modify()", "debug()", "refactor()", "operate()");

  Class.Bug("Bug")()("manifest()");

  leftToRight(30)(Feature, Chunk);

  topToBottom(30)(Chunk,Bug);

  drawObjects(Feature, Chunk, Bug);

  clink(association)(Feature, Chunk);

  clink(association)(Chunk, Bug);

  item(iAssoc)("*")(obj.se = Chunk.w);

  item(iAssoc)("*")(obj.se = Bug.n);

  link(association)(pathStepY(Chunk.n, Chunk.n+(50,0), 30));
  link(association)(pathStepX(Chunk.n+(50,0), Chunk.e, 00));

  item(iAssoc)("*")(obj.sw = Chunk.e);
  item(iAssoc)("dependencies")(obj.nw = Chunk.e);
endfig;

end
