\name{index.gdsn}
\alias{index.gdsn}
\title{Get the specified node}
\description{
    Get a specified GDS node.
}

\usage{
index.gdsn(node, path=NULL, index=NULL, silent=FALSE)
}
\arguments{
    \item{node}{an object of class \code{\link{gdsn.class}} (a GDS node),
        or \code{\link{gds.class}} (a GDS file)}
    \item{path}{the path specifying a GDS node with '/' as a separator}
    \item{index}{a numeric vector or characters, specifying the path; it is
        applicable if \code{path=NULL}}
    \item{silent}{if \code{TRUE}, return NULL if the specified node
        does not exist}
}
\details{
    If \code{index} is a numeric vector, e.g., \code{c(1, 2)}, the result is
the second child node of the first child of \code{node}. If \code{index} is
a vector of characters, e.g., \code{c("list", "x")}, the result is the child
node with name \code{"x"} of the \code{"list"} child node.
}
\value{
    An object of class \code{\link{gdsn.class}} for the specified node.
}

\author{Xiuwen Zheng}
\seealso{
    \code{\link{cnt.gdsn}}, \code{\link{ls.gdsn}}, \code{\link{name.gdsn}},
    \code{\link{add.gdsn}}, \code{\link{delete.gdsn}}
}

\examples{
# cteate a GDS file
f <- createfn.gds("test.gds")

# add a list to "test.gds"
node <- add.gdsn(f, name="list", val=list(x=c(1,2), y=c("T","B","C"), z=TRUE))
f

index.gdsn(f, "list/x")
index.gdsn(f, index=c("list", "x"))
index.gdsn(f, index=c(1, 1))
index.gdsn(f, index=c("list", "z"))

\dontrun{
index.gdsn(f, "list/x/z")
# Error in index.gdsn(f, "list/x/z") : Invalid path "list/x/z"!
}

# return NULL
index.gdsn(f, "list/x/z", silent=TRUE)

# close the GDS file
closefn.gds(f)


# delete the temporary file
unlink("test.gds", force=TRUE)
}

\keyword{GDS}
\keyword{utilities}
