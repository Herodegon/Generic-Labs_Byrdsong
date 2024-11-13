// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function DrawPhraseSelect(xPos,yPos,width,height,phrase)
{
	draw_set_color(c_aqua);
	draw_rectangle(xPos,yPos,width,height,false);
	draw_set_color(c_black);
	draw_rectangle(xPos,yPos,width,height,true);
}