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

  Class.Feature("Feature")("size")("extend()", "debug()", "refactor()", "operate()");

  Class.Chunk("Chunk")()("modify()", "debug()", "refactor()", "operate()");

  Class.Bug("Bug")()("manifest()");

  Class.SoftwareSystem("SoftwareSystem")()("add_test()", "add_feature()", "operate()");

  Class.SoftwareProject("SoftwareProject")()("deploy_and_operate()");

  Class.SoftwareProjectGroup("SoftwareProjectGroup")()("build_and_operate()");

  Class.Developer("Developer")("person_time")("extend_feature()","debug()", "refactor()", );

  Class.Test("Test")()("exercise()");

  Class.VCSServer("VCSServer")()("checkout()", "receive_commit()");

  Class.VCSClient("VCSClient")()("update()", "commit()", "resolve()");

  leftToRight(30)(Feature, Chunk);

  leftToRight(30)(SoftwareProject,Developer);

  topToBottom(30)(Chunk,Bug);

  Test.c = (xpart Feature.c, ypart Bug.c);

  leftToRight(30)(SoftwareSystem, Feature);

  topToBottom(45)(VCSClient, SoftwareSystem);

  leftToRight(30)(VCSClient, VCSServer,SoftwareProject);

  drawObjects(SoftwareProject,SoftwareSystem,Feature, Chunk, Bug, Test, VCSClient, VCSServer);

  
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

  clink(association)(SoftwareSystem, Feature);
  link(associationUni)(pathStepX(SoftwareSystem.s, Test.w, 0));
  item(iAssoc)("*")(obj.se = Test.w);
  item(iAssoc)("*")(obj.se = Feature.w);

  clink(association)(SoftwareProject, VCSServer);

  clink(association)(VCSServer, VCSClient);
  item(iAssoc)("*")(obj.sw = VCSClient.e);

  clink(associationUni)(VCSClient, SoftwareSystem);
  item(iAssoc)("working_copy")(obj.se = SoftwareSystem.n);

  link(associationUni)(pathStepY(VCSServer.s, SoftwareSystem.n + (15,0), -25));
  item(iAssoc)("master")(obj.sw = SoftwareSystem.n + (15,0));

  
endfig;

end
