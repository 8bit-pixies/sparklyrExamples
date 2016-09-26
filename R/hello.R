# Hello, world! - From Spark and Scala
#
# This is an example package which compiles
# a hello function in scala and deploys it
# to spark using sparklyr.
#
# You can learn more about sparklyr at:
#
#   http://spark.rstudio.com/
#

#' @import sparklyr
#' @export
spark_hello <- function(sc) {
  sparklyr::invoke_static(sc, "SparkHello.HelloWorld", "hello")
}


#' @import sparklyr
#' @export
spark_count <- function(df) {
  # sparklyr::invoke_static(spark_connection(test_tbl), "SparkHello.HelloWorld", "count", spark_dataframe(test_tbl))
  sparklyr::invoke_static(spark_connection(df), "SparkHello.HelloWorld", "count", spark_dataframe(df))
}



#' @import sparklyr
#' @export
spark_addOne <- function(df) {
  sdf_register(
    sparklyr::invoke_static(spark_connection(df), "SparkHello.HelloWorld", "addOne",
                            spark_dataframe(df))
  )
}

#' @import sparklyr
#' @export
spark_addOneCol <- function(df, input_col) {
  sdf_register(
    sparklyr::invoke_static(spark_connection(df), "SparkHello.HelloWorld", "addOneCol",
                            spark_dataframe(df),
                            ensure_scalar_character(input_col))
  )
}

#' @import sparklyr
#' @export
spark_addOneCols <- function(df, input_col, output_col) {
  sdf_register(
    sparklyr::invoke_static(spark_connection(df), "SparkHello.HelloWorld", "addOneCols",
                            spark_dataframe(df),
                            ensure_scalar_character(input_col),
                            ensure_scalar_character(output_col))
  )
}




