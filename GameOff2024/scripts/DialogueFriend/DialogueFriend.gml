// Feather disable all
/*

	Dialogue Manager

*/

DialogueFriend();

function DialogueFriend(){
	static _dialogue_manager = __init_dialogue_friend();
	
	var _wrapper = new DialogueFriendWrapper(_dialogue_manager);
	
	return _wrapper;
}
