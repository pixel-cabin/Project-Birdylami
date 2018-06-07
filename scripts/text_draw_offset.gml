//////////////////////////////////////
//script: text_draw_offset(x,y,text,color,xoffset,yoffset);//
//////////////////////////////////////

var _x, _y, ttext, color, curcol, _xoff, _yoff;//initiates the variables
    _x = argument0;             //x position of where the text is drawn
    _y = argument1;             //y position of where the text is drawn
  ttext = argument2;             //text drawn
 color = argument3;             //color the text is drawn in
 _xoff = argument4;
 _yoff = argument5;
curcol = draw_get_color();      //stores the current color so we can use it later

draw_set_color(c_black);       //sets the color to the shadow (light gray)
draw_text(_x+_xoff,_y+_yoff,ttext);      //draws the "shadow"
draw_set_color(color);          //sets the color to the users choice
draw_text(_x,_y,ttext);          //draws the text
draw_set_color(curcol);         //sets the color to the color last used
