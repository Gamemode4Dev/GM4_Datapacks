# converts a jigsaw structure to an function-emulated jigsaw structure for use post-worldgen
    # written for convertting apple trees structure files with marker entities.

import amulet_nbt
import numpy as np
from structure_normalize_palette import normalize_palette

def jigsaw_convert(structure_file):
    # locate which blocks are jigsaws by the block type in palette
        # and extract facing information for each
    jigsaws_in_palette = {idx: val['Properties']['orientation'].py_str for idx, val in enumerate(structure_file.tag['palette']) \
        if val['Name'].py_str == 'minecraft:jigsaw' }

    # facing to rotation direction mapping
    rotation_map = {
        "north_up": "[180f, 0f]",
        "east_up": "[-90f, 0f]",
        "south_up": "[0f, 0f]",
        "west_up": "[90f, 0f]",
        "up_east": "[0.0f, -90f]",
        "up_north": "[0.0f, -90f]",
        "up_south": "[0.0f, -90f]",
        "up_west": "[0.0f, -90f]",
        "down": "[0.f, 90f]",
        "down_east": "[0.f, 90f]",
        "down_north": "[0.f, 90f]",
        "down_south": "[0.f, 90f]",
        "down_west": "[0.f, 90f]"
    }

    # locate block positions from palette state(index)s
    for jigsaw_compound in structure_file.tag['blocks']:
        if jigsaws_in_palette.get(state_id:=jigsaw_compound['state'].py_int) is not None:
            # add entity to the entity list
                # with this jigsaw's direction and position
            blockPos = np.array(list(map(lambda e:e.py_int, jigsaw_compound['pos'])))
            jigsaw_pool = 'gm4_jpool_' + jigsaw_compound['nbt']['pool'].py_str.split(':')[1]
            entity_snbt = f'''{{
                nbt:{{id:"minecraft:marker",Tags:["gm4_jigsaw_marker","{jigsaw_pool}"],
                    Rotation:{rotation_map[jigsaws_in_palette[state_id]]}}},
                blockPos:{np.array2string( blockPos, separator=",")},
                pos:{np.array2string( blockPos+[0.5]*3, separator=",")}
                }}'''
            entity_entry = amulet_nbt.from_snbt(entity_snbt)
            structure_file.tag['entities'].append(entity_entry)

            # convert the jigsaw block into its final-state block
            final_name, *final_props = jigsaw_compound['nbt']['final_state'].py_str.split('[')
            if len(final_props)>0:
                final_props = final_props[0].strip(']').split(',')
            final_props = dict((s.split('=') for s in final_props))

            palette_snbt = f'''{{
                Name:"{final_name}",
                Properties:{final_props}
            }}'''
            palette_entry = amulet_nbt.from_snbt(palette_snbt)
            structure_file.tag['palette'].append(palette_entry)
            new_state_id = len(structure_file.tag['palette'])-1

            jigsaw_compound['state'] = amulet_nbt.IntTag(new_state_id)
            del jigsaw_compound['nbt']

    # replace all air with structure-voids (an empty entry)
    air_state = structure_file.tag['palette'].index(amulet_nbt.CompoundTag({'Name': amulet_nbt.StringTag('minecraft:air')}))
    air_to_remove = []
    for idx, b_compound in enumerate(structure_file.tag['blocks']):
        if b_compound['state'].py_int == air_state:
            air_to_remove.append(idx)
    
    for idx in reversed(air_to_remove):
        del structure_file.tag['blocks'][idx]
        # air entry in palette will be cleaned up by normalize

    # normalize blocks and palette to remove repeated values
    normalized_struct = normalize_palette(structure_file)
    return normalized_struct

if __name__ == '__main__':
    # processed desired files into entity-based structures
    input_files = [
        "data\gm4_apple_trees\structures\worldgen\\apple_tree_short_1.nbt",
        "data\gm4_apple_trees\structures\worldgen\\apple_tree_short_2.nbt",
        "data\gm4_apple_trees\structures\worldgen\\apple_tree_short_3.nbt",
        "data\gm4_apple_trees\structures\worldgen\\apple_tree_short_4.nbt",
        "data\gm4_apple_trees\structures\worldgen\\apple_tree_tall_1.nbt",
        "data\gm4_apple_trees\structures\worldgen\\apple_tree_tall_2.nbt",
        "data\gm4_apple_trees\structures\worldgen\\apple_tree_tall_3.nbt",
        "data\gm4_apple_trees\structures\worldgen\\apple_tree_tall_4.nbt",
        "data\gm4_apple_trees\structures\worldgen\\apple_leaf.nbt"
    ]
    output_dir_map = ('worldgen', 'sapling_growth')

    for filepath in input_files:
        structure_file = amulet_nbt.load(filepath)
        processed_file = jigsaw_convert(structure_file)
        processed_file.save_to(filepath.replace(*output_dir_map))