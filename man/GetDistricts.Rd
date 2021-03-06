% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/firstapiR_main.R
\name{GetDistricts}
\alias{GetDistricts}
\title{Get a list of FIRST districts}
\usage{
GetDistricts(session, mod_since = NULL, only_mod_since = NULL)
}
\arguments{
\item{session}{A Session object created with \code{GetSession()}.}

\item{mod_since}{A character vector containing an HTTP formatted date and
time. Returns \code{NA} if no changes have been made to the requested data
since the date and time provided. Optional}

\item{only_mod_since}{A character vector containing an HTTP formatted date
and time. This function only returns data that has changed since the date
and time provided. Optional.}
}
\value{
Depending on the \code{session$format} value, returns JSON text, an
  XML::XMLDocument object, or a data.frame with class set to c("data.frame,
  "Districts"). Returns a logical vector of length one with value \code{NA}
  if data is unchanged since date and time passed in arguments
  \code{mod_since} or \code{only_mod_since}.
}
\description{
This function returns a list of all current districs, including their titles
and codes. District codes are used as parameters for several other FIRST API
functions.
}
\details{
See the \emph{District Listings} section of the FIRST API documentation at
\url{http://docs.frcevents2.apiary.io/#} for more details.

The FIRST API URL format is:

\code{https://frc-api.firstinspires.org/v2.0/season/districts}
}
\section{Columns}{

  \enumerate{
    \item \emph{code}: character
    \item \emph{name}: character
    \item \emph{districtCount}: integer}
}

\examples{
sn <- GetSession("username", "key")
districts <- GetDistricts(sn)
}
\seealso{
Refer to \code{\link{Standard_attributes}} for data
attributes returned by this function.
}
