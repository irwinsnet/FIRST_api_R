% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/firstapiR_main.R
\name{GetSeason}
\alias{GetSeason}
\title{Get high-level information for an FRC season}
\usage{
GetSeason(session, mod_since = NULL, only_mod_since = NULL)
}
\arguments{
\item{session}{A Session object created with \code{GetSession()}.}

\item{mod_since}{A character vector containing an HTTP formatted date and
time. Returns \code{NA} if no changes have been made to the requested data
since the date and time provided. Optional.}

\item{only_mod_since}{A character vector containing an HTTP formatted date
and time. This function only returns data that has changed since the date
and time provided. Optional.}
}
\value{
Depending on the \code{session$format} value, returns JSON text, an
  XML::XMLDocument object, or a data.frame with class set to
  c("data.frame, "Season"). Returns a logical vector of length one with value
  \code{NA} if data is unchanged since date and time passed in arguments
  \code{mod_since} or \code{only_mod_since}.
}
\description{
Returns information for the season specified in the session list (see
documentation for the GetSession function for additional details.)
}
\details{
See the \emph{Season Summary} section of the FIRST API documentation at
\url{http://docs.frcevents2.apiary.io/#} for more details.

The FIRST API URL format is:

\code{https://frc-api.firstinspires.org/v2.0/season}
}
\section{Columns}{

  \enumerate{
    \item \emph{eventCount}: integer
    \item \emph{gameName}: factor
    \item \emph{kickoff}: factor
    \item \emph{rookieStart}: integer
    \item \emph{teamCount}: integer
    \item \emph{FRCChampionships.name}: character
    \item \emph{FRCChampionships.startDate}: character
    \item \emph{FRCChampionships.location}: character}
}

\examples{
sn <- GetSession("username", "key", season = 2015, staging = TRUE)
summary <- GetSeason(sn)
}
\seealso{
Refer to \code{\link{Standard_attributes}} for data
  attributes returned by this function.

Refer to \code{\link{GetSession}} for information on specifying the
  FRC season.
}
