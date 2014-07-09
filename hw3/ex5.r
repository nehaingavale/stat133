library(RUnit)
errMsg <- function(err) print(err)
load('ex5-tests.rda')

# Implement the function "firstLast". Your function should take the
# following arguments:
#
# <data>: any dataframe
#
# Your function should return the following:
#
# <first.last>: a dataframe with dimensions 10 x num.cols (where num.cols is
#   the number of columns from the data frame). The first five rows of this
#   matrix should be the first five rows of <data> while the last
#   five should be the final 5 rows of <data>

firstLast <- function(data) {

    # your code here *
  len = length(data[, 1])
  data[c(1:5, (len-4):len), ]
}

tryCatch(checkEquals(first.last.t, firstLast(iris)), error=function(err)
         errMsg(err))


# Implment the function "npRatio". Your function should take the following
# arguments:
#
# <data>: any matrix or dataframe
#
# Your function should return the following:
#
# <np.ratio>: the number of variables (columns) divided by the number of
# observations (rows)

npRatio <- function(data) {

    # your code here *
  dim(data)[2] / dim(data)[1]
}

tryCatch(checkEquals(np.ratio.t, npRatio(iris)), error=function(err)
         errMsg(err))

# Implement the function "numericSummary". Your function should take the
# following arguments:
#
# <data>: a data frame containing numeric variables and factor levels
#
# Your function should return the following:
#
# <numeric.summary>: a 6 x n.numeric (where n.numeric is the number of
#   numeric variables) matrix containing the minimum, 1st Quartile, Median,
#   Mean, 3rd Quartile, and Max values for any numeric variable in <data>

numericSummary <- function(data) {

    # your code here **
  n.data = unname(data[, sapply(X=data[1,], FUN=is.numeric)])
  qs = apply(X=n.data, MARGIN=c(2), FUN=quantile)
  rbind(
    qs[1:3, ],
    apply(X=n.data, FUN=mean, MARGIN=c(2)),
    qs[4:5, ]
  )
}
# numerical issue?
tryCatch(checkEquals(numeric.summary.t, unname(numericSummary(ex5.test1))),
         error=function(err) errMsg(err))

# Implement the function "getClass". Your function should take the
# following arguments:
#
# <data>: a data frame
#
# Your function should return the following:
#
# <var.classes>: a character vector giving the class of each variable
#   (column) of the data frame

getClass <- function(data) {

    # your code here *
  sapply(X=data[1,], FUN=class)
}

tryCatch(checkEquals(get.class.t, unname(getClass(ex5.test1))), error=function(err)
         errMsg(err))
