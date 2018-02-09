Design Desitions.
To avoid the unorganized code and to simplify the code analisys for new developers, I decided to separete the functionality in 3 main layers:
- The WEB SERVICE layer: Dedicated to define the WS resources for the required operations.
- The LOGIC layer: Dedicated to execute all tte main logic operations. Since the example exercise is a little simple. This layer in this case does not have too much logic on it.
- The DAO (Data base conexion) layer: This layer contains all the methods related to querys and connections to the database.

Deploy
Execute the "schedule.sql" script located in the "Database" folder
The project was built in maven. To compile the project is neccesary yo have maven and point to the maven repository. Also, to deploy the project it will be neccesary to have a Server Application. In this case I used Glassfish.

Unit testing
The unit testing are focused in two layers. The Logic layer and the database layer. In the database layer I tested the DB connection and the correct function for the DAO methods. 
In the logic tests I used DAO mocks to simulate the functionality for the DAO class.