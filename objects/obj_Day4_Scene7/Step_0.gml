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
    current_dialogue = "When I get home, the lights are on but the mood is dim.";
    portrait_sprite = 0;
    global.dialogue_visible = true;
    reset_typewriter();
} else if (dialogue_stage == 0 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 1;
    dialogue_speaker = "Inner thought";
    current_dialogue = "Mom and Dad sit on opposite sides of the living room, not looking at each other.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 1 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 2;
    dialogue_speaker = "Mom";
    current_dialogue = "Lia… sit down. We need to talk.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 2 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    global.dialogue_visible = false;
    dialogue_stage = 3;
} else if (dialogue_stage == 3) {
    with (obj_MC) {
        target_x = self.x;
        target_y = 368;
        is_moving_automatically = true;
    }
    dialogue_stage = 4;
} else if (dialogue_stage == 4 && !obj_MC.is_moving_automatically) {
    with (obj_MC) {
        target_x = obj_Mother.x;
        target_y = self.y;
        is_moving_automatically = true;
    }
    dialogue_stage = 5;
} else if (dialogue_stage == 5 && !obj_MC.is_moving_automatically) {
    with (obj_MC) {
        target_x = self.x;
        target_y = 320;
        is_moving_automatically = true;
    }
    dialogue_stage = 6;
} else if (dialogue_stage == 6 && !global.dialogue_visible && !obj_MC.is_moving_automatically) {
    dialogue_stage = 7;
    dialogue_speaker = "Dad";
    current_dialogue = "We’re not deciding anything tonight. But we need to be honest.";
    portrait_sprite = 0;
    global.dialogue_visible = true;
    reset_typewriter();
} else if (dialogue_stage == 7 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 8;
    dialogue_speaker = "Inner thought";
    current_dialogue = "My heart hammers.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 8 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 9;
    dialogue_speaker = "Mom";
    current_dialogue = "Your father and I… we’ve been trying. But we’re not sure if staying together is helping anymore.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 9 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 10;
    dialogue_speaker = "Inner thought";
    current_dialogue = "Her voice cracks.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 10 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 11;
    dialogue_speaker = "Mom";
    current_dialogue = "We don’t want to hurt you. But pretending everything is fine is hurting all of us.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 11 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 12;
    dialogue_speaker = "Inner thought";
    current_dialogue = "Dad runs a hand through his hair.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 12 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 13;
    dialogue_speaker = "Dad";
    current_dialogue = "We’re considering… taking a break. Separating for a while.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 13 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 14;
    dialogue_speaker = "Inner thought";
    current_dialogue = "The words slice into me.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 14 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 15;
    dialogue_speaker = "Inner thought";
    current_dialogue = "My breath slips out shakily.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 15 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 16;
    dialogue_speaker = "Mom";
    current_dialogue = "Nothing is final. We want to do this the right way. And we want you to feel safe.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 16 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 17;
    dialogue_speaker = "Dad";
    current_dialogue = "We’re telling you now because you deserve the truth.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 17 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 18;
    dialogue_speaker = "Inner thought";
    current_dialogue = "I nod slowly.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 18 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    dialogue_stage = 19;
    dialogue_speaker = "Inner thought";
    current_dialogue = "I don’t trust my voice enough to speak.";
    portrait_sprite = 0;
    reset_typewriter();
} else if (dialogue_stage == 19 && keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
    global.dialogue_visible = false;
    global.cutscene_active = false;
    room_goto(room_Day4_Scene8);
}