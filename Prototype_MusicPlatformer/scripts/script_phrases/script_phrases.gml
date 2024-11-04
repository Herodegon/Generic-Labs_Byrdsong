// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/* Phrase System
 * - Upon leveling up, the player is allowed to choose one of three randomly chosen phrases.
 * - Once the player has chosen the desired phrase, the phrase struct gets added to their
 *	 `availablePhrase` inventory and the struct is removed from the level list.
 */

#region Phrase Template
Phrase_Example = 
{
	name: "Quarter Note",					// Name of Special Move 
	noteType: NOTE_TYPE.SINGLENOTE,			// Type of Move
	object: obj_quarternote,				// Move Object
	sprite: spr_quarternote,				// Move Sprite
	combination: [NOTE_DIRECTION.DOWN,		// Inputs to Trigger Move
				  NOTE_DIRECTION.DOWNRIGHT,
				  NOTE_DIRECTION.RIGHT]	
}

#endregion

#region Phrases - Level 1
Phrases_Level1 = {
	quarternote: 
	{
			name: "Quarter Note",
			noteType: NOTE_TYPE.SINGLENOTE,
			object: obj_quarternote,
			sprite: spr_quarternote,
			combination: [NOTE_DIRECTION.DOWN,
						  NOTE_DIRECTION.DOWNRIGHT,
						  NOTE_DIRECTION.RIGHT]
	},
	
	bass:
	{
		name: "Bass",
		noteType: NOTE_TYPE.WAVENOTE,
		object: obj_wave,
		sprite: spr_wave,
		combination: [NOTE_DIRECTION.LEFT,
					  NOTE_DIRECTION.RIGHT,
					  NOTE_DIRECTION.DOWN]
	},
	
	opera:
	{
		name: "Opera",
		noteType: NOTE_TYPE.ECHONOTE,
		object: obj_wave,
		sprite: spr_wave,
		combination: [NOTE_DIRECTION.UP,
					  NOTE_DIRECTION.DOWN,
					  NOTE_DIRECTION.LEFT,
					  NOTE_DIRECTION.RIGHT]
	}
}

#endregion