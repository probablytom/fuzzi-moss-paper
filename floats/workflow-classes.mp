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

  Class.ChangeManagement("ChangeManagement")("vcs_server", "vcs_client")("resolve()", "commit_changes()", "checkout()");

  Class.Debugging("Debugging")()("debug_test()", "debug_feature()", "debug_system()");
  Class.Implementation("Implementation")()("add_chunk()", "implement_feature()", "implement_system()");
  
  Class.Refactoring("Refactoring")()("refactoring()", "refactor_feature()", "refactor_system()");
  Class.Specification("Specification")()("add_feature()", "complete_specification()");
  Class.Testing("Testing")("target_test_coverage_per_feature", "target_tests_per_chunk_ratio")(
      "add_test()", "test_per_chunk_ratio()", "complete_system_test_suite()");

  Class.Waterfall("Waterfall")("developers")("allocate_tasks()");
  Class.TestDrivenDevelopment("TestDrivenDevelopment")()("implement_feature_tdd()", "work_from_backlog()");

  leftToRight(10)(Specification, Implementation, Testing, Debugging, Refactoring);

  leftToRight(10)(Waterfall, TestDrivenDevelopment);

  Group.highLevelWorkflows(Waterfall, TestDrivenDevelopment);

  Group.mainWorkflows(Specification, Implementation, Testing, Debugging, Refactoring);

  topToBottom(30)(highLevelWorkflows,mainWorkflows, ChangeManagement);

  drawObjects(ChangeManagement, highLevelWorkflows,mainWorkflows);

  link(associationUni)(pathStepY(Waterfall.s, Specification.n, -15));
  link(associationUni)(pathStepY(Waterfall.s, Implementation.n, -15));
  link(associationUni)(pathStepY(Waterfall.s, Testing.n, -15));
  link(associationUni)(pathStepY(Waterfall.s, Debugging.n, -15));
  link(associationUni)(pathStepY(Waterfall.s, Refactoring.n, -15));

  link(associationUni)(pathStepY(TestDrivenDevelopment.s, Specification.n, -15));
  link(associationUni)(pathStepY(TestDrivenDevelopment.s, Implementation.n, -15));
  link(associationUni)(pathStepY(TestDrivenDevelopment.s, Testing.n, -15));
  link(associationUni)(pathStepY(TestDrivenDevelopment.s, Debugging.n, -15));
  link(associationUni)(pathStepY(TestDrivenDevelopment.s, Refactoring.n, -15));
 
  link(associationUni)(pathStepY(Specification.s, ChangeManagement.n, -20));
  link(associationUni)(pathStepY(Implementation.s, ChangeManagement.n, -20));
  link(associationUni)(pathStepY(Testing.s, ChangeManagement.n, -20));
  link(associationUni)(pathStepY(Debugging.s, ChangeManagement.n, -20));
  link(associationUni)(pathStepY(Refactoring.s, ChangeManagement.n, -20));
endfig;

end
