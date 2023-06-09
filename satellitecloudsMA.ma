[top]
components : cloudSys 
out : cell330 cell880
link : outport1@cloudSys cell330
link : outport2@cloudSys cell880

[cloudSys]
type : cell
dim : (10,10,3)
delay : transport
defaultDelayTime  : 100
border : wrapped 
neighbors : cloudSys(-1,-1,0) cloudSys(-1,0,0) cloudSys(-1,1,0) 
neighbors : cloudSys(0,-1,0)  cloudSys(0,0,0)  cloudSys(0,1,0)
neighbors : cloudSys(1,-1,0)  cloudSys(1,0,0)  cloudSys(1,1,0)
neighbors : cloudSys(-1,-1,1) cloudSys(-1,0,1) cloudSys(-1,1,1) 
neighbors : cloudSys(0,-1,1)  cloudSys(0,0,1)  cloudSys(0,1,1)
neighbors : cloudSys(1,-1,1)  cloudSys(1,0,1)  cloudSys(1,1,1)
neighbors : cloudSys(-1,-1,2) cloudSys(-1,0,2) cloudSys(-1,1,2) 
neighbors : cloudSys(0,-1,2)  cloudSys(0,0,2)  cloudSys(0,1,2)
neighbors : cloudSys(1,-1,2)  cloudSys(1,0,2)  cloudSys(1,1,2)

initialcellsvalue : satelliteclouds.val
initialvalue : 0

out : outport1 outport2
link : out@cloudSys(3,3,0) outport1
link : out@cloudSys(8,8,0) outport2

localtransition : moveCloud

portInTransition : out@cloudSys(3,3,0) cloudoutput 
portInTransition : out@cloudSys(8,8,0) cloudoutput 


[moveCloud]
rule : { 
	if ( round ( 
		(0,0,0) * (1- (0,0,1) ) +
		if( (1,0,2) = 2 , (1,0,0) * (1,0,1) , 0) +
		if( (1,0,2) = 3 , 0.25 * (1,0,0) * (1,0,1) , 0) +
		if( (1,0,2) = 1 , 0.25 * (1,0,0) * (1,0,1) , 0) +
		if( (1,-1,2) = 3 , 0.5 * (1,-1,0) * (1,-1,1) , 0) +
		if( (0,-1,2) = 4 , (0,-1,0) * (0,-1,1) , 0) +
		if( (0,-1,2) = 3 , 0.25 * (0,-1,0) * (0,-1,1) , 0) +
		if( (0,-1,2) = 5 , 0.25 * (0,-1,0) * (0,-1,1) , 0) +
		if( (-1,-1,2) = 5 , 0.5 * (-1,-1,0) * (-1,-1,1) , 0) +
		if( (-1,0,2) = 6 , (-1,0,0) * (-1,0,1) , 0) +
		if( (-1,0,2) = 5 , 0.25 * (-1,0,0) * (-1,0,1) , 0) +
		if( (-1,0,2) = 7 , 0.25 * (-1,0,0) * (-1,0,1) , 0) +
		if( (-1,1,2) = 7 , 0.5 * (-1,1,0) * (-1,1,1) , 0) +
		if( (0,1,2) = 0 , (0,1,0) * (0,1,1) , 0) +
		if( (0,1,2) = 1 , 0.25 * (0,1,0) * (0,1,1) , 0) +
		if( (0,1,2) = 7 , 0.25 * (0,1,0) * (0,1,1) , 0) +
		if( (1,1,2) = 1 , 0.5 * (1,1,0) * (1,1,1) , 0) 
	) > 100, 100, round ( 
		(0,0,0) * (1- (0,0,1) ) +
		if( (1,0,2) = 2 , (1,0,0) * (1,0,1) , 0) +
		if( (1,0,2) = 3 , 0.25 * (1,0,0) * (1,0,1) , 0) +
		if( (1,0,2) = 1 , 0.25 * (1,0,0) * (1,0,1) , 0) +
		if( (1,-1,2) = 3 , 0.5 * (1,-1,0) * (1,-1,1) , 0) +
		if( (0,-1,2) = 4 , (0,-1,0) * (0,-1,1) , 0) +
		if( (0,-1,2) = 3 , 0.25 * (0,-1,0) * (0,-1,1) , 0) +
		if( (0,-1,2) = 5 , 0.25 * (0,-1,0) * (0,-1,1) , 0) +
		if( (-1,-1,2) = 5 , 0.5 * (-1,-1,0) * (-1,-1,1) , 0) +
		if( (-1,0,2) = 6 , (-1,0,0) * (-1,0,1) , 0) +
		if( (-1,0,2) = 5 , 0.25 * (-1,0,0) * (-1,0,1) , 0) +
		if( (-1,0,2) = 7 , 0.25 * (-1,0,0) * (-1,0,1) , 0) +
		if( (-1,1,2) = 7 , 0.5 * (-1,1,0) * (-1,1,1) , 0) +
		if( (0,1,2) = 0 , (0,1,0) * (0,1,1) , 0) +
		if( (0,1,2) = 1 , 0.25 * (0,1,0) * (0,1,1) , 0) +
		if( (0,1,2) = 7 , 0.25 * (0,1,0) * (0,1,1) , 0) +
		if( (1,1,2) = 1 , 0.5 * (1,1,0) * (1,1,1) , 0) 
	))

} 1000 { cellpos(2) = 0 } 

rule : {(0,0,0)} 1000 { t }


[cloudoutput]
rule : { (0,0,0) } 1000 { t }
