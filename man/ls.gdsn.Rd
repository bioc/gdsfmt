\name{ls.gdsn}
\alias{ls.gdsn}
\title{Return the names of child nodes}
\description{
    Get a list of names for its child nodes.
}

\usage{
ls.gdsn(node, include.hidden=FALSE, recursive=FALSE, include.dirs=TRUE)
}
\arguments{
    \item{node}{an object of class \code{\link{gdsn.class}}, a GDS node}
    \item{include.hidden}{whether including hidden variables or folders}
    \item{recursive}{whether the listing recurses into directories or not}
    \item{include.dirs}{whether subdirectory names should be included in
        recursive listings}
}
\value{
    A vector of characters, or \code{character(0)} if \code{node} is not a
folder.
}

\author{Xiuwen Zheng}
\seealso{
    \code{\link{cnt.gdsn}}, \code{\link{objdesp.gdsn}},
    \code{\link{ls.gdsn}}, \code{\link{index.gdsn}}
}

\examples{
# cteate a GDS file
f <- createfn.gds("test.gds")

# add a list to "test.gds"
node <- add.gdsn(f, name="list", val=list(x=c(1,2), y=c("T","B","C"), z=TRUE))
ls.gdsn(node)
# "x" "y" "z"

ls.gdsn(f$root)
# "list"

ls.gdsn(f$root, recursive=TRUE)
# "list"   "list/x" "list/y" "list/z"

ls.gdsn(f$root, recursive=TRUE, include.dirs=FALSE)
# "list/x" "list/y" "list/z"

# close the GDS file
closefn.gds(f)


# delete the temporary file
unlink("test.gds", force=TRUE)
}

\keyword{GDS}
\keyword{utilities}
