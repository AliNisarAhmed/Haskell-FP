assignToGroups groups aList = zip cycledGroups aList
  where cycledGroups = cycle groups