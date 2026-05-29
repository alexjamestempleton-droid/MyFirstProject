function get_zone_duration(zone_num) {
    switch (zone_num) {
        case 1: return 60;   // 1 minute
        case 2: return 90;
        case 3: return 120;
        case 4: return 150;
        case 5: return 180;  // 3 minutes
        default: return 60;
    }
}