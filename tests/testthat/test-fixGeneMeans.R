test_that("gene mean fixed", {
  params_celltype1 <- newSplatParams(
    batchCells = 500,
    nGenes = 10000,
    seed = 926
  )
  sim_celltype1 <- splatSimulateGroups(
    params_celltype1,
    group.prob = c(0.5, 0.5),
    de.prob = 0.002,
    verbose = FALSE
  )
  
  params_celltype2 <- newSplatParams(
    batchCells = 300,
    nGenes = 10000,
    seed = 926
  )
  sim_celltype2 <- splatSimulateGroups(
    params_celltype2,
    group.prob = c(0.7, 0.3),
    de.prob = 0.002, verbose = FALSE
  )
  
  expect_equal(
    rowData(sim_celltype1)$BaseGeneMean,
    rowData(sim_celltype2)$BaseGeneMean
  )
  
  print("\n")
  str(rowData(sim_celltype1)$BaseGeneMean)
  str(rowData(sim_celltype2)$BaseGeneMean)
})
