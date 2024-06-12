function get_script_dir()
    -- Get the absolute path to the currently running script
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("(.*/)")
end

function conky_read_moon_data()
    -- Get the directory where the script is located
    local script_dir = get_script_dir()
    -- Construct the file path to the moon data file relative to the script directory
    local file_path = script_dir .. "astro_nerd_ripped/tmp/moon_data"
    -- Attempt to open the file in read mode
    local file = io.open(file_path, "r")
    -- Return an error message if the file cannot be opened
    if not file then
        return "File not found"
    end
    
    -- Read all lines from the file into a table
    local lines = {}
    for line in file:lines() do
        table.insert(lines, line)
    end
    file:close()
    
    -- Get the last three lines from the file
    local count = #lines
    if count < 3 then
        return "Insufficient data"
    end
    local last_three_lines = table.concat({lines[count-2], lines[count-1], lines[count]}, "\n")
    
    return last_three_lines
end

function conky_read_timestamp()
    -- Get the directory where the script is located
    local script_dir = get_script_dir()
    -- Construct the file path to the timestamp file relative to the script directory
    local file_path = script_dir .. "astro_nerd_ripped/tmp/TIMESTAMP"
    -- Attempt to open the file in read mode
    local file = io.open(file_path, "r")
    -- Return an error message if the file cannot be opened
    if not file then
        return "Timestamp file not found"
    end

    -- Read the last line from the file
    local last_line
    for line in file:lines() do
        last_line = line
    end
    file:close()

    -- Return the last line or an error message if the file was empty
    return last_line or "No content in timestamp file"
end
