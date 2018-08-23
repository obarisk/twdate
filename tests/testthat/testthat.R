library(testthat)
library(twdate)

context("year_we")
test_that("year_we transcode tw year to western year", {
  expect_equal(year_we(107), 2018)
  expect_equal(year_we(0), 1911)
  expect_equal(year_we(1), 1912)
  expect_equal(year_we('108'), 2019)
})

context("year_tw")
test_that("year_tw transcode western year to tw year", {
  expect_equal(year_tw(2018), 107)
  expect_equal(year_tw(1911), 0)
  expect_equal(year_tw(1912), 1)
  expect_equal(year_tw('2019'), 108)
})

context("date_we")
test_that("date_we transcode tw date to western date", {
  expect_equal(date_we("1070101", sep=""), as.Date("2018-01-01"))
  expect_equal(date_we("105/02/29"), as.Date("2016-02-29"))
  expect_equal(date_we("104-12-31", sep="-"), as.Date("2015-12-31"))
})

context("date_tw")
test_that("date_tw transcode western date to tw date", {
  expect_equal(date_tw("2018-08-01"), "107/08/01")
  expect_equal(date_tw("2018-08-01", sep="-"), "107-08-01")
  expect_equal(date_tw("2018-08-01", sep=""), "1070801")
  expect_equal(date_tw(as.Date("20180801", format="%Y%m%d")), "107/08/01")
})
