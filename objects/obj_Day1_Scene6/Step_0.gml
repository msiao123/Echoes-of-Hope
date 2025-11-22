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
    dialogue_stage = 1;
    dialogue_speaker = "Inner thought";
    current_dialogue = "Eventually I escaped to my room, closing the door quietly behind me.";
    portrait_sprite = 0;
	global.dialogue_visible = true;
    reset_typewriter();
} else if (dialogue_stage == 1 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 2;
    dialogue_speaker = "Inner thought";
    current_dialogue = "I let my back slide against the wall until I’m sitting on the floor, knees pulled close.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 2 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 3;
    dialogue_speaker = "Inner thought";
    current_dialogue = "It’s only then I realize… I’ve been holding my breath all day.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 3 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    global.dialogue_visible = false;
    global.cutscene_active = false;
    room_goto(room_Day2);
}