# @s = armor_stand to be modified
# at @s
# run from book/hold and toggle/arms/arms

tag @s add gm4_bas_no_arms

# place wandering_trader inside armor_stand to detect right click
summon minecraft:wandering_trader ~ ~-10000 ~ {CustomName:'"gm4_bas_detect_rightclick"',Tags:["smithed.entity","smithed.strict","gm4_trader","gm4_bas_arms_detect"],Team:"gm4_bas",Silent:1b,NoAI:1b,Invulnerable:1b,Offers:{},ActiveEffects:[{Id:14,Amplifier:0b,Duration:10000000,ShowParticles:0b}]}
execute positioned ~ ~-10000 ~ run tp @e[type=wandering_trader,tag=gm4_bas_arms_detect,distance=..1,sort=nearest,limit=1] @s

# start check loop to remove wandering_trader
schedule function gm4_better_armour_stands:toggle/arms/check 16t
