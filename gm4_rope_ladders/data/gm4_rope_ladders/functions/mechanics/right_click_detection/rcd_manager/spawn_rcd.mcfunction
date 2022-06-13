# spawns a baby villager that handles right click detection
# @s = player holding ladder
# at position of ladder block, align xyz positioned ~.5 ~ ~.5 (varies based on rotation)
# run from function: gm4_rope_ladders:mechanics/right_click_detection/detect_ladder_raycast/found

# spawn rcd
summon villager ~ ~100 ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,NoAI:1b,Age:-2147483648,Tags:["gm4_rol_rcd","gm4_rol_rcd_ladder","smithed.entity","smithed.strict"],ActiveEffects:[{Id:14,Amplifier:0b,Duration:999999,ShowParticles:0b}],Offers:{}}
execute positioned ~ ~100 ~ run tp @e[type=villager,tag=gm4_rol_rcd_ladder,dx=0] ~ ~-100 ~

# start loop
function gm4_rope_ladders:mechanics/right_click_detection/rcd_manager/loop
