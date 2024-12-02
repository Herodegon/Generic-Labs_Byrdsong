/// @description Create GUI if player levels up
// You can write your code in this editor

var window_width = window_get_width();
var window_height = window_get_height();

display_set_gui_size(window_width,window_height);

var spacing_width = window_width/5;
var spacing_height = window_height/10;

if (instance_exists(obj_player) && array_length(phraseSelect) != 0)
{
	if (obj_player.canLevelUp)
	{
		draw_set_font(fnt_titleText);
		draw_set_halign(fa_center);
		var c1 = make_color_hsv(abs(cos(colorValue)*240),255,255);
		draw_text_color(window_width/2,spacing_height,"Inspiration! Choose A Phrase...",c1,c1,c1,c1,1);
		for (var i = 1; i <= array_length(phraseSelect); i++)
		{
			var rect_x1 = (spacing_width*i) + (sign(i-2)*(spacing_width/2));
			var rect_y1 = (window_height/4)+spacing_height;
			var rect_x2 = rect_x1 + (spacing_width);
			var rect_y2 = rect_y1 + (spacing_height*6);
			drawPhraseSelect(rect_x1,rect_y1,rect_x2,rect_y2,phraseSelect[i-1].phrase,phraseSelect[i-1].isSelected);
		}
		colorValue += 0.015%1;
	}
}