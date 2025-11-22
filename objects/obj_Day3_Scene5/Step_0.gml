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
    current_dialogue = "During the short break between classes, I slip out to the side hallway where almost no one goes.";
    portrait_sprite = 0;
    global.dialogue_visible = true;
    reset_typewriter();
} else if (dialogue_stage == 0 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 1;
    dialogue_speaker = "Inner thought";
    current_dialogue = "I just need a second.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 1 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 2;
    dialogue_speaker = "Inner thought";
    current_dialogue = "My hands feel cold. My shoulders feel tight.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 2 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 3;
    dialogue_speaker = "Inner thought";
    current_dialogue = "I lean against the wall and close my eyes.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 3 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 4;
    dialogue_speaker = "Inner thought";
    current_dialogue = "And then—";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 4 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    global.dialogue_visible = false;
    dialogue_stage = 5;
} else if (dialogue_stage == 5) {
    with (obj_Teacher) {
        target_x = 274;
        target_y = self.y;
        is_moving_automatically = true;
    }
    dialogue_stage = 6;
} else if (dialogue_stage == 6 && !obj_Teacher.is_moving_automatically) {
    with (obj_Teacher) {
        target_x = self.x;
        target_y = obj_MC.y;
        is_moving_automatically = true;
    }
    dialogue_stage = 7;
} else if (dialogue_stage == 7 && !global.dialogue_visible && !obj_Teacher.is_moving_automatically) {
    dialogue_stage = 8;
    dialogue_speaker = "Teacher";
    current_dialogue = "Lia?";
    portrait_sprite = 0;
	global.dialogue_visible = true;
    reset_typewriter();
} else if (dialogue_stage == 8 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 9;
    dialogue_speaker = "Inner thought";
    current_dialogue = "I open my eyes to see my homeroom teacher standing a few feet away.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 9 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 10;
    dialogue_speaker = "Teacher";
    current_dialogue = "You’ve been quieter than usual lately. And you looked upset yesterday.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 10 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 11;
    dialogue_speaker = "Teacher";
    current_dialogue = "Is something going on at home?";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 11 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 12;
    dialogue_speaker = "Inner thought";
    current_dialogue = "My breath catches.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 12 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 13;
    global.dialogue_visible = false;
} else if (dialogue_stage == 13) {
    if (!choice_made && !choice_active) {
        choice_options = ["Admit you’ve been stressed, but keep it vague", "Say you’re fine / it’s nothing", "Get defensive and say it's personal"];
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
            dialogue_stage = 14;
        }
    }
} else if (dialogue_stage == 14 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 15;
    dialogue_speaker = "Teacher";
    current_dialogue = "Just remember, you don’t have to deal with things alone. We’re here if you need support.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 15 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 16;
    dialogue_speaker = "Inner thought";
    current_dialogue = "They leave me in the hallway, the echo of their kindness lingering a little too heavily.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 16 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    global.dialogue_visible = false;
    global.cutscene_active = false;
    room_goto(room_Day3_Scene6);
}