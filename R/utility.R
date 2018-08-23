#' tw year to western year
#'
#' @param y_tw An integer
#' @return the western year
#' @examples
#'   year_we(0)
#'   year_we("107")
#' @export
year_we <- function(y_tw) {
  as.integer(y_tw) + 1911
}

#' western year to tw year
#'
#' @param y_we An integer
#' @return the tw year
#' @examples
#'  year_tw("2018")
#'  year_tw(1912)
#' @export
year_tw <- function(y_we) {
  as.integer(y_we) - 1911
}

#' tw date to western date
#'
#' @param date_tw An String
#' @param sep As string separate records. if use empty string the month and date requires
#' leading zero. default is /
#' @return the wester date
#' @examples
#'   date_we("1070101", sep="")
#'   date_we("105/02/29", sep="/")
#' @export
date_we <- function(d_tw, sep="/") {
  if (sep=="") {
    if (nchar(d_tw)==6) {
      ymd_tw <- c(substr(d_tw, 1, 2), substr(d_tw, 3, 4), substr(d_tw, 5, 6))
    } else if (nchar(d_tw)==7) {
      ymd_tw <- c(substr(d_tw, 1, 3), substr(d_tw, 4, 5), substr(d_tw, 6, 7))
    }
  } else {
    ymd_tw <- strsplit(d_tw, sep)[[1]]
    ymd_tw[2] <- sprintf("%02d", as.integer(ymd_tw[2]))
    ymd_tw[3] <- sprintf("%02d", as.integer(ymd_tw[3]))
  }
  ymd_tw[1] <- as.integer(ymd_tw[1]) + 1911
  as.Date(paste0(ymd_tw, collapse="/"), format="%Y/%m/%d")
}

#' western date to tw date
#'
#' @param date_we
#' @param sep As string separate records. default is /
#' @return the tw date string
#' @examples
#'   date_tw("2018-08-01")
#'   date_tw(as.Date("20180801", format="%Y%m%d"))
#' @export
date_tw <- function(d_we, sep="/") {
  d_we <- as.Date(d_we)
  paste0(
    list(
      as.character(as.integer(format(d_we, "%Y"))-1911),
      format(d_we, "%m"),
      format(d_we, "%d")
    ), collapse=sep)
}
