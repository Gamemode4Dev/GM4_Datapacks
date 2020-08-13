# @s = player who placed a relocator player head
# run from advancement "place_relocator"

advancement revoke @s only gm4_relocators:place_relocator

tag @s add gm4_rl_placed_relocator

fill ~-6 ~-5 ~-6 ~6 ~7 ~6 command_block[facing=east]{auto:1,CustomName:'{"text":"Relocator"}',Command:"execute as @p[tag=gm4_rl_placed_relocator,distance=..10] positioned ~1 ~ ~ run function gm4_relocators:pick_up/find_machine"} replace player_wall_head[facing=west]{SkullOwner:{Id:[I;739224026,-1192800770,-2115274619,-970102126]}}
fill ~-6 ~-5 ~-6 ~6 ~7 ~6 command_block[facing=west]{auto:1,CustomName:'{"text":"Relocator"}',Command:"execute as @p[tag=gm4_rl_placed_relocator,distance=..10] positioned ~-1 ~ ~ run function gm4_relocators:pick_up/find_machine"} replace player_wall_head[facing=east]{SkullOwner:{Id:[I;739224026,-1192800770,-2115274619,-970102126]}}
fill ~-6 ~-5 ~-6 ~6 ~7 ~6 command_block[facing=south]{auto:1,CustomName:'{"text":"Relocator"}',Command:"execute as @p[tag=gm4_rl_placed_relocator,distance=..10] positioned ~ ~ ~1 run function gm4_relocators:pick_up/find_machine"} replace player_wall_head[facing=north]{SkullOwner:{Id:[I;739224026,-1192800770,-2115274619,-970102126]}}
fill ~-6 ~-5 ~-6 ~6 ~7 ~6 command_block[facing=north]{auto:1,CustomName:'{"text":"Relocator"}',Command:"execute as @p[tag=gm4_rl_placed_relocator,distance=..10] positioned ~ ~ ~-1 run function gm4_relocators:pick_up/find_machine"} replace player_wall_head[facing=south]{SkullOwner:{Id:[I;739224026,-1192800770,-2115274619,-970102126]}}
fill ~-6 ~-5 ~-6 ~6 ~7 ~6 command_block[facing=down]{auto:1,CustomName:'{"text":"Relocator"}',Command:"execute as @p[tag=gm4_rl_placed_relocator,distance=..10] positioned ~ ~-1 ~ run function gm4_relocators:pick_up/find_machine"} replace player_head{SkullOwner:{Id:[I;739224026,-1192800770,-2115274619,-970102126]}}
