// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function drawProgressBar(xPos,yPos,width,maxProgress,currProgress,colorCurr,colorMax=c_black)
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
};

function drawPhraseAnim(xPos,yPos,phraseObj)
{
	if (!instance_exists(phraseObj)) 
	{
		var obj = instance_create_layer(xPos,yPos,"Instances",phraseObj);
		obj.canMove = false;
		obj.depth = -9;
	}
};

function drawPhraseSelect(xPos1,yPos1,xPos2,yPos2,phrase)
{
	var width = xPos2-xPos1;
	var height = yPos2-yPos1;
	var padding = width/16;
	draw_set_color(c_dkgray);
	draw_rectangle(xPos1,yPos1,xPos2,yPos2,false);
	draw_set_color(c_aqua);
	draw_rectangle(xPos1+padding,yPos1+padding,xPos2-padding,yPos2-padding,false);
	
	draw_set_font(fnt_gameText);
	draw_set_color(c_white);
	draw_text(xPos1+(padding*2),yPos1+(padding*2),phrase.name);
	drawPhraseAnim(xPos1+(width/2),yPos1+(height/6)*2,phrase.object);
};