\name{put.attr.gdsn}
\alias{put.attr.gdsn}
\title{Add an attribute into a GDS node}
\description{
    Add an attribute to a GDS node.
}

\usage{
put.attr.gdsn(node, name, val=NULL)
}
\arguments{
    \item{node}{an object of class \code{\link{gdsn.class}}, a GDS node}
    \item{name}{the name of an attribute}
    \item{val}{the value of an attribute, or a \code{\link{gdsn.class}} object}
}

\details{
    Missing values are allowed in a numerical attribute, but not allowed for
characters or logical values. Missing characters are converted to \code{"NA"},
and missing logical values are converted to \code{FALSE}.

    If \code{val} is a \code{\link{gdsn.class}} object, copy all attributes
to \code{node}.
}

\value{
    None.
}

\author{Xiuwen Zheng}
\seealso{
    \code{\link{get.attr.gdsn}}, \code{\link{delete.attr.gdsn}}
}

\examples{
# cteate a GDS file
f <- createfn.gds("test.gds")

node <- add.gdsn(f, "int", val=1:10000)
put.attr.gdsn(node, "missing.value", 10000)
put.attr.gdsn(node, "one.value", 1L)
put.attr.gdsn(node, "string", c("ABCDEF", "THIS", paste(letters, collapse="")))
put.attr.gdsn(node, "bool", c(TRUE, TRUE, FALSE))

f
get.attr.gdsn(node)

delete.attr.gdsn(node, "one.value")
get.attr.gdsn(node)


node2 <- add.gdsn(f, "char", val=letters)
get.attr.gdsn(node2)
put.attr.gdsn(node2, val=node)
get.attr.gdsn(node2)


# close the GDS file
closefn.gds(f)

# delete the temporary file
unlink("test.gds", force=TRUE)
}

\keyword{GDS}
\keyword{utilities}
