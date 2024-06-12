function get_script_dir()
    -- Get the absolute path to the currently running script
    local str = debug.getinfo(1, "S").source:sub(2)
    return str:match("(.*/)")
end

local script_dir = get_script_dir()

conky.config = {
    alignment = 'top_left',
    background = false,

    cpu_avg_samples = 2,
  
    gap_x = 310,
    gap_y = 365,
    maximum_width = 275,
    minimum_width = 275,
    minimum_height = 256,
    use_xft = true,
    font = 'FiraCode Nerd Font-9',
    border_inner_margin = 5,
    border_outer_margin = 0,
    border_width = 5,
    draw_borders = false,
    draw_graph_borders = true,
    draw_outline = false,
    draw_shades = false,
    double_buffer = true,
    override_utf8_locale = true,

    net_avg_samples = 2,
    own_window = true,
    own_window_class = 'Conky',
    own_window_type = 'dock',
    own_window_argb_visual = true,
    own_window_argb_value = 0,
    own_window_transparent = true,

    own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
    update_interval = 36000,  -- Update every 30 minutes
    imlib_cache_size = 1,
    lua_load = script_dir .. 'read_moon_data.lua',
};

conky.text = [[
# Image
${image ]] .. script_dir .. [[astro_nerd_ripped/tmp/current_moon.png -p 0,0 -s 120x120}






${lua read_moon_data}
${font agave Nerd Font-7}${color slate grey}${lua conky_read_timestamp}
]]
