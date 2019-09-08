float[] array ={30.0,10.0,50.0,40.0,20.0};
int size=160;
int delayt=20;
int[] state;
void setup(){
  size(1200,600);

  array = new float[size];
  state = new int[size];
  for(int i=0;i<size;i++){
    array[i]= random(10,height-20); 
    state[i]=0;
  }
noLoop();
}

void swap(float a[],int p1,int p2){
  float temp=a[p1];
  a[p1]=a[p2];
  a[p2]=temp;
  return;
}

void mousePressed(){
  thread("d");
 
}
void d(){
  quickSort(array,0,size-1);
}


 public void quickSort(float a[],int start,int end){
  if(start>end){
    return;
  }
 //<>// //<>//
  int p=divide(a,start,end); //<>//
  delay(delayt);
  state[p]=2;
  redraw();
  delay(delayt);
  for(int i=0;i<size;i++){
    state[i]=0;
  }

  redraw();
  delay(delayt);
  quickSort(a,start, p-1);
  quickSort( a, p+1, end);

  redraw();
}
 

int divide(float a[],int start,int end){   
  int pi=start-1;
  float p=a[end];
 for(int i=start;i<end;i++){
   
   if(pi>=0)state[pi]=0;
   state[pi+1]=1;
   state[end]=2;
   state[i]=3;
   
     redraw();
      delay(delayt);
      state[i]=0;
     if(a[i]<p){
      pi++;
      swap(a,pi,i);
     } 
 }
 swap(a,pi+1,end);
 return pi+1; 
}


void render(){
  
 delay(delayt);
  background(51);
  int posy=height-20;
  int posx=100;
  for(int i=0;i<size;i++){ 
    if(state[i]==1)fill(0,255,0);
    else if(state[i]==2)fill(255,0,0);
    else if(state[i]==3)fill(0,0,255);
     else fill(255);
    rect(posx,posy,5,-array[i]);
    posx+=6;
   } 
}



void draw(){
render();
}
