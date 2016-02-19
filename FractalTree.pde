private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);  
	stroke(0,255,0);
 
	line(320,480,320,380);   

	drawBranches(320,380,100,3*Math.PI/2);  //will add later 
} 
public void mouseMoved(){
    if(mouseX>320)
    	branchAngle = .4;
    if(mouseY>240)
    	branchAngle = .1;
}

public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	//your code here  
	double angle1 = angle + branchAngle, angle2 = angle - branchAngle;
	branchLength = branchLength*fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1)+x);
	int endX2 = (int)(branchLength*Math.cos(angle2)+x);
	int endY1 = (int)(branchLength*Math.sin(angle1)+y);
	int endY2 = (int)(branchLength*Math.sin(angle2)+y);
	
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);

	if(branchLength>smallestBranch){
		int rColor = (int) (Math.random() * 255);
	    int gColor = (int) (Math.random() * 255);
	    int bColor = (int) (Math.random() * 255);
	    stroke(rColor,gColor,bColor);
 		drawBranches(endX1,endY1,branchLength*0.9,angle-1);
		drawBranches(endX2,endY2,branchLength*0.9,angle+1);
		
	}
}


