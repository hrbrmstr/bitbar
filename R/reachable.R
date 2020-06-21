#' Is the internet accessible?
#'
#' @param fqdn_or_ip FQDN or ip to use for reachability testing. defaults to google dns
#' @export
reachable <- function(fqdn_or_ip = "8.8.8.8") {

  res <- sys::exec_internal("/usr/sbin/scutil", args = c("-r", fqdn_or_ip[1]))

  return(res$status == 0)

}