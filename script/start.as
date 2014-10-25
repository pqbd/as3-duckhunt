var xmlData:XML = new XML( '<list>'
                         +'<entry><url>swf/intro-1.swf</url><width>550</width><height>400</height><duration>4000</duration><scale>1</scale></entry>'
                         +'<entry><url>swf/intro-0.swf</url><width>550</width><height>400</height><duration>17000</duration><scale>1</scale></entry>'
                         +'<entry><url>duckhunt_l.swf</url><play>2</play><duration>-1</duration></entry>'
                         +'</list>'
                         );

//--------------------------------
import alx.common.util.CEntryRotator;
var rotator:CEntryRotator = new CEntryRotator();
rotator.rotate( root.parent
              , xmlData.entry
              );