# cast the builder spell at trident landing location
# @s = spell trident
# at @s
# run from spell_trident/process_slow

# store off-hand block id
execute on origin run data modify storage gm4_hydromancy builder.block_id set from entity @s Inventory[{Slot:-106b}].id

# process mana
scoreboard players set @s gm4_hy_mana_used 1
function gm4_hydromancy:spell_trident/update_mana

# spawn a marker facing the wall that should be build on
scoreboard players set $builder.ori_found gm4_hy_data 0
execute unless block ~ ~-0.05 ~ #gm4:no_collision align xyz store success score $builder.ori_found gm4_hy_data run summon marker ~.5 ~.5 ~.5 {Tags:["gm4_hy_builder.marker","gm4_hy_builder.new"],Rotation:[0F,90F]}
execute if score $builder.ori_found gm4_hy_data matches 0 unless block ~ ~0.05 ~ #gm4:no_collision align xyz store success score $builder.ori_found gm4_hy_data run summon marker ~.5 ~.5 ~.5 {Tags:["gm4_hy_builder.marker","gm4_hy_builder.new"],Rotation:[0F,-90F]}
execute if score $builder.ori_found gm4_hy_data matches 0 unless block ~-0.05 ~ ~ #gm4:no_collision align xyz store success score $builder.ori_found gm4_hy_data run summon marker ~.5 ~.5 ~.5 {Tags:["gm4_hy_builder.marker","gm4_hy_builder.new"],Rotation:[90F,0F]}
execute if score $builder.ori_found gm4_hy_data matches 0 unless block ~0.05 ~ ~ #gm4:no_collision align xyz store success score $builder.ori_found gm4_hy_data run summon marker ~.5 ~.5 ~.5 {Tags:["gm4_hy_builder.marker","gm4_hy_builder.new"],Rotation:[-90F,0F]}
execute if score $builder.ori_found gm4_hy_data matches 0 unless block ~ ~ ~-0.05 #gm4:no_collision align xyz store success score $builder.ori_found gm4_hy_data run summon marker ~.5 ~.5 ~.5 {Tags:["gm4_hy_builder.marker","gm4_hy_builder.new"],Rotation:[-180F,0F]}
execute if score $builder.ori_found gm4_hy_data matches 0 unless block ~ ~ ~0.05 #gm4:no_collision align xyz run summon marker ~.5 ~.5 ~.5 {Tags:["gm4_hy_builder.marker","gm4_hy_builder.new"],Rotation:[0F,0F]}

execute as @e[type=marker,tag=gm4_hy_builder.new,limit=1] at @s run function gm4_hydromancy:spell_trident/builder/process_spell

# cleanup
data remove storage gm4_hydromancy:temp builder
