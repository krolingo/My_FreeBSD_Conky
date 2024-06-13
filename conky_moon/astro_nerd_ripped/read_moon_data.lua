function conky_read_moon_data()
    local home_dir = os.getenv("HOME")
    local file_path = home_dir .. "/.config/conky/organized/conky_moon/astro_nerd_ripped/tmp/moon_data"
    local file = io.open(file_path, "r")
    if not file then
        return "File not found"
    end
    
    local lines = {}
    for line in file:lines() do
        table.insert(lines, line)
    end
    file:close()
    
    -- Get the last three lines
    local count = #lines
    if count < 3 then
        return "Insufficient data"
    end
    local last_three_lines = table.concat({lines[count-2], lines[count-1], lines[count]}, "\n")
    
    return last_three_lines
end

function conky_read_timestamp()
    local home_dir = os.getenv("HOME")
    local file_path = home_dir .. "/.config/conky/organized/conky_moon/astro_nerd_ripped/tmp/TIMESTAMP"
    local file = io.open(file_path, "r")
    if not file then
        return "Timestamp file not found"
    end

    local last_line
    for line in file:lines() do
        last_line = line
    end
    file:close()

    return last_line or "No content in timestamp file"
end
