////////////////////////////////////////////////
//script: text_draw_ext(x,y,text,color,sep,w);//
////////////////////////////////////////////////
var _x, _y, ttext, color, sep, w, curcol;//initiates the variables
    _x = argument0;             //x position of where the text is drawn
    _y = argument1;             //y position of where the text is drawn
  ttext = argument2;             //text drawn
 color = argument3;             //color the text is drawn in
 sep = argument4;
 w = argument5;
curcol = draw_get_color();      //stores the current color so we can use it later

draw_set_color(c_black);       //sets the color to the shadow (light gray)
draw_text_ext(_x+1,_y+1,ttext,sep,w);      //draws the "shadow"
draw_set_color(color);          //sets the color to the users choice
draw_text_ext(_x,_y,ttext,sep,w);          //draws the text
draw_set_color(curcol);         //sets the color to the color last used
