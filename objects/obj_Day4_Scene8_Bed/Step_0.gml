// In obj_interactive_door -> Step Event

// Check distance between the door and the player (in pixels)
// < 30 means "if the player is within 30 pixels of this door"
if (distance_to_object(obj_MC) < 30) {
    player_is_close = true;
} else {
    player_is_close = false;
}

// If player is close AND presses E
if (player_is_close && keyboard_check_pressed(ord("E"))) {
    room_goto(room_Day5);
}