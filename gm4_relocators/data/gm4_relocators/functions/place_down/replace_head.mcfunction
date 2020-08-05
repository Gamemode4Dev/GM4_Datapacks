# @s = player who placed a relocated block player head
# run from advancement "place_relocated_block"

advancement revoke @s only gm4_relocators:place_relocated_block

tag @s add gm4_rl_placed_relocated_block

summon area_effect_cloud ~ ~ ~ {Duration:1,Particle:"block air",Tags:["gm4_rl_relocation_data"]}
data modify entity @e[type=area_effect_cloud,tag=gm4_rl_relocation_data,limit=1,distance=..0.1] Tags append from entity @s SelectedItem.tag.gm4_relocation_data.Command

# check for relocated block heads
function #gm4_relocators:place_down
