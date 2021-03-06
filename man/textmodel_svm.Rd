% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/textmodel_svm.R
\name{textmodel_svm}
\alias{textmodel_svm}
\title{Linear SVM classifier for texts}
\usage{
textmodel_svm(x, y, weight = c("uniform", "docfreq", "termfreq"), ...)
}
\arguments{
\item{x}{the \link{dfm} on which the model will be fit.  Does not need to
contain only the training documents.}

\item{y}{vector of training labels associated with each document identified
in \code{train}.  (These will be converted to factors if not already
factors.)}

\item{weight}{weights for different classes for imbalanced training sets,
passed to \code{wi} in \code{\link[LiblineaR]{LiblineaR}}. \code{"uniform"}
uses default; \code{"docfreq"} weights by the number of training examples,
and \code{"termfreq"} by the relative sizes of the training classes in
terms of their total lengths in tokens.}

\item{...}{additional arguments passed to \code{\link[LiblineaR]{LiblineaR}}}
}
\description{
Fit a fast linear SVM classifier for texts, using the
\pkg{LiblineaR} package.
}
\examples{
# use party leaders for govt and opposition classes
quanteda::docvars(data_corpus_irishbudget2010, "govtopp") <-
    c(rep(NA, 4), "Gov", "Opp", NA, "Opp", NA, NA, NA, NA, NA, NA)
dfmat <- quanteda::dfm(data_corpus_irishbudget2010)
tmod <- textmodel_svm(dfmat, y = quanteda::docvars(dfmat, "govtopp"))
predict(tmod)
predict(tmod, type = "probability")

# multiclass problem - all party leaders
tmod2 <- textmodel_svm(dfmat,
    y = c(rep(NA, 3), "SF", "FF", "FG", NA, "LAB", NA, NA, "Green", rep(NA, 3)))
predict(tmod2)
predict(tmod2, type = "probability")
}
\references{
R. E. Fan, K. W. Chang, C. J. Hsieh, X. R. Wang, and C. J. Lin. (2008)
LIBLINEAR: A Library for Large Linear Classification.
\emph{Journal of Machine Learning Research} 9: 1871-1874.
\url{http://www.csie.ntu.edu.tw/~cjlin/liblinear}.
}
\seealso{
\code{\link[LiblineaR]{LiblineaR}}
}
