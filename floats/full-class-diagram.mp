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

  Class.SoftwareSystem("SoftwareSystem")()("add_test()", "add_feature()", "operate()");

  Class.SoftwareProject("SoftwareProject")()("build_and_operate()");

  Class.SoftwareProjectGroup("SoftwareProjectGroup")()("build_and_operate()");

  Class.Developer("Developer")("person_time")("extend_feature()","debug()", "refactor()", );

  Class.Test("Test")()("exercise()");

  leftToRight(30)(Feature, Chunk);

  topToBottom(30)(Developer,Feature);

  leftToRight(30)(SoftwareProject,Developer);

  topToBottom(30)(Chunk,Bug);

  Test.c = (xpart Feature.c, ypart Bug.c);

  SoftwareSystem.c = (xpart SoftwareProject.c, ypart Feature.c);

  topToBottom(25)(SoftwareProjectGroup, SoftwareProject);

  drawObjects(SoftwareProject,SoftwareSystem,Developer,Feature, Chunk, Bug, Test,SoftwareProjectGroup);

  clink(association)(Feature, Chunk);

  clink(association)(Chunk, Bug);

  item(iAssoc)("*")(obj.se = Chunk.w);

  item(iAssoc)("*")(obj.se = Bug.n);

  link(association)(pathStepY(Chunk.n, Chunk.n+(50,0), 15));
  link(association)(pathStepX(Chunk.n+(50,0), Chunk.e, 00));

  item(iAssoc)("*")(obj.sw = Chunk.e);
  item(iAssoc)("dependencies")(obj.nw = Chunk.e);

  clink(associationUni)(Test,Bug);
  item(iAssoc)("*")(obj.se = Test.n);

  clink(association)(Feature,Test);
  item(iAssoc)("*")(obj.se = Bug.w);
  item(iAssoc)("*")(obj.sw = Test.e);

  clink(association)(SoftwareSystem, SoftwareProject);
  clink(association)(SoftwareSystem, Feature);
  link(associationUni)(pathStepX(SoftwareSystem.s, Test.w, 0));
  item(iAssoc)("*")(obj.se = Test.w);
  item(iAssoc)("*")(obj.se = Feature.w);

  clink(association)(SoftwareProject, Developer);
  item(iAssoc)("*")(obj.se = Developer.w);

  clink(associationUni)(SoftwareProjectGroup, SoftwareProject);
  item(iAssoc)("*")(obj.se = SoftwareProject.n);
  
endfig;

end
