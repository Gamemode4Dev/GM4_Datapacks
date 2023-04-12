# cast the builder spell at trident landing location
# @s = spell trident
# at @s
# run from spell_trident/on_land/try_cast

# process mana
scoreboard players set @s gm4_hy_mana_used 1
function gm4_hydromancy:spell_trident/update_mana

# get block id and count
data modify storage gm4_hydromancy:temp builder.block_id set from entity @s Passengers[0].Item.id
execute store result score $builder.blocks_left gm4_hy_data run data get entity @s Passengers[0].Item.Count
data modify storage gm4_hydromancy:temp builder.stored_command set from entity @s Trident.tag.gm4_hy_spell_trident.stored_command

# spawn a marker facing the wall that should be build on
scoreboard players set $builder.ori_found gm4_hy_data 0
execute unless block ~ ~-0.05 ~ #gm4:no_collision store success score $builder.ori_found gm4_hy_data run data modify storage gm4_hydromancy:temp builder.Rotation set value [0F,90F]
execute if score $builder.ori_found gm4_hy_data matches 0 unless block ~ ~0.05 ~ #gm4:no_collision store success score $builder.ori_found gm4_hy_data run data modify storage gm4_hydromancy:temp builder.Rotation set value [0F,-90F]
execute if score $builder.ori_found gm4_hy_data matches 0 unless block ~-0.05 ~ ~ #gm4:no_collision store success score $builder.ori_found gm4_hy_data run data modify storage gm4_hydromancy:temp builder.Rotation set value [90F,0F]
execute if score $builder.ori_found gm4_hy_data matches 0 unless block ~0.05 ~ ~ #gm4:no_collision store success score $builder.ori_found gm4_hy_data run data modify storage gm4_hydromancy:temp builder.Rotation set value [-90F,0F]
execute if score $builder.ori_found gm4_hy_data matches 0 unless block ~ ~ ~-0.05 #gm4:no_collision store success score $builder.ori_found gm4_hy_data run data modify storage gm4_hydromancy:temp builder.Rotation set value [-180F,0F]
execute if score $builder.ori_found gm4_hy_data matches 0 unless block ~ ~ ~0.05 #gm4:no_collision run data modify storage gm4_hydromancy:temp builder.Rotation set value [0F,0F]
execute align xyz run summon block_display ~.5 ~.5 ~.5 {brightness:{sky:15,block:15},Tags:["gm4_hy_builder.marker","gm4_hy_builder.origin","gm4_hy_builder.new","gm4_hy_builder.need_command"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.005f,-0.005f,-0.005f],scale:[0.01f,0.01f,0.01f]},block_state:{Name:"minecraft:stone"}}

# fill the surrounding area
execute as @e[type=block_display,tag=gm4_hy_builder.new,limit=1] at @s run function gm4_hydromancy:spell_trident/builder/on_land/process_spell

# update item count on trident
execute on passengers store result entity @s Item.Count int 1 run scoreboard players get $builder.blocks_left gm4_hy_data

# cleanup
data remove storage gm4_hydromancy:temp builder
