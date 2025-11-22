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
    current_dialogue = "When classes end, Casey finds me again.";
    portrait_sprite = 0;
    global.dialogue_visible = true;
    reset_typewriter();
} else if (dialogue_stage == 0 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    global.dialogue_visible = false;
    dialogue_stage = 1;
} else if (dialogue_stage == 1) {
    with (obj_Casey) {
        target_x = obj_MC.x - 50;
        target_y = self.y;
        is_moving_automatically = true;
    }
    dialogue_stage = 2;
} else if (dialogue_stage == 2 && !global.dialogue_visible && !obj_Casey.is_moving_automatically) {
    dialogue_stage = 3;
    dialogue_speaker = "Casey";
    current_dialogue = "Hey… test tomorrow. We should study. Even if it’s just for an hour.";
	global.dialogue_visible = true;
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 3 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 4;
    dialogue_speaker = "Inner thought";
    current_dialogue = "My phone buzzes.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 4 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 5;
    dialogue_speaker = "Mom";
    current_dialogue = "Come home early. We need to talk as a family.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 5 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 6;
    dialogue_speaker = "Inner thought";
    current_dialogue = "My stomach twists again.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 6 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 7;
    dialogue_speaker = "Inner thought";
    current_dialogue = "The weight of everything crashes down.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 7 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 8;
    dialogue_speaker = "Inner thought";
    current_dialogue = "Casey watches my expression change.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 8 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 9;
    dialogue_speaker = "Casey";
    current_dialogue = "You… don’t have to rush home if it’s too much. But I’ll go with you if you want. Or we can stay out here and study. Whatever helps.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 9 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 10;
    dialogue_speaker = "Inner thought";
    current_dialogue = "Her voice is steady. She’s trying to be the anchor I can’t be for myself.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 10 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 11;
    global.dialogue_visible = false;
} else if (dialogue_stage == 11) {
    if (!choice_made && !choice_active) {
        choice_options = ["Study with Casey outside", "Go home immediately", "Tell Casey to stop worrying / push her away"];
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
    current_dialogue = "Regardless of the choice, I eventually spend a few minutes outside alone — watching the sky turn orange, listening to the voices fade as students go home.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 13 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 14;
    dialogue_speaker = "Inner thought";
    current_dialogue = "Just… breathing.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 14 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    global.dialogue_visible = false;
    global.cutscene_active = false;
    room_goto(room_Day4_Scene7);
}