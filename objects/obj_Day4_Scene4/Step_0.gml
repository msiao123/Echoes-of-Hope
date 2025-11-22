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
    current_dialogue = "The professor stands at the front with stacks of papers, looking more serious than usual.";
    portrait_sprite = 0;
    global.dialogue_visible = true;
    reset_typewriter();
} else if (dialogue_stage == 0 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 1;
    dialogue_speaker = "Professor";
    current_dialogue = "Before we start, I need to announce something important.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 1 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 2;
    dialogue_speaker = "Inner thought";
    current_dialogue = "Everyone quiets down immediately.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 2 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 3;
    dialogue_speaker = "Professor";
    current_dialogue = "Your next major assessment is tomorrow. It will cover everything from this unit.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 3 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 4;
    dialogue_speaker = "Inner thought";
    current_dialogue = "My heart drops.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 4 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 5;
    dialogue_speaker = "Inner thought";
    current_dialogue = "Tomorrow. A major test. The worst possible timing.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 5 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 6;
    dialogue_speaker = "Inner thought";
    current_dialogue = "The professor continues:";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 6 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 7;
    dialogue_speaker = "Professor";
    current_dialogue = "I want all of you to do your best. If anyone feels unprepared or overwhelmed, talk to me after class.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 7 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 8;
    dialogue_speaker = "Inner thought";
    current_dialogue = "I stare at my desk, feeling my pulse quicken. Of course this would happen now.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 8 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 9;
    dialogue_speaker = "Inner thought";
    current_dialogue = "Casey glances at me.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 9 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 10;
    dialogue_speaker = "Casey";
    current_dialogue = "We can study after school… seriously. You don't have to do this alone.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 10 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 11;
    global.dialogue_visible = false;
} else if (dialogue_stage == 11) {
    if (!choice_made && !choice_active) {
        choice_options = ["Agree to study with her", "Say maybe, depending on how you feel", "Reject her offer / say you’re fine"];
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
    current_dialogue = "The lesson begins, but I barely absorb any of it.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 13 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    global.dialogue_visible = false;
    global.cutscene_active = false;
    room_goto(room_Day4_Scene5);
}