# run from gm4_live_catch:fish/FISH_TYPE/catch


# summon fish at item
execute at @a[tag=gm4_lc_fisher] as @e[type=item,limit=1,sort=nearest,nbt={Age:0s}] at @s run function gm4_live_catch:fish/pufferfish/summon

# remove fisher tag
tag @a remove gm4_lc_fisher
