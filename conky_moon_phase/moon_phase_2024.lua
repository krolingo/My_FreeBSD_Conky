function get_script_dir()
    -- Get the absolute path to the currently running script
    local str = debug.getinfo(1, "S").source:sub(2)
    return str:match("(.*/)")
end

local script_dir = get_script_dir()

conky.config = {
    alignment = 'top_left',
    background = false,
    border_width = 1,
    cpu_avg_samples = 2,
    default_color = 'white',
    default_outline_color = 'black',
    default_shade_color = 'black',
    draw_borders = false,
    draw_graph_borders = true,
    draw_outline = false,
    draw_shades = false,
    use_xft = true,
    font = 'DejaVu Sans Mono:size=8',
    gap_x = 30,
    gap_y = 905,
    minimum_width = 250,
    net_avg_samples = 2,
    out_to_console = false,
    out_to_stderr = false,
    extra_newline = false,
    own_window = true,
    own_window_class = 'Conky',
    own_window_type = 'desktop',
    own_window_argb_visual = true,
    own_window_argb_value = 180,
    own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
    own_window_transparent = true,
    stippled_borders = 0,
    update_interval = 86400,  -- Update every 1 days
    uppercase = false,
    use_spacer = 'none',
    show_graph_scale = false,
    show_graph_range = false
};

conky.text = [[
${execi 300 php ]] .. script_dir .. [[php_moonphase.php}
${font = "agave Nerd Font-7"}${color slate grey}${time %Y-%m-%d %H:%M:%S}${font}${color}

]];
