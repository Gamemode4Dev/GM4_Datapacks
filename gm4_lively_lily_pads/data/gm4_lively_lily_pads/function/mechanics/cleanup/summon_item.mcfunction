# summons item
# @s = type=block_display, tag=gm4_llp_display
# at @s
# with {id, count, motion}
# run from mechanics/cleanup/kill

$summon minecraft:item ~ ~-.02 ~ {Item:{id:"$(id)",count:$(count)},Motion:$(motion)}
