var _dialogue_friend = DialogueFriend();

//_dialogue_friend.set_default_npc_state({
//	first_time_talking: true,
//});

_dialogue_friend.set_character_data("Player",
	{
		name: "Me",
		pitch: 1.3,
	}
);

_dialogue_friend.set_character_data("Fisherman",
	{
		name: "Fisherman",
		talk_sprite: spr_npc_fish_talk,
		idle_sprite: spr_npc_fisherman,
		pitch: .6,
	}
);
_dialogue_friend.set_character_data("Granny",
	{
		name: "Granny",
		talk_sprite: spr_npc_granny_talk,
		idle_sprite: spr_npc_granny,
		pitch: .3,
	}
);
_dialogue_friend.set_character_data("Artist",
	{
		name: "Artist",
		talk_sprite: spr_npc_artist_talk,
		idle_sprite: spr_npc_artist,
		pitch: 2,
	}
);

//show_message(_dialogue_friend.get_character_data("Luano"));
//show_message(_dialogue_friend.get_conversation_sequence("DIALOGUE SEQUENCE 1"));