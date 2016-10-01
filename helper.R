sparklyr::compile_package_jars(
  sparklyr::spark_compilation_spec(spark_version="1.6.1",
                                   scalac_path=sparklyr::find_scalac("2.10", locations = "C:/Users/chapm/Documents/scala"),
                                   jar_name="sparkhello-1.6-2.10.jar")
)

devtools::document()
devtools::load_all()


# usage

library(sparklyr)
library(dplyr)
library(sparkhello)

sc <- spark_connect(master = "local")
spark_hello(sc)
test <- data.frame(test=c(1,2,3))
test_tbl <- copy_to(sc, test)
spark_count(test_tbl)
test1_tbl <- spark_addOne(test_tbl)
test1_tbl

test1_tbl <- sdf_register(
  sparklyr::invoke_static(spark_connection(test_tbl), "SparkHello.HelloWorld", "addOneCol", spark_dataframe(test_tbl), "test")
)


spark_addOneCol(test_tbl, "test")

spark_addOneCols(test_tbl, "test", "test1") %>%
  spark_addOneCols("test1", "test2") %>%
  spark_addOneCols("test2", "tests")




spark_doNothing(test_tbl)

sparklyr::invoke_static(spark_connection(test_tbl), "SparkHello.HelloWorld", "count", spark_dataframe(test_tbl))

test_tbl2 <- sdf_register(
  sparklyr::invoke_static(spark_connection(test_tbl), "SparkHello.HelloWorld", "doNothing", spark_dataframe(test_tbl)))

test1_tbl <- sdf_register(
  sparklyr::invoke_static(spark_connection(test_tbl), "SparkHello.HelloWorld", "addOne", spark_dataframe(test_tbl), "test", "test1")
)




