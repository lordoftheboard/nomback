#Nominierung and Data-Quit xxxx
#BGVs können Nominierungen für BGs abgeben
#Versionen werden gecheckt
#Data Quits werden erzeugt
#Daten sind richtig im System abgespeichert

Feature: Nominierung and Data-Quit xxx

Background: 
Given the following topology exists
|Punkt |Richtung | Capacity      |
|BG	  |Exit     | 100 		    |
|BG	  |Entry    | 50 		    |
|ARNO  |Exit     | 100 		    |
|ARNO  |Entry    | 0 		    |

And the following assigned capacities exist
|BG	  	|Punkt 		|Richtung 	| Firm Capacity 	| Interruptible Capacity 	|
|BG1	  	|BG			|Exit     	| 10				| 0						|
|BG1		|BG			|Entry    	| 10				| 0						|
|BG1		|ARNO		|Exit     	| 10				| 0						|
|BG1 	|ARNO		|Entry    	| 10				| 0						|


Scenario: simple nomination of firm capacity with OK dataquit

Given the above mentioned toopology and capacities exist

And the following nominations already exist
|BG		|Point	|Direction	|Quantity	|Version	|
|BG1		|ARNO	|Exit		|10		|1		|

When the following nominations for BG1 are transmitted
|Point	|Direction	|Quantity	|Version	|
|ARNO	|Exit		|10		|2		|
|BG		|Entry		|10		|2		|

Then the dataquit status should be as follows
|Point	|Direction	|Quantity	|Version	| DATA QUIT STATUS 	|
|ARNO	|Exit		|10		|2		| OK				|
|BG		|Entry		|10		|2		| OK				|

And the following nomination exist in the system
|BG		|Point	|Direction	|Quantity	|Version	|
|BG1		|ARNO	|Exit		|10		|1		|
|BG1		|ARNO	|Exit		|10		|2		|
|BG1		|BG		|Entry		|10		|2		|




Scenario: simple nomination with negative data quit

Given the above mentioned toopology and capacities exist

And the following nominations already exist
|BG		|Point	|Direction	|Quantity	|Version	|
|BG1		|ARNO	|Exit		|10		|2		|

When the following nominations for BG1 are transmitted
|Point	|Direction	|Quantity	|Version	|
|ARNO	|Exit		|10		|1		|
|BG		|Entry		|10		|1		|

Then the dataquit status should be as follows
|Point	|Direction	|Quantity	|Version	| DATA QUIT STATUS 	|
|ARNO	|Exit		|10		|2		| NOK			|
|BG		|Entry		|10		|2		| NOK			|

And the following nomination exist in the system
|BG		|Point	|Direction	|Quantity	|Version	|
|BG1		|ARNO	|Exit		|10		|2		|


