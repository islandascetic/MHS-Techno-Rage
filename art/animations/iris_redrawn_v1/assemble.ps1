$ErrorActionPreference='Stop'
Add-Type -AssemblyName System.Drawing
$code=@'
using System;
using System.Drawing;
public class RegisterIris {
 public static void Run(string source,string output){
  System.IO.Directory.CreateDirectory(output);
  using(var sheet=new Bitmap(source)){
   var reference=new Bitmap(256,384);
   using(var g=Graphics.FromImage(reference))g.DrawImage(sheet,new Rectangle(0,0,256,384),new Rectangle(0,0,256,384),GraphicsUnit.Pixel);
   string report="frame,offset_x,offset_y,foot_mask_error\n";
   Bitmap heldFeet=null;
   for(int i=0;i<16;i++){
    using(var frame=new Bitmap(256,384)){
     using(var g=Graphics.FromImage(frame))g.DrawImage(sheet,new Rectangle(0,0,256,384),new Rectangle((i%4)*256,(i/4)*384,256,384),GraphicsUnit.Pixel);
     int bestX=0,bestY=0;double best=double.MaxValue;
     for(int dy=-6;dy<=6;dy++)for(int dx=-6;dx<=6;dx++){
      double score=0;
      for(int y=340;y<384;y++)for(int x=40;x<198;x++){
       var a=reference.GetPixel(x,y);
       int sx=x-dx,sy=y-dy;
       var b=sy<0||sy>=384||sx<0||sx>=256?Color.Transparent:frame.GetPixel(sx,sy);
       bool aa=a.A>160,bb=b.A>160;
       if(aa!=bb)score+=255;
       else if(aa)score+=(Math.Abs(a.R-b.R)+Math.Abs(a.G-b.G)+Math.Abs(a.B-b.B))/6.0;
      }
      if(score<best){best=score;bestX=dx;bestY=dy;}
     }
     report+=i+","+bestX+","+bestY+","+best.ToString("F1",System.Globalization.CultureInfo.InvariantCulture)+"\n";
     using(var registered=new Bitmap(280,416))using(var g=Graphics.FromImage(registered)){
      g.DrawImageUnscaled(frame,12+bestX,14+bestY);
      // A held drawing for stationary boots is standard frame animation:
      // it removes incidental generation changes without deforming any pose.
      if(i==0)heldFeet=registered.Clone(new Rectangle(0,348,280,68),registered.PixelFormat);
      for(int fy=0;fy<68;fy++)for(int fx=0;fx<280;fx++)registered.SetPixel(fx,348+fy,heldFeet.GetPixel(fx,fy));
      registered.Save(System.IO.Path.Combine(output,"sprite_"+i.ToString("D2")+".png"));
      using(var preview=new Bitmap(560,832))using(var pg=Graphics.FromImage(preview)){
       pg.Clear(Color.FromArgb(7,15,28));
       pg.InterpolationMode=System.Drawing.Drawing2D.InterpolationMode.NearestNeighbor;
       pg.PixelOffsetMode=System.Drawing.Drawing2D.PixelOffsetMode.Half;
       pg.DrawImage(registered,new Rectangle(0,0,560,832),new Rectangle(0,0,280,416),GraphicsUnit.Pixel);
       preview.Save(System.IO.Path.Combine(output,"preview_"+i.ToString("D2")+".png"));
      }
     }
    }
   }
   reference.Dispose();
   heldFeet.Dispose();
   System.IO.File.WriteAllText(System.IO.Path.Combine(output,"alignment.csv"),report);
  }
 }
}
'@
Add-Type -TypeDefinition $code -ReferencedAssemblies @('System.Drawing.Common','System.Drawing.Primitives','System.Private.Windows.Core','System.Private.Windows.GdiPlus')
[RegisterIris]::Run((Join-Path $PSScriptRoot 'iris_redrawn_sheet.png'),(Join-Path $PSScriptRoot 'frames'))
