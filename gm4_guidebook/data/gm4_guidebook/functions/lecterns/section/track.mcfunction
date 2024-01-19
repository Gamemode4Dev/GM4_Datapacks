# starts tracking changes
# @s = player who opened the lectern
# located at center of lectern
# run from gm4_guidebook:lecterns/section/ray

# update id score
scoreboard players operation @e[type=marker,tag=gm4_guide_tracking,limit=1,distance=..0.5] gm4_guide_id = @s gm4_guide_id

# start tracking page changes
tag @e[type=marker,tag=gm4_guide_lectern,limit=1,distance=..0.5] add gm4_guide_tracking
schedule function gm4_guidebook:lecterns/section/tracking 1t
