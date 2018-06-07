//newChat(message, portrait);
var sent = argument0;
var portrait = argument1;

var ttext = instance_create(0, 0, obj_dialogue);

ttext.portrait = portrait;
for (i = 0; i < array_length_1d(sent); i++)
{
    ttext.message[i] = sent[i];
}
