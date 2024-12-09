// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function getDirectionSprite(dir,isGUI)
{
	var sprite;
	switch (dir)
	{
		case NOTE_DIRECTION.RIGHT:
			if (isGUI) {sprite = spr_right_gui;}
			else {sprite = spr_right;}
			break;
		case NOTE_DIRECTION.DOWN: 
			if (isGUI) {sprite = spr_down_gui;}
			else {sprite = spr_down;}
			break;
		case NOTE_DIRECTION.LEFT: 
			if (isGUI) {sprite = spr_left_gui;}
			else {sprite = spr_left;}
			break;
		case NOTE_DIRECTION.UP: 
			if (isGUI) {sprite = spr_up_gui;}
			else {sprite = spr_up;}
			break;
		case NOTE_DIRECTION.NONE:
			if (isGUI) {sprite = spr_plus_gui;}
			else {sprite = spr_plus;}
			break;
	}
	return sprite;
};

function drawTimer(posX,posY)
{
	var minute = int64(global.gameTimer/(60*MILLISECONDS));
	var second = (global.gameTimer%(60*MILLISECONDS))/MILLISECONDS;
	draw_set_font(fnt_descText);
	draw_set_color(c_black);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	var stringTime = string("{0}:{1}",minute,second);
	draw_text(posX,posY,stringTime);
	return stringTime;
};

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

function drawPhraseAnim(xPos,yPos,phrase)
{
	var canDraw = true;
	if (instance_exists(phrase.object)) 
	{
		with (phrase.object)
		{
			if (isGuiObject)
			{
				canDraw = false;
				break;
			}
		}
	}
	
	if (canDraw)
	{
		if (phrase.noteType == NOTE_TYPE.WAVENOTE) {yPos *= 1.1;}
		var obj = instance_create_layer(xPos,yPos,"Instances",phrase.object);
		obj.isGuiObject = true;
		switch (phrase.noteType)
		{ 
			case NOTE_TYPE.SINGLENOTE:
				obj.moveVector_x = 1;
				obj.despawnTimer = 1*MILLISECONDS;
				break;
			case NOTE_TYPE.WAVENOTE:
				obj.moveDir = NOTE_DIRECTION.UP;
				obj.canMove = false;
				break;
			case NOTE_TYPE.ECHONOTE:
				obj.canMove = false;
				obj.isDespawnSet = false;
				break;
		}
	}
};

function drawInputCombo(xPos,yPos,combo,isGUI)
{
	var comboSprites = [];
	for (var i = 0; i < array_length(combo); i++)
	{
		var inputDir = combo[i];
		if (inputDir == NOTE_DIRECTION.DOWNRIGHT || inputDir == NOTE_DIRECTION.DOWNLEFT)
		{
			if (inputDir == NOTE_DIRECTION.DOWNRIGHT)
			{
				array_push(comboSprites,getDirectionSprite(NOTE_DIRECTION.RIGHT,isGUI));
			}
			else
			{
				array_push(comboSprites,getDirectionSprite(NOTE_DIRECTION.LEFT,isGUI));
			}
			array_push(comboSprites,getDirectionSprite(NOTE_DIRECTION.NONE,isGUI));
			array_push(comboSprites,getDirectionSprite(NOTE_DIRECTION.DOWN,isGUI));
		}
		else if (inputDir == NOTE_DIRECTION.UPRIGHT || inputDir == NOTE_DIRECTION.UPLEFT)
		{
			if (inputDir == NOTE_DIRECTION.UPRIGHT)
			{
				array_push(comboSprites,getDirectionSprite(NOTE_DIRECTION.RIGHT,isGUI));
			}
			else
			{
				array_push(comboSprites,getDirectionSprite(NOTE_DIRECTION.LEFT,isGUI));
			}
			array_push(comboSprites,getDirectionSprite(NOTE_DIRECTION.NONE,isGUI));
			array_push(comboSprites,getDirectionSprite(NOTE_DIRECTION.UP,isGUI));
		}
		else
		{
			array_push(comboSprites,getDirectionSprite(inputDir,isGUI));
		}
	}
	
	var spriteWidth = sprite_get_width(comboSprites[0]);
	for (var i = 0; i < array_length(comboSprites); i++)
	{
		draw_sprite(comboSprites[i],0,xPos+(spriteWidth*i),yPos);
	}
}

function drawPhraseSelect(xPos1,yPos1,xPos2,yPos2,phrase,isSelected)
{
	#region Draw Window
	var width = xPos2-xPos1;
	var height = yPos2-yPos1;
	var padding = width/16;
	
	if (isSelected) {draw_set_color(c_yellow);}
	else {draw_set_color(c_dkgray);}
	draw_rectangle(xPos1,yPos1,xPos2,yPos2,false);
	var windowColor = #797fbb;
	draw_set_color(windowColor);
	draw_rectangle(xPos1+padding,yPos1+padding,xPos2-padding,yPos2-padding,false);
	
	#endregion
	
	#region Draw Phrase Title
	var spacing_v = height/9;
	draw_set_font(fnt_headerText);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	var headerSize = font_get_size(fnt_headerText);
	draw_text_ext(xPos1+(width/2),yPos1+(spacing_v),phrase.name,headerSize*1.5,width);
	#endregion
	
	#region Draw Phrase Animation
	var objPosX = xPos1;
	var objPosY = yPos1 + spacing_v*3;
	if (phrase.noteType == NOTE_TYPE.SINGLENOTE)
	{
		objPosX += padding*2;
	}
	else
	{
		objPosX += width/2;
	}
	drawPhraseAnim(objPosX,objPosY,phrase);
	
	#endregion
	
	#region Draw Description
	draw_set_font(fnt_descText);
	draw_set_halign(fa_left);
	var descSize = font_get_size(fnt_descText);
	draw_text_ext(xPos1+(padding*1.5),yPos1+(spacing_v*5),phrase.desc,descSize*1.5,width-(padding*2.5));
	var levelDesc = string("Level: {0}",phrase.currLevel);
	draw_text_ext(xPos1+(padding*1.5),yPos1+(spacing_v*7),levelDesc,descSize*1.5,width-(padding*2.5));
	drawInputCombo(xPos1+(padding*1.5),yPos1+(spacing_v*8),phrase.combination,true);
	#endregion
};