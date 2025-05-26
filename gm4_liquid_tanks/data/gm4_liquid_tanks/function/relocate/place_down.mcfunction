# @s = command block placed by "gm4_relocators:backwards_compatibility/place_down/replace_head"
# located at the command block (where the player head was)

execute if block ~ ~ ~ command_block[facing=east] run setblock ~ ~ ~ hopper[facing=east]
execute if block ~ ~ ~ command_block[facing=west] run setblock ~ ~ ~ hopper[facing=west]
execute if block ~ ~ ~ command_block[facing=south] run setblock ~ ~ ~ hopper[facing=south]
execute if block ~ ~ ~ command_block[facing=north] run setblock ~ ~ ~ hopper[facing=north]
execute if block ~ ~ ~ command_block[facing=down] run setblock ~ ~ ~ hopper[facing=down]

data merge block ~ ~ ~ {CustomName:{"translate":"container.gm4.liquid_tank.empty","fallback":"Empty Tank"}}
summon armor_stand ~ ~-.5 ~ {CustomName:"gm4_liquid_tank",Tags:["gm4_no_edit","gm4_liquid_tank"],NoGravity:1b,Marker:1b,Silent:1b,Invisible:1b,Invulnerable:1b,Small:1b,DisabledSlots:2039552,equipment:{head:{id:"minecraft:glass",count:1,components:{"minecraft:custom_model_data":"block/liquid_tank"}}}}
execute as @e[tag=gm4_liquid_tank,limit=1,distance=..0.3] run function gm4_liquid_tanks:init_tank_scores
playsound block.end_portal_frame.fill block @a[distance=..30] ~ ~ ~ 1 0.5
