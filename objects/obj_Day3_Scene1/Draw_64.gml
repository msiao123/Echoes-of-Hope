// DRAW GUI

// --- Fade from black
if (fade_alpha > 0) {
    draw_set_color(c_black);
    draw_set_alpha(fade_alpha);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
}

// --- Setup GUI dimensions
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();
var margin = 40;

// *** MODIFIED SECTION START ***
// I moved the text higher up (260 instead of 160) to make room for a taller box
var text_x = margin + 250; // Increased spacing (250) for the larger portrait
var text_y = gui_h - 230;  
var text_w = gui_w - (margin * 2) - 250; // Adjusted width math to match new spacing
var dialogue_height = 150 // DOUBLED the height (was 100)
// *** MODIFIED SECTION END ***

// =================================================================
// --- Dialogue Box Drawing ---
// =================================================================
if (global.dialogue_visible) {
    // ✅ SET THE FONT HERE
    draw_set_font(font_Dialogue);
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    // Draw semi-transparent background box
    draw_set_color(c_black);
    draw_set_alpha(0.6);
    draw_rectangle(text_x - 10, text_y - 30, text_x + text_w + 10, text_y + dialogue_height, false);
    draw_set_alpha(1);

    // Draw portrait only if there's a valid sprite
    if (portrait_sprite != -1) {
        var portrait_x = margin;
        // Adjusted portrait Y to align better with the new taller box
        var portrait_y = text_y - 20; 
        
        // *** INCREASED PORTRAIT SIZE ***
        var portrait_size = 185; // Increased from 140 to fill the new box

        var spr_w = sprite_get_width(portrait_sprite);
        var spr_h = sprite_get_height(portrait_sprite);

        draw_sprite_ext(
            portrait_sprite,
            0,
            portrait_x,
            portrait_y,
            portrait_size / spr_w,
            portrait_size / spr_h,
            0,
            c_white,
            1
        );
    }

    // Draw speaker name
    if (dialogue_speaker != "") {
        draw_set_color(c_yellow);
        draw_text(text_x, text_y - 25, dialogue_speaker + ":");
    }

    // Draw wrapped dialogue text
    draw_set_color(c_white);
    draw_text_ext(text_x, text_y + 10, displayed_text, -1, text_w); // Added +10 to Y for better spacing

    // Prompt to continue when typing is finished
    if (typewriter_index >= string_length(current_dialogue)) {
        draw_set_color(c_gray);
        // Moved the prompt down slightly to fit the new box height
        draw_text(gui_w - 170, text_y + dialogue_height - 30, "[Press SPACE]");
    }
}

// =================================================================
// --- Draw Choices (Bottom-Center Position) ---
// =================================================================
if (choice_active) {
    draw_set_font(font_Dialogue);

    var box_width = 500;
    var option_count = array_length(choice_options);
    var line_height = 40;
    var box_padding = 20;
    var box_height = (option_count * line_height) + (box_padding * 2);

    var bottom_margin = 40;
    var box_x = (gui_w / 2) - (box_width / 2);
    // Adjusted choice box to appear ABOVE the dialogue box if needed, or stick to bottom
    var box_y = gui_h - box_height - bottom_margin; 
    
    draw_set_color(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);
    draw_set_alpha(1);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    
    for (var i = 0; i < option_count; i++) {
        var option_text = choice_options[i];
        var text_x_pos = gui_w / 2;
        var text_y_pos = box_y + box_padding + (i * line_height);
        
        if (i == choice_selected) {
            option_text = "> " + option_text + " <";
            draw_set_color(c_white);
        } else {
            draw_set_color(c_gray);
        }
        
        draw_text(text_x_pos, text_y_pos, option_text);
    }
}

// =================================================================
// --- RESET FONT ---
// =================================================================
draw_set_font(-1);