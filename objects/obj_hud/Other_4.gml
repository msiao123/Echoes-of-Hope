switch (room) {
    case room_Day1_Scene1:
        message = "Bedroom";
        break;
		
	case room_Day1_Scene2:
        message = "Living Room";
        break;
		
	case room_Day1_Scene3:
        message = "School Hallway";
        break;
		
	case room_Day1_Scene4:
        message = "Classroom";
        break;
}

show_timer = (message != "") ? show_duration : 0;

if (message != "") {
    show_timer = show_duration;
}