$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing
$code = @'
using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Runtime.InteropServices;
public class IrisIdle {
 const int W=80,H=112,S=4;
 static int[] art=new int[W*H];
 static double Clamp(double x,double a,double b){return Math.Max(a,Math.Min(b,x));}
 static double Ease(double x){x=Clamp(x,0,1);return x*x*(3-2*x);}
 static double Gesture(double t){return Ease((t-1.2)/.5)*(1-Ease((t-2.2)/.6));}
 static int Layer(int x,int y){
  if(x>=53 && y<=32){
   if(x>=53&&x<=63&&y>=21) return 7;
   if(x>=63&&x<=67&&y>=17&&y<=21)return 8;
   if(x>=66&&y>=27)return 9;
   if(x>=57&&x<=59&&y>=14&&y<=16)return 10;
  }
  if((x<32&&y<59)||(y<20&&x<41)) return 1;
  if(x>=32&&x<=52&&y>=18&&y<=39)return 4;
  if(x>51&&y>=33&&y<=56)return 5;
  if(y>=59&&y<91&&(x<38||x>50))return 2;
  if(y>=90)return 0;
  return 3;
 }
 static int BlinkPixel(int x,int y,int value,int frame){
  // Single visible eye: close with skin pixels, then draw a small eyelash line.
  int step=frame==67||frame==71?1:frame>=68&&frame<=70?2:0;
  if(step==0||x<42||x>44||y<25||y>28)return value;
  if(step==1&&y<27)return unchecked((int)0xffb56f40);
  if(step==2){
   if(y==27&&x>=42&&x<=44)return unchecked((int)0xff342035);
   return y<27?unchecked((int)0xffb56f40):unchecked((int)0xffc47b48);
  }
  return value;
 }
 public static void Run(string input,string folder){
  System.IO.Directory.CreateDirectory(folder);
  using(var src=new Bitmap(input))for(int y=0;y<H;y++)for(int x=0;x<W;x++)art[y*W+x]=src.GetPixel(x,y).ToArgb();
  using(var title=new Font("Consolas",16,FontStyle.Bold))
  using(var subtitle=new Font("Consolas",10))
  for(int f=0;f<96;f++){
   double t=f/24.0,phase=2*Math.PI*t/2.0,gesture=Gesture(t);
   double rise=-.50*(1-Math.Cos(phase));
   var pixels=new int[W*S*H*S];
   int[] order={1,2,0,3,4,5,7,8,9,10};
   foreach(int layer in order){
    for(int yy=0;yy<H*S;yy++)for(int xx=0;xx<W*S;xx++){
     double x=(xx+.5)/S,y=(yy+.5)/S,sx=x,sy=y;
     double a=0,cx=0,cy=0,dx=0,dy=0;
     switch(layer){
      case 0:break;
      case 1:
       sy=y-rise;
       sx=x-1.7*Math.Sin(phase-.8)*Math.Pow(Clamp((y-15)/43,0,1),1.5);
       break;
      case 2:
       sx=x-.65*Math.Sin(phase-1.1)*Clamp((y-60)/30,0,1);
       sy=y-rise*Clamp((90-y)/35,0,1);
       break;
      case 3: sy=y-rise*Clamp((85-y)/30,0,1);break;
      case 4: cx=43;cy=37;dy=rise;a=.014*gesture;break;
      case 5: cx=52;cy=45;dy=rise;a=-.075*gesture;break;
      case 7:cx=58.5;cy=26.5;dy=.45*Math.Sin(phase+.6)-.6*gesture;a=.06*gesture;break;
      case 8:cx=65;cy=19;dx=.55*Math.Sin(phase+.9);dy=.8*Math.Cos(phase+.9);break;
      case 9:cx=68;cy=29;dx=.55*Math.Sin(phase+3.2);dy=.8*Math.Cos(phase+3.2);break;
      case 10:cx=58;cy=15;dx=.45*Math.Sin(phase+4.9);dy=.65*Math.Cos(phase+4.9);break;
     }
     if(layer>=4){double tx=x-cx-dx,ty=y-cy-dy;sx=cx+Math.Cos(a)*tx+Math.Sin(a)*ty;sy=cy-Math.Sin(a)*tx+Math.Cos(a)*ty;}
     int ix=(int)Math.Floor(sx),iy=(int)Math.Floor(sy);
     if(ix<0||ix>=W||iy<0||iy>=H)continue;
     bool shoulderOverlap=layer==3&&Layer(ix,iy)==5&&ix<=55&&iy>=43&&iy<=49;
     if(Layer(ix,iy)!=layer&&!shoulderOverlap)continue;
     int p=art[iy*W+ix];if(((uint)p>>24)<128)continue;
     if(layer==4)p=BlinkPixel(ix,iy,p,f);
     pixels[yy*W*S+xx]=p;
    }
   }
   using(var sprite=new Bitmap(W*S,H*S,PixelFormat.Format32bppArgb)){
    var data=sprite.LockBits(new Rectangle(0,0,W*S,H*S),ImageLockMode.WriteOnly,PixelFormat.Format32bppArgb);
    Marshal.Copy(pixels,0,data.Scan0,pixels.Length);sprite.UnlockBits(data);
    sprite.Save(System.IO.Path.Combine(folder,"sprite_"+f.ToString("D3")+".png"));
    using(var canvas=new Bitmap(480,608))using(var g=Graphics.FromImage(canvas)){
     g.Clear(Color.FromArgb(7,15,28));
     g.DrawString("IRIS",title,Brushes.White,30,20);
     g.DrawString("SEARCH + INDEXING AI",subtitle,Brushes.LightSteelBlue,30,48);
     using(var b=new SolidBrush(Color.FromArgb(3,9,19)))g.FillEllipse(b,170,512,150,12);
     g.DrawImageUnscaled(sprite,80,100);
     g.DrawString("IDLE / MOTION STUDY 03",subtitle,Brushes.LightSteelBlue,30,568);
     canvas.Save(System.IO.Path.Combine(folder,"preview_"+f.ToString("D3")+".png"));
    }
   }
  }
 }
}
'@
Add-Type -TypeDefinition $code -ReferencedAssemblies @('System.Drawing.Common','System.Drawing.Primitives','System.Runtime.InteropServices','System.Private.Windows.Core','System.Private.Windows.GdiPlus')
[IrisIdle]::Run((Join-Path $PSScriptRoot '..\spritecook_iris_test\iris_idle_source.png'),(Join-Path $PSScriptRoot 'frames'))
