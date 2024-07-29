
## ABOUT THE PROJECT

This project target is that making possible Load Test with Gatling by using Karate suites.

If you want to execute API testing, you can use Karate framework in terms of easy writing, taking less time compare other api frameworks.
It allows a number of methods and variety testing ways like add to cart your product, request and response comparing , login and logout operations etc.
Karate is using Gherking language that is not technical.

At this point, Gatling is coming through the main stage. When you need LOAD Testing and if you have Karate features, you can take help from this framework.
Gatling allows writing test scenarios in Scala, enabling the creation of powerful and flexible test cases.
It also has powerful UI tool to shows you testing results. 
You can load 1000 - 2000 thread on one machine depends on your hardware power. 
Look at the example: 

<img width="1275" alt="Screenshot 2024-07-28 at 19 19 38" src="https://github.com/user-attachments/assets/5f260ba0-6663-4e27-92a1-e1f89475af90">

### Built With
This section should list any major frameworks that you built your project using. Leave any add-ons/plugins for the acknowledgements section. Here are a few examples.
* [Scala](http://www.scala-lang.org)
* [Karate](https://www.karatelabs.io/)

### Run

```sh
mvn gatling:test -Dgatling.simulationClass=scalaGatlingTestTrigger.UserStimulation
```

```sh
mvn clean test -P gatling  
```

