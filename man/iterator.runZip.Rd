% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/iterator.R
\name{iterator.runZip}
\alias{iterator.runZip}
\title{Iterate over all meters in a zip code, extracting features for each in a performance optimized manner}
\usage{
iterator.runZip(zip, custFn, cacheResults = F, ctx = NULL, ...)
}
\arguments{
\item{zip}{The zip code to use for the weather, meter ids, and meter data lookups}

\item{custFn}{The feature function(s) to call on \code{MeterDataClass} instances from within the zip code}

\item{cacheResults}{A boolean flag that indicates whether results should be cached as RData. 
If true, the cached data will be looked up prior to feature extraction to bypass running 
features for the given zip code while returning the cached results. This can prevent duplicate processing
and allow an interrupted batch process to resume processing where it left off.
The cache directory is `getwd()` by default, but can be overridden using `ctx$resultsCache`.}

\item{ctx}{The ctx environment that configures the feature run.}

\item{...}{Arguments to be passed into the feature function(s).}
}
\description{
Function that looks up local weather and all meter data for the passed zip code
(once) and caches them and then looks up all meter ids in the passed zip code
calls iterator.iterateMeters with those meter ids and the pre-loaded weather and meter data. 
This runs faster than calling ids individually, which load individual meter data and similar 
weather data over and over.
}

