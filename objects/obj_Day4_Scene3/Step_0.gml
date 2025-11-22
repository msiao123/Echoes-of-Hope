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
    current_dialogue = "The hallway is loud as usual.";
    portrait_sprite = 0;
    global.dialogue_visible = true;
    reset_typewriter();
} else if (dialogue_stage == 0 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 1;
    dialogue_speaker = "Inner thought";
    current_dialogue = "Students talk in clusters along the walls, some laughing, some trading snacks, some rushing to print things last-minute.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 1 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 2;
    dialogue_speaker = "Inner thought";
    current_dialogue = "I’m walking toward class when—";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 2 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
	global.dialogue_visible = false;
    dialogue_stage = 3;
} else if (dialogue_stage == 3) {
    with (obj_MC) {
        target_x = 350;
        target_y = self.y;
        is_moving_automatically = true;
    }
    dialogue_stage = 4;
} else if (dialogue_stage == 4 && !global.dialogue_visible && !obj_MC.is_moving_automatically) {
    dialogue_stage = 5;
    dialogue_speaker = "Casey";
    current_dialogue = "Lia! Wait!";
	global.dialogue_visible = true;
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 5 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    global.dialogue_visible = false;
    dialogue_stage = 6;
} else if (dialogue_stage == 6) {
    with (obj_Casey) {
        target_x = 300;
        target_y = obj_MC.y;
        is_moving_automatically = true;
    }
    dialogue_stage = 7;
} else if (dialogue_stage == 7 && !global.dialogue_visible && !obj_Casey.is_moving_automatically) {
    dialogue_stage = 8;
    dialogue_speaker = "Inner thought";
    current_dialogue = "I stop and turn. Casey reaches me, out of breath.";
    portrait_sprite = 0;
	global.dialogue_visible = true;
    reset_typewriter();
} else if (dialogue_stage == 8 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 9;
    dialogue_speaker = "Casey";
    current_dialogue = "Hey… you okay after yesterday? You seemed really out of it.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 9 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 10;
    dialogue_speaker = "Inner thought";
    current_dialogue = "Her eyes search mine, worried.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 10 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 11;
    global.dialogue_visible = false;
} else if (dialogue_stage == 11) {
    if (!choice_made && !choice_active) {
        choice_options = ["Tell her it’s been rough at home", "Say you’re fine, just tired again", "Tell her to drop it, you don’t want to talk"];
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
            
            if (choice_selected == 0) global.player_mood += 1;
            else if (choice_selected == 1) global.player_mood += 0;
            else if (choice_selected == 2) global.player_mood -= 1;
            
            reset_typewriter();
            dialogue_stage = 12;
        }
    }
} else if (dialogue_stage == 12 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 13;
    dialogue_speaker = "Inner thought";
    current_dialogue = "Casey nods, reacting carefully depending on my answer. She walks with me to class, silent but staying close.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 13 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    global.dialogue_visible = false;
    global.cutscene_active = false;
    room_goto(room_Day4_Scene4);
}