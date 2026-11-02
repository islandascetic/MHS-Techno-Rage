$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing
$code = @'
using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Runtime.InteropServices;
public class IdleMotion {
 const int W=384,H=512;
 static int Layer(int hero,int x,int y) {
  if(hero==0 && x>257 && y>140 && y<447) return 1;
  if(hero==1 && x>247 && y<174) return 1;
  if(hero==3 && x>260 && y<185) return 1;
  if(hero==5 && x>242 && y<160) return 1;
  if(hero==6) {
   if(x>260 && y<180) return 1;
   if(x<105 && y>205 && y<350) return 2;
   if(x>278 && y>218 && y<320) return 3;
  }
  if(hero==7 && x>235 && y<108) return 1;
  return 0;
 }
 static double Clamp(double v,double a,double b){return Math.Max(a,Math.Min(b,v));}
 static Bitmap ImageFrom(int[] pixels,int w,int h){
  var b=new Bitmap(w,h,PixelFormat.Format32bppArgb);
  var d=b.LockBits(new Rectangle(0,0,w,h),ImageLockMode.WriteOnly,PixelFormat.Format32bppArgb);
  Marshal.Copy(pixels,0,d.Scan0,pixels.Length); b.UnlockBits(d); return b;
 }
 public static void Run(string source,string output){
  System.IO.Directory.CreateDirectory(output);
  var sourceBitmap=new Bitmap(source);
  int[][] sprites=new int[8][];
  for(int h=0;h<8;h++){
   sprites[h]=new int[W*H];
   for(int y=0;y<H;y++)for(int x=0;x<W;x++){
    var c=sourceBitmap.GetPixel((h%4)*W+x,(h/4)*H+y);
    sprites[h][y*W+x]=c.ToArgb();
   }
  }
  sourceBitmap.Dispose();
  string[] names={"FARADAY","IRIS","REMEDY","ECHO","WRAITH","ATLAS","LUMEN","LAMBDA"};
  using(var font=new Font("Consolas",15,FontStyle.Regular))
  using(var small=new Font("Consolas",11,FontStyle.Regular))
  for(int frame=0;frame<64;frame++){
   var canvas=new Bitmap(1536,1064);
   using(var g=Graphics.FromImage(canvas)){
    g.Clear(Color.FromArgb(7,15,28));
    g.DrawString("FIREWALL  /  IDLE MOTION STUDY 02",small,Brushes.LightSteelBlue,30,12);
    for(int hero=0;hero<8;hero++){
     double phase=2*Math.PI*frame/64.0+hero*.73;
     int[] rendered=new int[W*H];
     for(int layer=0;layer<4;layer++){
      double dx=0,dy=0,angle=0,cx=300,cy=120;
      if(layer>0){
       if(hero==0){dx=0;dy=0;}
       else if(hero==1){dx=2*Math.Sin(phase);dy=3*Math.Cos(phase);cx=285;cy=125;angle=.025*Math.Sin(phase);}
       else if(hero==3){dx=3*Math.Sin(phase);dy=5*Math.Cos(phase);cx=310;cy=145;angle=.10*Math.Sin(phase);}
       else if(hero==5){dx=3*Math.Sin(phase);dy=7*Math.Cos(phase);cx=310;cy=85;angle=.025*Math.Sin(phase);}
       else if(hero==6){dx=3*Math.Sin(phase+layer);dy=6*Math.Cos(phase+layer);cx=layer==2?80:290;cy=layer==1?100:270;angle=.055*Math.Sin(phase+layer);}
       else if(hero==7){dx=0;dy=3*Math.Sin(phase);cx=290;cy=64;angle=.035*Math.Sin(phase);}
      }
      for(int y=0;y<470;y++)for(int x=10;x<W-10;x++){
       double sx=x,sy=y;
       if(layer==0){
        double weight=Clamp((448-y)/320.0,0,1);
        double amplitude=hero==0?2.1:hero==3?3.6:2.8;
        sy=y+amplitude*Math.Sin(phase)*weight;
        sx=x-.9*Math.Sin(phase)*weight;
        if(hero==4){
         sy=y+7*Math.Sin(phase);
         sx=x-1.5*Math.Cos(phase)-3*Math.Sin(phase*2-y*.022)*Clamp((y-170)/230.0,0,1);
        }
        if(hero==1 && x<176 && y<300){sx-=2.5*Math.Sin(phase-y*.022)*Clamp((y-90)/120.0,0,1);}
        if(hero==6 && x<180 && y<300){sx-=2*Math.Sin(phase-y*.025)*Clamp((y-90)/130.0,0,1);}
        if(hero==3 && x>180 && y<240){sx-=2*Math.Sin(phase-y*.02)*Clamp((y-65)/100.0,0,1);}
        if(hero==7 && y>230 && y<350){sx-=1.1*Math.Sin(phase-y*.025);}
       } else {
        double xx=x-cx-dx,yy=y-cy-dy;
        sx=cx+Math.Cos(angle)*xx+Math.Sin(angle)*yy;
        sy=cy-Math.Sin(angle)*xx+Math.Cos(angle)*yy;
       }
       int ix=(int)Math.Round(sx),iy=(int)Math.Round(sy);
       if(ix<0||ix>=W||iy<0||iy>=470||Layer(hero,ix,iy)!=layer)continue;
       int p=sprites[hero][iy*W+ix];
       if(((uint)p>>24)<32)continue;
       rendered[y*W+x]=p;
      }
     }
     using(var sprite=ImageFrom(rendered,W,H)){
      int ox=(hero%4)*W,oy=40+(hero/4)*H;
      using(var brush=new SolidBrush(Color.FromArgb(55,0,0,0))) g.FillEllipse(brush,ox+105,oy+448,180,12);
      g.DrawImageUnscaled(sprite,ox,oy);
      var sz=g.MeasureString(names[hero],font);
      g.DrawString(names[hero],font,Brushes.LightSteelBlue,ox+(W-sz.Width)/2,oy+481);
     }
    }
   }
   canvas.Save(System.IO.Path.Combine(output,"cast_"+frame.ToString("D3")+".png")); canvas.Dispose();
  }
 }
}
'@
Add-Type -TypeDefinition $code -ReferencedAssemblies @('System.Drawing.Common','System.Drawing.Primitives','System.Runtime.InteropServices','System.Private.Windows.Core','System.Private.Windows.GdiPlus')
[IdleMotion]::Run((Join-Path $PSScriptRoot 'idle_v2\cast_cutouts.png'),(Join-Path $PSScriptRoot 'idle_v2\frames'))
