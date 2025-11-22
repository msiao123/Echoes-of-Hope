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
    current_dialogue = "When I open my door, the shouting dies instantly.";
    portrait_sprite = 0;
    global.dialogue_visible = true;
} else if (dialogue_stage == 0 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 1;
    dialogue_speaker = "Inner thought";
    current_dialogue = "I walk out of my room, and there they are.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 1 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 2;
    dialogue_speaker = "Mom";
    current_dialogue = "Good morning, sweetheart.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 2 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 3;
    dialogue_speaker = "Dad";
    current_dialogue = "Morning. Did you sleep okay?";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 3 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 4;
    dialogue_speaker = "Inner thought";
    current_dialogue = "Their smiles are fake. Thin and trembling at the edges.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 4 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 5;
    global.dialogue_visible = false;
} else if (dialogue_stage == 5) {
    if (!choice_made && !choice_active) {
        choice_options = ["Ignore them", "Snap at them"];
        choice_selected = 0;
        choice_active = true;
        portrait_sprite = 0;
    } else if (choice_active) {
        if (keyboard_check_pressed(ord("S"))) choice_selected = (choice_selected + 1) % array_length(choice_options);
        if (keyboard_check_pressed(ord("W"))) choice_selected = (choice_selected - 1 + array_length(choice_options)) % array_length(choice_options);
        
        if (keyboard_check_pressed(ord("E"))) {
            choice_made = true;
            choice_active = false;
            dialogue_speaker = "You";
            portrait_sprite = 0;
            current_dialogue = choice_options[choice_selected];
            global.dialogue_visible = true;
            
            if (choice_selected == 0) global.player_mood += 0;
            else if (choice_selected == 1) global.player_mood -= 1;
            
            reset_typewriter();
            dialogue_stage = 6;
        }
    }
} else if (dialogue_stage == 6 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    global.dialogue_visible = false;
    dialogue_stage = 7;
} else if (dialogue_stage == 7 && !global.dialogue_visible) {
    dialogue_stage = 8;
    dialogue_speaker = "Inner thought";
    current_dialogue = "I head out the door with my chest feeling tight and heavy.";
    portrait_sprite = 0;
    global.dialogue_visible = true;
    reset_typewriter();
} else if (dialogue_stage == 8 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    global.dialogue_visible = false;
    dialogue_stage = 9;
} else if (dialogue_stage == 9) {
	with (obj_MC) {
        target_x = 576;
        target_y = 368;
        is_moving_automatically = true;
    }
    dialogue_stage = 10;
} else if (dialogue_stage == 10 && !obj_MC.is_moving_automatically) {
	with (obj_MC) {
        target_x = 400;
        target_y = self.y;
        is_moving_automatically = true;
    }
    dialogue_stage = 11;
} else if (dialogue_stage == 11 && !obj_MC.is_moving_automatically) {
	with (obj_MC) {
        target_x = self.x;
        target_y = 432;
        is_moving_automatically = true;
    }
    dialogue_stage = 12;
} else if (dialogue_stage == 12 && !global.dialogue_visible && !obj_MC.is_moving_automatically) {
    global.dialogue_visible = false;
    global.cutscene_active = false;
    room_goto(room_Day1_Scene3);
}
