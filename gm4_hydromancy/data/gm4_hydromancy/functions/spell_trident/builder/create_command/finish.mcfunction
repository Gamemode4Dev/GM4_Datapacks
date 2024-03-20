# store setblock command on trident
# @s = spell trident
# at @s
# run from spell_trident/builder/process

tag @s remove gm4_hy_spell_trident.builder.command_building

# get id length of item
execute store result score $builder.id_length gm4_hy_data run data get entity @s Passengers[0].Item.id
scoreboard players remove $builder.id_length gm4_hy_data 10

# copy just the command from command block output into trident data
execute if score $builder.id_length gm4_hy_data matches 1..32 run function gm4_hydromancy:spell_trident/builder/create_command/tree/1-32
execute if score $builder.id_length gm4_hy_data matches 33..64 run function gm4_hydromancy:spell_trident/builder/create_command/tree/33-64

# remove command block for next trident
setblock 29999997 10 7130 air
