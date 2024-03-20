# process growing block displays every tick
# @s = block display (gm4_hy_builder.growing tag)
# at @s
# run from spell_trident/place_blocks/clock

scoreboard players add @s gm4_hy_timer 1
data merge entity @s[scores={gm4_hy_timer=1}] {Rotation:[0F,0F],start_interpolation:-1,interpolation_duration:4,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.501f,-0.501f,-0.501f],scale:[1.05f,1.05f,1.05f]}}
execute if score @s gm4_hy_timer matches 1 run playsound entity.puffer_fish.blow_up block @a ~ ~ ~ 0.8 1.3
execute if score @s gm4_hy_timer matches 2 run tag @e[type=block_display,tag=gm4_hy_builder.marker,tag=!gm4_hy_builder.growing,distance=..1.1] add gm4_hy_builder.growing
execute if score @s gm4_hy_timer matches 4 run playsound block.beehive.exit block @a ~ ~ ~ 1 0.8
execute if score @s gm4_hy_timer matches 5 as @e[type=marker,tag=gm4_hy_builder.command_storage,limit=1,sort=nearest] run function gm4_hydromancy:spell_trident/builder/place_blocks/complete_block
kill @s[scores={gm4_hy_timer=7..}]
