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
    current_dialogue = "The school hallway is loud but its a normal loud. Not like home.";
    portrait_sprite = 0;
    global.dialogue_visible = true;
    reset_typewriter();
} else if (dialogue_stage == 0 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    global.dialogue_visible = false;
    dialogue_stage = 1;
} else if (dialogue_stage == 1) {
    // Trigger MC Movement
    with (obj_MC) {
        target_x = 350;
        target_y = self.y;
        is_moving_automatically = true;
    }
    dialogue_stage = 2;
} else if (dialogue_stage == 2 && !global.dialogue_visible && !obj_MC.is_moving_automatically) {
    // Wait for MC to stop, then dialogue
    dialogue_speaker = "Inner thought";
    current_dialogue = "Casey, a friend of mine, sees me almost immediately.";
    portrait_sprite = 0;
    global.dialogue_visible = true;
    reset_typewriter();
} else if (dialogue_stage == 2 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 3;
    dialogue_speaker = "Casey";
    current_dialogue = "Lia! Wait up!";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 3 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    global.dialogue_visible = false;
    dialogue_stage = 4;
} else if (dialogue_stage == 4) {
    // Trigger Casey Movement
    with (obj_Casey) {
        target_x = 300;
        target_y = obj_MC.y;
        is_moving_automatically = true;
    }
    dialogue_stage = 5;
} else if (dialogue_stage == 5 && !global.dialogue_visible && !obj_Casey.is_moving_automatically) {
    // Wait for Casey to stop, then dialogue
    dialogue_speaker = "Casey";
    current_dialogue = "Liaaa! Oh my gosh, today's the day. Test papers.";
    portrait_sprite = 0;
    global.dialogue_visible = true;
    reset_typewriter();
} else if (dialogue_stage == 5 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 6;
    dialogue_speaker = "Casey";
    current_dialogue = "If I fail, you’re legally required to carry me to the nurse. I don’t make the rules.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 6 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 7;
    dialogue_speaker = "Inner thought";
    current_dialogue = "I try to react, but whatever expression I give tells her something’s off.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 7 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 8;
    dialogue_speaker = "Casey";
    current_dialogue = "Hey… you okay?";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 8 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    global.dialogue_visible = false;
    dialogue_stage = 9;
} else if (dialogue_stage == 9) {
    // Choice Logic
    if (!choice_made && !choice_active) {
        choice_options = ["Keep quiet", "Snap at her"];
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
            dialogue_stage = 10; // Move to displaying the selected choice
        }
    }
} else if (dialogue_stage == 10 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    // Outro Dialogue
    dialogue_stage = 11;
    dialogue_speaker = "Inner thought";
    current_dialogue = "No matter what I say or don’t she walks with me to class, quietly sticking close.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 11 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    global.dialogue_visible = false;
    global.cutscene_active = false;
    room_goto(room_Day1_Scene4);
}