\name{GTuples-comparison}

\alias{GTuples-comparison}

\alias{pcompare,GTuples,GTuples-method}

\alias{duplicated,GTuples-method}
\alias{duplicated.GTuples}

\alias{match,GTuples,GTuples-method}
\alias{selfmatch,GTuples-method}

\alias{order,GTuples-method}
\alias{sort,GTuples-method}
\alias{sort.GTuples}
\alias{rank,GTuples-method}
\alias{is.unsorted,GTuples-method}

\title{Comparing and ordering genomic tuples}

\description{
  Methods for comparing and ordering the elements in one or more
  \code{\link{GTuples}} objects.
}

\usage{
## duplicated()
## ------------

\S4method{duplicated}{GTuples}(x, incomparables = FALSE, fromLast = FALSE)

## match() and selfmatch()
## -------

\S4method{match}{GTuples,GTuples}(x, table, nomatch = NA_integer_, 
      incomparables = NULL, ignore.strand = FALSE)
\S4method{selfmatch}{GTuples}(x, ignore.strand = FALSE, ...)

## order() and related methods
## -----------------------------------------------------------------------------

\S4method{order}{GTuples}(..., na.last = TRUE, decreasing = FALSE, method = c("auto", "shell", "radix"))

\S4method{sort}{GTuples}(x, decreasing = FALSE, ignore.strand = FALSE, by)

\S4method{rank}{GTuples}(x, na.last = TRUE,
     ties.method = c("average", "first", "random", "max", "min"))
     
\S4method{is.unsorted}{GTuples}(x, na.rm=FALSE, strictly=FALSE, ignore.strand = FALSE)

## Generalized element-wise (aka "parallel") comparison of 2 GTuples
## objects
## -----------------------------------------------------------------------------

\S4method{pcompare}{GTuples,GTuples}(x, y)
}

\arguments{
  \item{x, table, y}{
    \code{\link{GTuples}} objects.
  }
  \item{incomparables}{
    Not supported.
  }
  \item{fromLast, method, nomatch}{
    See \code{?`\link[GenomicRanges]{GenomicRanges-comparison}`} in the 
    \pkg{GenomicRanges} package for a description of these arguments.
  }
  \item{ignore.strand}{
    Whether or not the strand should be ignored when comparing 2 genomic
    tuples.
  }
  \item{...}{
    One or more \link{GTuples} objects. The \link{GTuples} objects after the 
    first one are used to break ties
  }
  \item{na.last}{
    Ignored.
  }
  \item{decreasing}{
    \code{TRUE} or \code{FALSE}.
  }
  \item{ties.method}{
    A character string specifying how ties are treated. Only \code{"first"}
    is supported for now.
  }
  \item{by}{
    An optional formula that is resolved against \code{as.env(x)}; 
    the resulting variables are passed to \code{order} to generate the
    ordering permutation.
  }
  \item{na.rm}{
    logical. Should missing values be removed before checking? WARNING: This
    currently has no effect and is ignored.
  }
  \item{strictly}{
    logical indicating if the check should be for \emph{strictly} increasing
    values.
  }
}

\details{
  Two elements of a \code{\link{GTuples}} object (i.e. two genomic tuples) are
  considered equal if and only if they are on the same underlying sequence and strand,
  and have the same positions (\code{\link{tuples}}). \code{duplicated()} and 
  \code{unique()} on a \code{\link{GTuples}} object are conforming to this.

  The "natural order" for the elements of a \code{\link{GTuples}} object is to
  order them (a) first by sequence level, (b) then by strand, (c) then by 
  \eqn{pos_{1}, \ldots, pos_{m}}.
  This way, the space of genomic tuples is totally ordered.

  \code{order()}, \code{sort()}, \code{is.unsorted()}, and \code{rank()} on a 
  \code{\link{GTuples}} object are using this "natural order".

  Also \code{==}, \code{!=}, \code{<=}, \code{>=}, \code{<} and \code{>}
  on \code{\link{GTuples}} objects are using this "natural order".
  
  \describe{
    \item{\code{pcompare(x, y)}:}{
      Performs "generalized range-wise comparison" of \code{x} and \code{y},
      that is, returns an integer vector where the i-th element is a code
      describing how the i-th element in \code{x} is qualitatively positioned
      relatively to the i-th element in \code{y}.
          
      A code that is \code{< 0}, \code{= 0}, or \code{> 0}, corresponds to
      \code{x[i] < y[i]}, \code{x[i] == y[i]}, or \code{x[i] > y[i]},
      respectively.
      
      \strong{WARNING:} These predefined codes are not as detailed as those for 
      \code{\link[IRanges]{IPosRanges-comparison}}. Specifically, only the 
      sign of the code matters, not the actual value.
    }
    \item{\code{match(x, table, nomatch = NA_integer_)}:}{
      Returns an integer vector of the length of \code{x},
      containing the index of the first matching range in \code{table}
      (or \code{nomatch} if there is no matching range) for each tuple
      in \code{x}.
    }
    \item{\code{duplicated(x, fromLast = FALSE, method = c("hash", "base"))}:}{
      Determines which elements of \code{x} are equal to elements
      with smaller subscripts, and returns a logical vector indicating
      which elements are duplicates. 
      See \code{\link[base]{duplicated}} in the \pkg{base} package for more
      details.
    }
    \item{\code{unique(x, fromLast = FALSE, method = c("hash", "base"))}:}{
      Removes duplicate tuples from \code{x}.
      See \code{\link[base]{unique}} in the \pkg{base} package for more
      details.
    }
    \item{\code{x \%in\% table}:}{
      A shortcut for finding the ranges in \code{x} that match any of
      the tuples in \code{table}. Returns a logical vector of length
      equal to the number of tuples in \code{x}.
    }
    \item{\code{findMatches(x, table)}:}{
      An enhanced version of \code{match} that returns all the matches
      in a \code{\linkS4class{Hits}} object.
    }
    \item{\code{countMatches(x, table)}:}{
      Returns an integer vector of the length of \code{x} containing the
      number of matches in \code{table} for each element in \code{x}.
    }
    \item{\code{order(...)}:}{
      Returns a permutation which rearranges its first argument (a 
      \code{\link{GTuples}} object) into ascending order, breaking ties by 
      further arguments.
      See \code{\link[BiocGenerics]{order}} in the \pkg{BiocGenerics} package
      for more information.
    }
    \item{\code{sort(x)}:}{
      Sorts \code{x}.
      See \code{\link[base]{sort}} in the \pkg{base} package for more details.
    }
    \item{\code{rank(x, na.last = TRUE, ties.method = c("average", "first", 
                  "random", "max", "min"))}:}{
      Returns the sample ranks of the tuples in \code{x}.
      See \code{\link[base]{rank}} in the \pkg{base} package for more details.
    }
  }
}

