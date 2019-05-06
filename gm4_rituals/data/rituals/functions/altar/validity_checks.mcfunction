#altar validity checks
#@s - @e[type=minecraft:area_effect_cloud,tag=gm4_rituals_altar]
#called by rituals:altar/check_clock

#check removal
tag @s remove gm4_rituals_altar_valid
execute if block ~1 ~-1 ~ #rituals:altar/stairs[half=bottom] if block ~-1 ~-1 ~ #rituals:altar/stairs[half=bottom] if block ~ ~-1 ~1 #rituals:altar/stairs[half=bottom] if block ~ ~-1 ~-1 #rituals:altar/stairs[half=bottom] if block ~1 ~-1 ~1 #rituals:altar/blocks if block ~1 ~-1 ~-1 #rituals:altar/blocks if block ~-1 ~-1 ~1 #rituals:altar/blocks if block ~-1 ~-1 ~-1 #rituals:altar/blocks if block ~1 ~ ~1 #rituals:altar/blocks if block ~1 ~ ~-1 #rituals:altar/blocks if block ~-1 ~ ~1 #rituals:altar/blocks if block ~-1 ~ ~-1 #rituals:altar/blocks if block ~1 ~1 ~1 #rituals:altar/walls if block ~1 ~1 ~-1 #rituals:altar/walls if block ~-1 ~1 ~1 #rituals:altar/walls if block ~-1 ~1 ~-1 #rituals:altar/walls if block ~1 ~2 ~1 #rituals:altar/slabs if block ~1 ~2 ~-1 #rituals:altar/slabs if block ~-1 ~2 ~1 #rituals:altar/slabs if block ~-1 ~2 ~-1 #rituals:altar/slabs if block ~1 ~2 ~ #rituals:altar/blocks if block ~-1 ~2 ~ #rituals:altar/blocks if block ~ ~2 ~1 #rituals:altar/blocks if block ~ ~2 ~-1 #rituals:altar/blocks if block ~1 ~3 ~ #rituals:altar/blocks if block ~-1 ~3 ~ #rituals:altar/blocks if block ~ ~3 ~1 #rituals:altar/blocks if block ~ ~3 ~-1 #rituals:altar/blocks run tag @s add gm4_rituals_altar_valid
execute unless entity @s[tag=gm4_rituals_altar_valid] run function rituals:altar/destroy

#water checks
tag @s remove gm4_rituals_altar_water
execute if block ~1 ~-1 ~ #rituals:altar/stairs[waterlogged=true] if block ~-1 ~-1 ~ #rituals:altar/stairs[waterlogged=true] if block ~ ~-1 ~1 #rituals:altar/stairs[waterlogged=true] if block ~ ~-1 ~-1 #rituals:altar/stairs[waterlogged=true] run tag @s add gm4_rituals_altar_water

#call rituals function tag
function #rituals:ritual_checks
