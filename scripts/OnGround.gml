/// OnGround();

return place_meeting(x, y + 1, parSolid) || (place_meeting(x, y + 1, parJumpthrough ) && !place_meeting(x, y, parJumpthrough));
