% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mock-api.R
\name{with_mock_API}
\alias{with_mock_API}
\title{Serve a mock API from files}
\usage{
with_mock_API(expr)
}
\arguments{
\item{expr}{Code to run inside the fake context}
}
\value{
The result of \code{expr}
}
\description{
In this context, HTTP GET or POST requests attempt to read from files. This allows
test code to use API fixtures and to proceed evaluating code that expects
HTTP requests to return meaningful responses. Other HTTP request methods, as
well as GET or POST requests that do not correspond to a file that exist, raise
errors, like how code{\link{without_internet}} does.
}
\details{
File paths for API fixture files may be relative to the 'tests/testthat'
directory, i.e. relative to the .R test files themselves.

Some file path matching rules: first, in order to emulate an HTTP API, in
which, unlike a file system, a "directory" itself is a resource, all mock
'"URLs" should end in "/", and mock files themselves should end in ".json"
'(for in the current version of this package,
all API responses are assumed to be Content-Type: application/json). That is,
a mocked \code{GET("api/")} will read a "api.json" file, while
\code{GET("api/object1/")} reads "api/object1.json". If the request URL
contains a query string, it will be popped off, hashed
by \code{\link[digest]{digest}}, and the first six characters appended to the
file being read. For example, \code{GET("api/object1/?a=1")} reads
"api/object1-b64371.json". 
If method other than GET is used it will be appended to the end of the end of the file name.
For example, \code{POST("api/object1/?a=1")} reads
"api/object1-b64371-POST.json".
}
