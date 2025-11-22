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
    current_dialogue = "I wake up before my alarm.";
    portrait_sprite = 0;
    global.dialogue_visible = true;
} else if (dialogue_stage == 0 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 1;
    dialogue_speaker = "Inner thought";
    current_dialogue = "Not because I'm rested. But because of the shouting.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 1 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 2;
    dialogue_speaker = "Mom";
    current_dialogue = "Why do you never listen?";
	portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 2 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 3;
    dialogue_speaker = "Dad";
    current_dialogue = "Oh, right because you're always so perfect!";
	portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 3 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 4;
    dialogue_speaker = "Inner thought";
    current_dialogue = "Their voices stab through the walls.";
	portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 4 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 5;
    dialogue_speaker = "Inner thought";
    current_dialogue = "I lie there for a moment, staring at the ceiling, letting that familiar hollow feeling spread through my chest.";
	portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 5 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 6;
    dialogue_speaker = "Inner thought";
    current_dialogue = "My alarm finally goes off—like it’s mocking me for thinking it could ever be the thing to wake me up.";
	portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 6 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 7;
    dialogue_speaker = "Inner thought";
    current_dialogue = "I get dressed, brush my hair, pack my bag, moving like I’m underwater.";
	portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 7 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    global.dialogue_visible = false;
    dialogue_stage = 8;
} else if (dialogue_stage == 8) {
    // Trigger MC Movement
    with (obj_MC) {
        target_x = self.x;
        target_y = 416;
        is_moving_automatically = true;
    }
    dialogue_stage = 9;
} else if (dialogue_stage == 9 && !global.dialogue_visible && !obj_MC.is_moving_automatically) {
    global.dialogue_visible = false;
    global.cutscene_active = false;
    room_goto(room_Day1_Scene2);
}