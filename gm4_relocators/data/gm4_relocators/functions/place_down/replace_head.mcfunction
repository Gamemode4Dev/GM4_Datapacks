# @s = player who placed a relocated block player head
# run from advancement "place_relocated_block"

advancement revoke @s only gm4_relocators:place_relocated_block

tag @s add gm4_rl_placed_relocated_block

summon area_effect_cloud ~ ~ ~ {Duration:1,Particle:"block air",Tags:["gm4_rl_relocation_data"]}
data modify entity @e[type=area_effect_cloud,tag=gm4_rl_relocation_data,limit=1,distance=..0.1] Tags append from entity @s SelectedItem.tag.gm4_relocation_data.Command

# replace default relocated block head
fill ~-6 ~-5 ~-6 ~6 ~7 ~6 command_block[facing=east]{auto:1,Command:"execute as @e[type=area_effect_cloud,tag=gm4_rl_relocation_data,limit=1,sort=nearest,distance=..10] run function gm4_relocators:place_down/place_block"} replace player_wall_head[facing=west]{Owner:{Id:"d345e705-da05-481c-b34a-01f17a4e0d7c"}}
fill ~-6 ~-5 ~-6 ~6 ~7 ~6 command_block[facing=west]{auto:1,Command:"execute as @e[type=area_effect_cloud,tag=gm4_rl_relocation_data,limit=1,sort=nearest,distance=..10] run function gm4_relocators:place_down/place_block"} replace player_wall_head[facing=east]{Owner:{Id:"d345e705-da05-481c-b34a-01f17a4e0d7c"}}
fill ~-6 ~-5 ~-6 ~6 ~7 ~6 command_block[facing=south]{auto:1,Command:"execute as @e[type=area_effect_cloud,tag=gm4_rl_relocation_data,limit=1,sort=nearest,distance=..10] run function gm4_relocators:place_down/place_block"} replace player_wall_head[facing=north]{Owner:{Id:"d345e705-da05-481c-b34a-01f17a4e0d7c"}}
fill ~-6 ~-5 ~-6 ~6 ~7 ~6 command_block[facing=north]{auto:1,Command:"execute as @e[type=area_effect_cloud,tag=gm4_rl_relocation_data,limit=1,sort=nearest,distance=..10] run function gm4_relocators:place_down/place_block"} replace player_wall_head[facing=south]{Owner:{Id:"d345e705-da05-481c-b34a-01f17a4e0d7c"}}
fill ~-6 ~-5 ~-6 ~6 ~7 ~6 command_block[facing=down]{auto:1,Command:"execute as @e[type=area_effect_cloud,tag=gm4_rl_relocation_data,limit=1,sort=nearest,distance=..10] run function gm4_relocators:place_down/place_block"} replace player_head{Owner:{Id:"d345e705-da05-481c-b34a-01f17a4e0d7c"}}

# check for other relocated block heads
function #gm4_relocators:place_down
