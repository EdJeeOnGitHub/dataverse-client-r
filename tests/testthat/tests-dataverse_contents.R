# See https://demo.dataverse.org/dataverse/dataverse-client-r

test_that("dataverse root", {
  testthat::skip_if_offline("demo.dataverse.org")
  expected_length_minimum <- 300 # 397 as of Feb 2020

  dv      <- get_dataverse(dataverse = ":root")
  actual  <- dataverse_contents(dv)
  expect_gte(length(actual), expected_length_minimum)
})

test_that("dataverse for 'dataverse-client-r'", {
  testthat::skip_if_offline("demo.dataverse.org")
  expected  <- structure(
    list(
      id = 1734004L,
      identifier = "FK2/HXJVJU",
      persistentUrl = "https://doi.org/10.70122/FK2/HXJVJU",
      protocol = "doi",
      authority = "10.70122",
      publisher = "Demo Dataverse",
      publicationDate = "2020-12-29",
      storageIdentifier = "file://10.70122/FK2/HXJVJU",
      type = "dataset"
    ),
    class = "dataverse_dataset"
  )

  dv      <- get_dataverse(dataverse = "dataverse-client-r")
  actual    <- dataverse_contents(dv)
  ds_index  <- which(sapply(actual, function(x) x$identifier) == "FK2/HXJVJU")
  expect_equal(actual[[ds_index]], expected)
})
