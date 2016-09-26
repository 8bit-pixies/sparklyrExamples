package SparkHello

import org.apache.spark.sql.DataFrame

/*
import org.apache.spark.sql.DataFrame

val numList = List(1,2,3,4,5)
val numRDD = sc.parallelize(numList)

val numDF = numRDD.toDF().withColumnRenamed("_1", "test")

addOne(numDF)
*/

object HelloWorld {
  def hello() : String = {
    "Hello, world! - From Scala"
  }

  def count(df:DataFrame) : Long = {
    df.count()
  }

  def addOne(df:DataFrame) : DataFrame = {
    val colname: String = "test"
    df.withColumn("test1", df("test") + 1)
  }

  def addOneCol(df:DataFrame, colname: String) : DataFrame = {
    df.withColumn("test1", df(colname) + 1)
  }

  def addOneCols(df:DataFrame, inputcolname: String, outputcolname:String) : DataFrame = {
    df.withColumn(outputcolname, df(inputcolname) + 1)
  }

  def doNothing(df:DataFrame): DataFrame = {
    return(df)
  }
}


