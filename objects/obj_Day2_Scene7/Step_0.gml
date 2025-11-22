// Fade in Logic
if (fade_alpha > 0) {
    fade_alpha -= 0.02;
}

// Typewriter and Skip Typewriter Logic
if (global.dialogue_visible) {
    var total_dialogue_length = string_length(current_dialogue);
    
    if (typewriter_index < total_dialogue_length) {
        if (keyboard_check_pressed(vk_space)) {
            typewriter_index = total_dialogue_length;
            exit;
        }

        typewriter_counter += 1;
        
        if (typewriter_counter >= typewriter_speed) {
            typewriter_counter = 0;
            typewriter_index = min(typewriter_index + 1, total_dialogue_length);
            displayed_text = string_copy(current_dialogue, 1, typewriter_index);
        }
    }

    displayed_text = string_copy(current_dialogue, 1, typewriter_index);
} else {
    typewriter_index = 0;
    displayed_text = "";
    typewriter_counter = 0;
}

// Dialogue
if (dialogue_stage == 0 && !global.dialogue_visible) {
    dialogue_speaker = "Inner thought";
    current_dialogue = "When I finally get home, the house feels… heavy, but quieter than usual.";
    portrait_sprite = 0;
    global.dialogue_visible = true;
    reset_typewriter();
} else if (dialogue_stage == 0 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 1;
    dialogue_speaker = "Inner thought";
    current_dialogue = "Mom and Dad are in the living room, quietly watching the television.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 1 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 2;
    dialogue_speaker = "Inner thought";
    current_dialogue = "Neither says anything about the earlier text. Neither forces a conversation.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 2 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 3;
    dialogue_speaker = "Mom";
    current_dialogue = "You’ve had a long day. Why don’t you rest for a bit?";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 3 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 4;
    dialogue_speaker = "Dad";
    current_dialogue = "We can talk tomorrow";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 4 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 5;
    dialogue_speaker = "Inner thought";
    current_dialogue = "I nod, quietly grateful.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 5 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
	global.dialogue_visible = false;
    dialogue_stage = 6;
} else if (dialogue_stage == 6) {
    with (obj_MC) {
        target_x = self.x;
        target_y = 368;
        is_moving_automatically = true;
    }
    dialogue_stage = 7;
} else if (dialogue_stage == 7 && !obj_MC.is_moving_automatically) {
    with (obj_MC) {
        target_x = 576;
        target_y = self.y;
        is_moving_automatically = true;
    }
    dialogue_stage = 8;
} else if (dialogue_stage == 8 && !obj_MC.is_moving_automatically) {
    with (obj_MC) {
        target_x = 608;
        target_y = 304;
        is_moving_automatically = true;
    }
    dialogue_stage = 9;
} else if (dialogue_stage == 9 && !global.dialogue_visible && !obj_MC.is_moving_automatically) {
    global.cutscene_active = false;
    room_goto(room_Day2_Scene8)
}