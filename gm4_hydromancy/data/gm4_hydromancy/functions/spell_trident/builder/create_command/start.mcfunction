# store setblock command on trident
# @s = spell trident
# at @s
# run from spell_trident/builder/process

tag @s add gm4_hy_spell_trident.builder.command_building

# place command on sign
data modify storage gm4_hydromancy:temp command set from entity @s Passengers[0].Item.id
data modify block 29999998 1 7133 front_text.messages[0] set value '[{"text":"setblock ~ ~ ~ "},{"nbt":"command","storage":"gm4_hydromancy:temp"}]'
# copy to trident name
data modify entity @s CustomName set from block 29999998 1 7133 front_text.messages[0]
# execute a failing enchant command from trident to flatten name into command block output 
setblock 29999997 10 7130 command_block{Command:"enchant @e[type=trident,tag=gm4_hy_spell_trident.builder.command_building,limit=1] mending",auto:1b}

# cleanup
data remove storage gm4_hydromancy:temp command
