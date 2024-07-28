package scalaGatlingTestTrigger

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import io.gatling.core.structure.ScenarioBuilder

import scala.concurrent.duration._
import scala.language.postfixOps


class UserStimulation extends Simulation {

  val createTest: ScenarioBuilder = scenario("Add to Cart")
    .exec(karateFeature("classpath:regresDummyFeatures/CrudMethods.feature"))


 // val delete = scenario("delete").exec(karateFeature("classpath:mock/cats-delete.feature@name=delete"))

  setUp(
    createTest.inject(
      atOnceUsers(10),
      nothingFor(4),
      rampUsers(100)
        during (5 seconds))
  )


}
