% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/firstapiR_main.R
\name{GetTeams}
\alias{GetTeams}
\title{Get details on FRC teams}
\usage{
GetTeams(
  session,
  team = NULL,
  event = NULL,
  district = NULL,
  state = NULL,
  page = NULL,
  mod_since = NULL,
  only_mod_since = NULL
)
}
\arguments{
\item{session}{A Session object created with \code{GetSession()}.}

\item{team}{An integer vector containing a team number. Optional.}

\item{event}{Character A FIRST API event code (see \code{GetEvents()}). If
event is specified, \code{GetTeams()} will filter results to all teams
particpating in the specified event. Optional.}

\item{district}{A character vector containing a FIRST API district code
(see \code{GetDistricts()}). If specified, the FIRST API server will filter
the response to only the teams in the specified district. Optional.}

\item{state}{A character vector containing a state name, spelled out entirely
(i.e., 'Idaho', \emph{not} 'ID'). If state is specified, \code{GetTeams()}
will filter results to all teams in the specified state. Optional.}

\item{page}{An integer vector that specifyies which page of results should be
returned. Optional. Use only for XML or JSON formats.}

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
  "Teams"). Returns a logical vector of length one with value \code{NA} if
  data is unchanged since date and time passed in arguments \code{mod_since}
  or \code{only_mod_since}.
}
\description{
Provides lists of FRC teams for specified events, districts, and states. With
no parameters (except for \code{session}), \code{GetTeams} will provide a
list of all FRC teams.
}
\details{
Because the length of the \code{GetTeams} response can be several thousand
lines long, the FIRST API server will break up its response into several
pages when the number of teams in the response exceeds 65. For the data frame
format, \code{GetTeams} will send a request to the FIRST API server and
determine from the first response whether additional HTTP requests are
necessary to retrieve all requested data. \code{GetTeams} will then merge all
responses into a single data frame. For XML and JSON formats, the user will
have to call \code{GetTeams} for each page of data, specifying the page with
the \code{page} argument.

See the \emph{Team Listings} section of the FIRST API documentation at
\url{http://docs.frcevents2.apiary.io/#} for more details.

The FIRST API URL format is:

\code{https://frc-api.firstinspires.org/v2.0/season/teams&eventCode=event
?districtCode=district?state=state?page=2}
}
\section{Columns}{

  \enumerate{
    \item \emph{team}: character
    \item \emph{nameFull}: character
    \item \emph{nameShort}: character
    \item \emph{city}: character
    \item \emph{stateProv}: factor
    \item \emph{country}: factor
    \item \emph{website}: character
    \item \emph{rookieYear}: integer
    \item \emph{robotName}: character
    \item \emph{districtCode}: factor
    \item \emph{teamCountTotal}: integer
    \item \emph{teamCountPage}: integer
    \item \emph{pageCurrent}: integer
    \item \emph{pageTotal}: integer}
}

\examples{
sn <- GetSession("username", "key", season = 2016)
GetTeams(sn, state = "California")
GetTeams(sn, district = "FIM")
GetTeams(sn, event = "CMP-CARVER")
}
\seealso{
Refer to \code{\link{Standard_attributes}} for data
attributes returned by this function.
}
