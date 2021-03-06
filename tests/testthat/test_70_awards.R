# test_70_awards.R
# Version 2.0.1
#
# By default, these tests run locally, without making HTTP connections to the
# FIRST API server. To run test that firstapiR connects to the FIRST API
# server, create character vectors named "username" and "key" in the console
# and set their values to the username and key assigned to you by FIRST. Then
# run the tests from the console using testthat::test_dir() or
# testthat::test_file().


context("firstapiR Awards Functions")

sess_http_valid <- FALSE
sess_local <- GetSession("username", "key", "2016")
if(exists("username") & exists("key")) {
  sess_http <- GetSession(username, key, "2016")
  sess_http_valid <- TRUE
}

# GetAwards() ==================================================================
test_that("GetAwards() returns a local data frame", {
  awards <- GetAwards(sess_local, event = "PNCMP")

  expect_is(awards, "Awards")
  expect_equal(attr(awards, "url"),
               "https://frc-api.firstinspires.org/v2.0/2016/awards/PNCMP")
  expect_equal(nrow(awards), 56)
  expect_equal(length(awards), 10)
  expect_equal(names(awards), c("awardId", "teamId", "eventId",
                                "eventDivisionId", "eventCode", "name",
                                "series", "team", "fullTeamName",
                                "person"))
})


test_that("GetAwards team argument via HTTP", {
  if(!sess_http_valid) skip("No username or authorization key")

  awards <- GetAwards(sess_http, event = "ARCHIMEDES", team = 180)
  expect_equal(nrow(awards), 1)
})

test_that("GetAwards throws errors for incorrect arguments", {
  expect_error(GetAwards(sess_local),
               "You must specify either a team number or event code")
})


# GetAwardsList() ==============================================================
test_that("GetAwardsList() returns a data frame", {
  alist <- GetAwardsList(sess_local)

  expect_is(alist, "AwardsList")
  expect_equal(attr(alist, "url"),
               "https://frc-api.firstinspires.org/v2.0/2016/awards/list")
  expect_equal(nrow(alist), 92)
  expect_equal(length(alist), 4)
  expect_equal(names(alist), c("awardId", "eventType", "description",
                             "forPerson"))
})


test_that("GetAwardsList via HTTP", {
  if(!sess_http_valid) skip("No username or authorization key")

  alist <- GetAwardsList(sess_http)

  expect_is(alist, "AwardsList")
  expect_equal(attr(alist, "url"),
               "https://frc-api.firstinspires.org/v2.0/2016/awards/list")
  expect_equal(nrow(alist), 92)
  expect_equal(length(alist), 4)
  expect_equal(names(alist), c("awardId", "eventType", "description",
                               "forPerson"))
})
