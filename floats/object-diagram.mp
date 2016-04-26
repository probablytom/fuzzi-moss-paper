input metauml;

filenametemplate "%j-%c.mps";

prologues:= 3;

defaultfont := "t1-zi4r-7";

iInstance.foreColor := white;
iInstance.iName.iFont.name := "t1-zi4r-7";
iInstance.iAttributeStack.iPict.iFont.name := "t1-zi4r-7";

iAssoc.iFont.name := "t1-zi4r-7";

beginfig(1);
  Instance.Feature(":Feature")();

  Instance.ChunkA(":Chunk")();

  Instance.ChunkB(":Chunk")();

  Instance.Bug(":Bug")();

  leftToRight(30)(ChunkA, ChunkB);

  Group.Chunks(ChunkA, ChunkB);

  topToBottom(30)(Feature, Chunks);

  topToBottom(30)(ChunkB, Bug);

  drawObjects(Feature, Chunks, Bug);

  clink(association)(Feature, ChunkA);
  clink(association)(Feature, ChunkB);
  clink(association)(ChunkB, Bug);
endfig;

end
