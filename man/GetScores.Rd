% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/firstapiR_main.R
\name{GetScores}
\alias{GetScores}
\title{Get detailed match scores}
\usage{
GetScores(
  session,
  event,
  level = "qual",
  team = NULL,
  match = NULL,
  start = NULL,
  end = NULL,
  mod_since = NULL,
  only_mod_since = NULL
)
}
\arguments{
\item{session}{A Session object created with \code{GetSession()}.}

\item{event}{A character vector containing a FIRST API event code
(see \code{GetEvents}).}

\item{level}{A character vector containing either \emph{"qual"} or
\emph{"playoff"}. Defaults to \emph{"qual"}. Optional.}

\item{team}{An integer vector containing a team number. Optional. Cannot
specify \code{match} when \code{team} is specified.}

\item{match}{An integer vector containing a match number. Optional. If
specified, \code{GetMatchResults} returns results for only the specified
match. If \code{level} is not specified, returns the results for the
qualification match. To get playoff match results, set \code{level} to
\emph{"playoff"}. Cannot specify \code{team} when \code{match} is
specified.}

\item{start}{An integer vector containing the earliest match to return.
Optional.}

\item{end}{An integer vector containing the latest match to return. Optional.}

\item{mod_since}{A character vector containing an HTTP formatted date and
time. Returns \code{NA} if no changes have been made to the requested data
since the date and time provided. Optional.}

\item{only_mod_since}{A character vector containing an HTTP formatted date
and time. This function only returns data that has changed since the date
and time provided. Optional.}
}
\value{
Depending on the \code{session$format} value, returns JSON text, an
  XML::XMLDocument object, or a data.frame with class set to c("data.frame,
  "Scores"). Returns a logical vector of length one with value \code{NA} if
  data is unchanged since date and time passed in arguments \code{mod_since}
  or \code{only_mod_since}.
}
\description{
The results vary depending on the season requested. The 2016 data fields are
listed here. See the FIRST API documentation at
\url{http://docs.frcevents2.apiary.io/#} for data fields for prior seasons.
The data frame contains two rows for each match, one for blue and the other
for red.
}
\details{
\code{GetScores()} contains both the blue and red alliance scores for each
match, but it does not list the teams assigned to each alliance. Use
firstapiR \code{MergeResults()} function to merge the data frames returned by
\code{GetHybridSchedule} and \code{GetScores()} to create a data frame that
contains both team numbers and detailed scores:
\code{MergeResults(hybrid_df, scores_df)} should do the trick.

See the \emph{Detailed Scores} section of the FIRST API documentation at
\url{http://docs.frcevents2.apiary.io/#} for more details.

The FIRST API URL format is:

\code{https://frc-api.firstinspires.org/v2.0/season/matches/event/level?
teamNumber=team&matchNumber=match&start=start&end=end}
}
\section{Columns}{

  \enumerate{
     \item \emph{level}: character
     \item \emph{match}: integer
     \item \emph{audienceGroup}: factor
     \item \emph{alliance}: factor
     \item \emph{robot1Auto, robot2Auto, robot3Auto}: factor
     \item \emph{autoBouldersLow, autoBouldersHigh}: integer
     \item \emph{teleopBouldersLow, teleopBouldersHigh}: integer
     \item \emph{towerFaceA, towerFaceB, towerFaceC}: factor
     \item \emph{towerEndStrength}: integer
     \item \emph{teleopTowerCaptured, teleopDefensesBreached}: logical
     \item \emph{position1, position2, position3, position4,
       position5}: factor
     \item \emph{position1Crossings, position2Crossings, position3Crossings,
       position4Crossings, position5Crossings}: integer
     \item \emph{foulCount, techFoulCount}: integer
     \item \emph{autoPoints, autoReachPoints, autoCrossingPoints,
       autoBoulderPoints}: integer
     \item \emph{teleopPoints, teleopCrossingPoints, teleopBoulderPoints,
       teleopChallengePoints, teleopScalePoints}: integer
     \item \emph{breachPoints, capturePoints}: integer
     \item \emph{adustPoints, foulPoints, totalPoints}: integer}
}

\examples{
sn <- GetSession("username", "key", season = 2016)
archimedes_qual_scores <- GetScores(sn, event = "ARCHIMEDES")
first_10_qual_matches <- GetScores(sn, event = "WAELL", start = 1, end = 10)
qual_match_10_scores <- GetScores(sn, event = "WAELL", match = 15)
}
\seealso{
Refer to \code{\link{Standard_attributes}} for data attributes
  returned by this function.

Refer to \code{\link{MergeResults}} for guidance on how to merge the
  \emph{Scores} and \emph{HybridSchedule} data frames.
}
