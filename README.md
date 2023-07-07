# Traffic Theory Programming

This task was created to get a feeling about the programming skills of the applicants.

The following picture shows an ASDA/FOTO traffic pattern for 2009-12-10 located on Highway A5 in the Federal State of Hessen. Such traffic patterns are visualized in a time-space diagram. That means that x-axis indicates the time (in this example from 6 a.m. to 11 a.m.) and the y-axis shows the road segment from kilometer 90 to kilometer 115 (in this example). The traffic phase of wide moving jam is color in red, synchronized traffic in yellow. Further only the phase of wide moving jam is relevant.

![](Aspose.Words.00c35188-912d-4c29-bfac-0f4496545b8c.001.png)

If a car drives through a jam, the jam has two fronts. The next figure illustrates that each jam has two jam fronts: upstream front (first front if one is driving towards the jam) and downstream front (end of the jam seen from the point of a driver).

Direction of travel

Upstream jam front

Downstream jam front
![](Aspose.Words.00c35188-912d-4c29-bfac-0f4496545b8c.002.png)

The three phase traffic theory states that the mean speed of the downstream jam front is relatively constant at about -15 km/h and the velocity of the upstream front depends on the inflow. That statement should be examined by automatically creating a diagram that shows absolute distribution of both jam fronts.

*Steps:*

1. Create a MySQL database on your local computer. This database should contain one table *trafficobjects* which should be created according to the structure that is described the next section of this document
1. A set of example data is attached in the file *trafficobjectdata.sql*
1. Choose an arbitrary programming or scripting language (e.g. Java, C#, C/C++, Python, …)
1. Create a program that queries your local MySQL database and calculates the absolute distribution of both jam fronts. Thereby the front velocities should be rounded to integer values and then the number of each different front velocity should be counted.
1. Create a line chart (automatically or manual) that show the calculated distributions

*Database structure and description*

All ASDA/FOTO traffic patterns are stored in a database table *trafficobjects*. Each traffic pattern is compound of many traffic objects (e.g. ideally one connected wide moving jam is one traffic object). For each minute the actual start and end position of the wide moving jam is stored in a extra row of the database table.

The following MySQL statement describes the structure of the table *trafficobjects:*

CREATE TABLE `trafficobjects` (

`  ``Identifier` int(11) NOT NULL AUTO\_INCREMENT,

`  ``SITUATION` varchar(255) COLLATE latin1\_general\_ci NOT NULL,

`  ``Type` varchar(50) COLLATE latin1\_general\_ci DEFAULT NULL,

`  ``ObjectId` int(11) DEFAULT NULL,

`  ``Road` int(11) DEFAULT NULL,

`  ``Date` date DEFAULT NULL,

`  ``Time` time DEFAULT NULL,

`  ``UpStreamPos` int(11) DEFAULT NULL,

`  ``DownStreamPos` int(11) DEFAULT NULL,

`  ``UpStreamSpeed` double DEFAULT NULL,

`  ``DownStreamSpeed` double DEFAULT NULL,

`  ``TrafficSpeed` double DEFAULT NULL,

`  ``QLKW` float DEFAULT NULL,

`  ``Timestamp` datetime DEFAULT NULL,

`  ``SumDeltaQ` int(11) DEFAULT NULL,

`  `PRIMARY KEY (`Identifier`),

) 

Description of all columns:

The column *Identifier* is a unique ID for each row.

The column *SITUTATION* describes the origin of measurements (always stationary detectors in this example)

The column type names the traffic phase according to Kerner’s Three Phase Traffic theory (always jam in this example).

The column *objectId* is a unique identifier for each row that belongs to the same traffic object. 

The column *road* describes the ID of the road (always 29 here).

The columns *date*, time and timestamp contains the creation time of the data set

The column *Upstreampos* contains the current logical position of the jam's upstream front. All logical positions display the distance regarding to the start of the road in meters.

The column *downstreampos* contains the current logical position of the jam's downstream front.

The column *upstreamspeed* contains the current velocity of the upstream jam front in kilometers per hour.

The column *downstreamspeed* contains the current velocity of the downstream jam front in kilometers per hour.

The column *TrafficSpeed* is not filled for jam traffic objects, because in this case cars are driving slowly.

The column *qLKW* describes the amount of trucks.

The column *SumDeltaQ* can be ignored.

*Results*

The following diagram shows the possible result of your program. The diagram shows how often each front velocity (rounded to integer) occurs within the traffic pattern. Both jam fronts will be distinguished.

![](Aspose.Words.00c35188-912d-4c29-bfac-0f4496545b8c.003.png)

*What should be given back to Daimler?*

Please send us the output of your program (diagram of front velocity frequencies) as well as your entire source code, input files, external libraries that are needed to run your program. It not necessary to send us the MySQL example data set again.

Please send an English text describing how you explain the resulting diagram of the front velocities (e.g. description of result, possible explanation, consequences, etc…). In addition, please explain in a short text your program.

