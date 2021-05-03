#@s = player with sensus at location of layer to scan
#run from sensus_shamir:active

fill ~ ~ ~ ~6 ~ ~6 command_block{auto:1b,Command:"function gm4_sensus_shamir:block_search/mark_overworld/coal_ore"} replace coal_ore
fill ~ ~ ~ ~6 ~ ~6 command_block{auto:1b,Command:"function gm4_sensus_shamir:block_search/mark_overworld/iron_ore"} replace iron_ore
fill ~ ~ ~ ~6 ~ ~6 command_block{auto:1b,Command:"function gm4_sensus_shamir:block_search/mark_overworld/gold_ore"} replace gold_ore
fill ~ ~ ~ ~6 ~ ~6 command_block{auto:1b,Command:"function gm4_sensus_shamir:block_search/mark_overworld/lapis_ore"} replace lapis_ore
fill ~ ~ ~ ~6 ~ ~6 command_block{auto:1b,Command:"function gm4_sensus_shamir:block_search/mark_overworld/redstone_ore"} replace redstone_ore
fill ~ ~ ~ ~6 ~ ~6 command_block{auto:1b,Command:"function gm4_sensus_shamir:block_search/mark_overworld/emerald_ore"} replace emerald_ore
fill ~ ~ ~ ~6 ~ ~6 command_block{auto:1b,Command:"function gm4_sensus_shamir:block_search/mark_overworld/diamond_ore"} replace diamond_ore

#nether
fill ~ ~ ~ ~6 ~ ~6 command_block{auto:1b,Command:"function gm4_sensus_shamir:block_search/mark_nether/nether_quartz_ore"} replace nether_quartz_ore
fill ~ ~ ~ ~6 ~ ~6 command_block{auto:1b,Command:"function gm4_sensus_shamir:block_search/mark_nether/nether_gold_ore"} replace nether_gold_ore
fill ~ ~ ~ ~6 ~ ~6 command_block{auto:1b,Command:"function gm4_sensus_shamir:block_search/mark_nether/ancient_debris"} replace ancient_debris
