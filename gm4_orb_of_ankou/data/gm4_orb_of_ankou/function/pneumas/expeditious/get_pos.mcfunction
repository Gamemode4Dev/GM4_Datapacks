# @s = player with expeditious pneuma who stopped sneaking
# run from pneumas/expeditious/randomize

# check column for safe location
scoreboard players set set_y gm4_pneuma_data 0
$execute positioned ~$(x) ~5 ~$(z) run function gm4_orb_of_ankou:pneumas/expeditious/set_ypos

# try another column (at most 12 times) if entire column was not safe
scoreboard players add expeditious_attempt gm4_pneuma_data 1
execute unless score expeditious_attempt gm4_pneuma_data matches 12.. run function gm4_orb_of_ankou:pneumas/expeditious/randomize
