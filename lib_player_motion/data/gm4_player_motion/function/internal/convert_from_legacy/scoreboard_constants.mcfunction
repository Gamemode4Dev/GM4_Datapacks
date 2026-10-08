#> gm4_player_motion:internal/convert_from_legacy/scoreboard_constants.mcfunction
## 
# 32 linear approximation segments for converting from the legacy end crystal method's cubic regression to the current cubic regression.
#
# Cubic regression algorithms generated on [Desmos](https://www.desmos.com/calculator/ocv67a9p3z), newtonian conversion and slope calculations [here](https://discord.com/channels/154777837382008833/1221689674611818556/1439382129304928488)
#
# ```ts
# const BUCKET_PARAMS = [
#     [1.012643, 185],   [1.011031, 188],   [1.008673, 198],
#     [1.005570, 216],   [1.001722, 247],
#     [0.997128, 293],   [0.991788, 357],   [0.985704, 442],
#     [0.978874, 552],   [0.971299, 688],   [0.962979, 854],
#     [0.953914, 1054],  [0.944104, 1289],  [0.933549, 1564],
#     [0.922249, 1880],  [0.910204, 2241],  [0.897414, 2651],
#     [0.883879, 3111],  [0.8696, 3625],    [0.854575, 4196],
#     [0.838806, 4827],  [0.822292, 5520],  [0.805033, 6280],
#     [0.787029, 7108],  [0.76828, 8008],   [0.748787, 8982],
#     [0.728548, 10035], [0.707565, 11168], [0.685836, 12385],
#     [0.663363, 13688], [0.640144, 15081], [0.616181, 16567],
# ] as const satisfies Array<[scale: number, adder: number]>
# ```
##

scoreboard players set #convert.00.adder \
    gm4_player_motion.internal.const \
    185
scoreboard players set #convert.01.adder \
    gm4_player_motion.internal.const \
    188
scoreboard players set #convert.02.adder \
    gm4_player_motion.internal.const \
    198
scoreboard players set #convert.03.adder \
    gm4_player_motion.internal.const \
    216
scoreboard players set #convert.04.adder \
    gm4_player_motion.internal.const \
    247
scoreboard players set #convert.05.adder \
    gm4_player_motion.internal.const \
    293
scoreboard players set #convert.06.adder \
    gm4_player_motion.internal.const \
    357
scoreboard players set #convert.07.adder \
    gm4_player_motion.internal.const \
    442
scoreboard players set #convert.08.adder \
    gm4_player_motion.internal.const \
    552
scoreboard players set #convert.09.adder \
    gm4_player_motion.internal.const \
    688
scoreboard players set #convert.10.adder \
    gm4_player_motion.internal.const \
    854
scoreboard players set #convert.11.adder \
    gm4_player_motion.internal.const \
    1054
scoreboard players set #convert.12.adder \
    gm4_player_motion.internal.const \
    1289
scoreboard players set #convert.13.adder \
    gm4_player_motion.internal.const \
    1564
scoreboard players set #convert.14.adder \
    gm4_player_motion.internal.const \
    1880
scoreboard players set #convert.15.adder \
    gm4_player_motion.internal.const \
    2241
scoreboard players set #convert.16.adder \
    gm4_player_motion.internal.const \
    2651
scoreboard players set #convert.17.adder \
    gm4_player_motion.internal.const \
    3111
scoreboard players set #convert.18.adder \
    gm4_player_motion.internal.const \
    3625
scoreboard players set #convert.19.adder \
    gm4_player_motion.internal.const \
    4196
scoreboard players set #convert.20.adder \
    gm4_player_motion.internal.const \
    4827
scoreboard players set #convert.21.adder \
    gm4_player_motion.internal.const \
    5520
scoreboard players set #convert.22.adder \
    gm4_player_motion.internal.const \
    6280
scoreboard players set #convert.23.adder \
    gm4_player_motion.internal.const \
    7108
scoreboard players set #convert.24.adder \
    gm4_player_motion.internal.const \
    8008
scoreboard players set #convert.25.adder \
    gm4_player_motion.internal.const \
    8982
scoreboard players set #convert.26.adder \
    gm4_player_motion.internal.const \
    10035
scoreboard players set #convert.27.adder \
    gm4_player_motion.internal.const \
    11168
scoreboard players set #convert.28.adder \
    gm4_player_motion.internal.const \
    12385
scoreboard players set #convert.29.adder \
    gm4_player_motion.internal.const \
    13688
scoreboard players set #convert.30.adder \
    gm4_player_motion.internal.const \
    15081
scoreboard players set #convert.31.adder \
    gm4_player_motion.internal.const \
    16567
