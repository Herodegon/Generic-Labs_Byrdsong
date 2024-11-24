// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function DrawPhraseSelect(xPos,yPos,width,height,phrase)
{
	draw_set_color(c_aqua);
	draw_rectangle(xPos,yPos,width,height,false);
	draw_set_color(c_black);
	draw_rectangle(xPos,yPos,width,height,true);
}

function DrawProgressBar(xPos,yPos,width,maxProgress,currProgress,colorCurr,colorMax=c_black)
{
	var rect_x1 = xPos-(width/2);
	var rect_y1 = yPos+(width/2);
	var rect_x2 = xPos+(width/2);
	var rect_y2 = rect_y1+(width/8);
	draw_set_color(colorMax);
	draw_rectangle(rect_x1,rect_y1,rect_x2,rect_y2,false);
			
	if (currProgress > 0)
	{
		var widthCurr = ((rect_x2-rect_x1)/maxProgress)*currProgress;
		draw_set_color(colorCurr);
		draw_rectangle(rect_x1,rect_y1,rect_x1+widthCurr,rect_y2,false);
	}	
}