\value{
  For \code{pcompare}: see Details section above.

  For \code{selfmatch}: an integer vector of the same length as \code{x}.

  For \code{duplicated}, \code{unique}, and \code{\%in\%}: see
  \code{?BiocGenerics::\link[BiocGenerics]{duplicated}},
  \code{?BiocGenerics::\link[BiocGenerics]{unique}},
  and \code{?`\link{\%in\%}`}.

  For \code{findMatches}: a \code{\linkS4class{Hits}} object by default (i.e. if
  \code{select="all"}).

  For \code{countMatches}: an integer vector of the length of \code{x}
  containing the number of matches in \code{table} for each element
  in \code{x}.

  For \code{sort}: see \code{?BiocGenerics::\link[BiocGenerics]{sort}}.
}

\author{Peter Hickey}

\seealso{
  \itemize{
    \item The \code{\link{GTuples}} class.
    \item \link[GenomicRanges]{GenomicRanges-comparison} in the \pkg{GRanges}
          package for comparing and ordering genomic ranges.
    \item \link{intra-tuple-methods} for intra-tuple transformations.
    \item \link[GenomicTuples]{findOverlaps-methods} for finding
          overlapping genomic ranges.
  }
}

\examples{
## GTuples object containing 3-tuples:
gt3 <- GTuples(seqnames = c('chr1', 'chr1', 'chr1', 'chr1', 'chr2'), 
               tuples = matrix(c(10L, 10L, 10L, 10L, 10L, 20L, 20L, 20L, 25L, 
                                 20L, 30L, 30L, 35L, 30L, 30L), ncol = 3), 
               strand = c('+', '-', '*', '+', '+'))
gt3 <- c(gt3, rev(gt3[3:5]))

## ---------------------------------------------------------------------
## A. ELEMENT-WISE (AKA "PARALLEL") COMPARISON OF 2 GTuples OBJECTS
## ---------------------------------------------------------------------
gt3[2] == gt3[2]  # TRUE
gt3[2] == gt3[5]  # FALSE
gt3 == gt3[4]
gt3 >= gt3[3]

## ---------------------------------------------------------------------
## B. duplicated(), unique()
## ---------------------------------------------------------------------
duplicated(gt3)
unique(gt3)

## ---------------------------------------------------------------------
## C. match(), %in%
## ---------------------------------------------------------------------
table <- gt3[2:5]
match(gt3, table)
match(gt3, table, ignore.strand = TRUE)

## ---------------------------------------------------------------------
## D. findMatches(), countMatches()
## ---------------------------------------------------------------------
findMatches(gt3, table)
countMatches(gt3, table)

findMatches(gt3, table, ignore.strand = TRUE)
countMatches(gt3, table, ignore.strand = TRUE)

gt3_levels <- unique(gt3)
countMatches(gt3_levels, gt3)

## ---------------------------------------------------------------------
## E. order() AND RELATED METHODS
## ---------------------------------------------------------------------
is.unsorted(gt3)
order(gt3)
sort(gt3)
is.unsorted(sort(gt3))

is.unsorted(gt3, ignore.strand=TRUE)
gt3_2 <- sort(gt3, ignore.strand=TRUE)
is.unsorted(gt3_2)  # TRUE
is.unsorted(gt3_2, ignore.strand=TRUE)  # FALSE

## TODO (TODO copied from GenomicRanges): Broken. Please fix!
#sort(gt3, by = ~ seqnames + start + end) # equivalent to (but slower than) above

score(gt3) <- rev(seq_len(length(gt3)))

## TODO (TODO copied from GenomicRanges): Broken. Please fix!
#sort(gt3, by = ~ score)

rank(gt3)

## ---------------------------------------------------------------------
## F. GENERALIZED ELEMENT-WISE COMPARISON OF 2 GTuples OBJECTS
## ---------------------------------------------------------------------
pcompare(gt3[3], gt3)

}
\keyword{methods}
