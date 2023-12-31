\name{moveto.gdsn}
\alias{moveto.gdsn}
\title{Relocate a GDS node}
\description{
    Move a GDS node to a new place in the same file
}

\usage{
moveto.gdsn(node, loc.node,
    relpos = c("after", "before", "replace", "replace+rename"))
}
\arguments{
    \item{node}{an object of class \code{\link{gdsn.class}} (a GDS node)}
    \item{loc.node}{an object of class \code{\link{gdsn.class}}
        (a GDS node), indicates the new location}
    \item{relpos}{\code{"after"}: after \code{loc.node},
        \code{"before"}: before \code{loc.node},
        \code{"replace"}: replace \code{loc.node} (\code{loc.node}
        will be deleted);
        \code{"replace+rename"}: replace \code{loc.node} (\code{loc.node}
        will be deleted and \code{node} has a new name as \code{loc.node})}
}
\value{
    None.
}

\author{Xiuwen Zheng}
\seealso{
    \code{\link{createfn.gds}}, \code{\link{openfn.gds}},
    \code{\link{index.gdsn}}, \code{\link{add.gdsn}}
}
\examples{
# cteate a GDS file
f <- createfn.gds("test.gds")
L <- -2500:2499

# commom types

add.gdsn(f, "label", NULL)
add.gdsn(f, "int", 1:10000, compress="ZIP", closezip=TRUE)
add.gdsn(f, "int.matrix", matrix(L, nrow=100, ncol=50))
add.gdsn(f, "double", seq(1, 1000, 0.4))
add.gdsn(f, "character", c("int", "double", "logical", "factor"))

f
# +     [  ]
# |--+ label        
# |--+ int  { Int32 10000 ZIP(34.74%) }
# |--+ int.matrix   { Int32 100x50 }
# |--+ double   { Float64 2498 }
# |--+ character    { VStr8 4 }

n1 <- index.gdsn(f, "label")
n2 <- index.gdsn(f, "double")

moveto.gdsn(n1, n2, relpos="after")
f

moveto.gdsn(n1, n2, relpos="before")
f

moveto.gdsn(n1, n2, relpos="replace")
f

n2 <- index.gdsn(f, "int")
moveto.gdsn(n1, n2, relpos="replace+rename")
f

# close the GDS file
closefn.gds(f)


# delete the temporary file
unlink("test.gds", force=TRUE)
}

\keyword{GDS}
\keyword{utilities}
