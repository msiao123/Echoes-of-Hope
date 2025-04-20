if (place_meeting(x, y, obj_protag)) {
            obj_protag.x = xPosition;
            obj_protag.y = yPosition;
            room_goto(roomName);
}