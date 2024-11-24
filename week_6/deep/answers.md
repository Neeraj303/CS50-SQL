# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

The data have equally like chance to end on any of the boat
The query need to run on all the boats since the data can end up on any of the 3 boat.

## Partitioning by Hour

The observation will not like be evenly distributed since we have spcified the time we will find data on Boat A.
The researcher need to run query only on an single boat since the data is distributed by time, and we can the query on Boat A.

## Partitioning by Hash Value

Yes, the data will be evenly distributed since the hash function assign value to each timestamp randomly and the probability of getting a speicfied hash value would be 1/1500.
We need to query all boats since the data is evenly distributed.
With the defined timestamp we can find the hash value and look for the corresponding boat.
