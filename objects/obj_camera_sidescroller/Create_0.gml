/// @description
//camera
stanncam_init(400,270,1920,1080);
cam1 = new stanncam(obj_player_sidescroller.x,obj_player_sidescroller.y,global.game_w,global.game_h);
cam1.follow = obj_player_sidescroller;
cam1.room_constrain = true;

cam2 = cam1.clone();
cam2.follow = obj_player_sidescroller2;
cam2.set_size(global.game_w/2,global.game_h,0);

split_screen = false;

//pointer
zoom_text = cam1.zoom_amount

speed_mode = 1;
zoom_mode = 1;

game_res = 2;
gui_hires = false;
gui_res = 0;

resolutions = [
{ w:400 ,  h:400 }, //1:1
{ w:500 ,  h:250 }, //2:1
{ w:320 ,  h:180 }, //16:9
{ w:640 ,  h:360 },
{ w:1280 , h:720 },
{ w:1920 , h:1080 },
{ w:2560 , h:1440 }
]

lookahead = false;

surface = -1;