Star[] star;
SpaceShip bob = new SpaceShip();
ArrayList <Asteroids> theList;
boolean leftIsPressed = false;
boolean rightIsPressed = false;
boolean upIsPressed = false;
boolean spaceIsPressed = false;
public void setup() 
{
  size(500,500);
  star = new Star[75];
  for(int i = 0;i<star.length;i++)
  {
  star[i] = new Star();  
  }
  theList = new ArrayList <Asteroids> ();
  for(int i = 0;i<7;i++)
  {
  theList.add(new Asteroids());  
  }

  
}
public void draw() 
{
  background(0);
  bob.show();
  bob.move();
  if(leftIsPressed==true){
  bob.rotate(-2);
  }
  if(rightIsPressed==true){
  bob.rotate(2);
  }
  if(upIsPressed==true){
  bob.accelerate(.05);
  }
  if(spaceIsPressed==true){
  bob.myCenterX = (int)(Math.random()*500)+1;
  bob.myCenterY = (int)(Math.random()*500)+1;
  bob.myDirectionX=0;
  bob.myDirectionY=0;
  }

  for(int i = 0;i<star.length;i++)
  {
  star[i].show();  
  }
  for(int i = 0;i<7;i++)
  {
  theList.get(i).show();  
  theList.get(i).move();
  }
  
  
}
class SpaceShip extends Floater  
{
  public SpaceShip()
  {
    corners=4;
    xCorners = new int [corners];   
    yCorners = new int [corners];   
    xCorners[0] = -8-1;
    yCorners[0] = -8-1;
    xCorners[1] = 16-1;
    yCorners[1] = 0-1;
    xCorners[2] = -8-1;
    yCorners[2] = 8-1;
    xCorners[3] = -2-1;
    yCorners[3] = 0-1;
    myColor=color(250,0,0);
    myCenterX = 250; 
    myCenterY = 250;   
    myDirectionX=0;
    myDirectionY=0; 
    myPointDirection=-50; 

  }

    public void setX(int x){myCenterX=x;}
    public int getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY=y;}
    public int getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX=x;}
    public double getDirectionX(){return myDirectionX;}
    public void setDirectionY(double y){myDirectionY=y;}
    public double getDirectionY(){return myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection=degrees;}
    public double getPointDirection(){return myPointDirection;} 
}
    

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }       
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0; 
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)

    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }
   
     
} 

public void keyPressed()
{
  if(keyCode==37)
  {
  leftIsPressed = true;  
  }
  else if(keyCode==39)
  {
  rightIsPressed = true;  
  }
  else if(keyCode ==38)
  {
  upIsPressed = true;  
  }
  else if(keyCode == 32)
  {
  spaceIsPressed = true;
  }  
  
}
public void keyReleased()
{
  if(keyCode==37)
  {
  leftIsPressed = false;  
  }
  else if(keyCode==39)
  {
  rightIsPressed = false;  
  }
  else if(keyCode ==38)
  {
  upIsPressed = false;  
  }
  else if(keyCode == 32)
  {
  spaceIsPressed = false; 
  }  
   
} 
class Star 
 {
  int x; 
  int y;
  Star()  
  {
    x=(int)(Math.random()*500)+1;
    y=(int)(Math.random()*500)+1;
  }
  void show()
  {
  fill(250,0,0);
  ellipse(x,y,2,2);  
  }
}

class Asteroids extends Floater
{
private int rotspeed;
  public Asteroids()
  {
  corners = 4;
  xCorners = new int [corners];
  yCorners = new int [corners]; 
  xCorners[0]=-5;
  yCorners[0]=-6;
  xCorners[1]=3;
  yCorners[1]=-6;
  xCorners[2]=6;
  yCorners[2]=5;
  xCorners[3]=-11;
  yCorners[3]=5;
  myColor=color(250,0,0);
  myCenterX = (int)(Math.random()*500)+1; 
  myCenterY = (int)(Math.random()*500)+1;   
  myDirectionX=(int)(Math.random()*10)-5;
  myDirectionY=(int)(Math.random()*10)-5;  
  rotspeed=(int)(Math.random()*10)+1;
  }
  public void setX(int x){myCenterX=x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY=y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX=x;}    public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY=y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection=degrees;}
  public double getPointDirection(){return myPointDirection;} 
  
  public void move()
  {
    super.move();
    myPointDirection+=rotspeed;
  }
}