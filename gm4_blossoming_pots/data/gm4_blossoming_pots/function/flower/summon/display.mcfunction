# uses macro data from temp storage and summons a block display
# @s = temp marker inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with storage gm4_blossoming_pots:flower_pots temp
# run from flower/summon/loop

$summon minecraft:block_display ~ ~ ~ {view_range:0.7935f,Tags:["gm4_blossoming_pots.display.flower_pot","gm4_blossoming_pots.display.flower_pot.$(number)","smithed.entity"],Rotation:[$(marker)f,0f]}
