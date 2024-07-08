# process a link that has run out of health
# @s = unspecified
# at unspecified
# run from armor/modifier/type/link/process/process_link

# check which players were killed and which followed them to their death
execute store result score $killed_player_count gm4_ae_data run tag @a[tag=gm4_ae_link.process,scores={gm4_ae_health.current=..0}] add gm4_ae_link.killed
execute if score $killed_player_count gm4_ae_data matches 2.. run tag @r[tag=gm4_ae_link.killed] add gm4_ae_link.killed_2

execute as @a[tag=gm4_ae_link.process,tag=!gm4_ae_link.killed] run function gm4_armor_expanded:armor/modifier/type/link/process/death_message

# remove tags as processing is done
tag @a[tag=gm4_ae_link.process] remove gm4_ae_linked
tag @a remove gm4_ae_link.process
tag @a remove gm4_ae_link.killed
tag @a remove gm4_ae_link.killed_2
