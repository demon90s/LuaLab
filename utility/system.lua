system = system or {}

system.platform = ""
system.output_cmd = false

local win_ignore_error = " > nul 2>&1"

function execute(...)
    local cmd = string.format(...)
    if output_cmd then
        print(cmd)
    end
    return os.execute(cmd)
end

-- "unix" or "windows"
function system.set_platform(platform)
    system.platform = platform
    assert(platform == "unix" or platform == "windows")
    if platform == windows then
        execute("@echo off")
    end
end

function system.set_output_cmd(output_cmd)
    system.output_cmd = output_cmd
end

function system.unix()
    return system.platform == "unix"
end
function system.windows()
    return system.platform == "windows"
end

function system.mkdir(dir)
    if system.unix() then
        return execute("mkdir -p %s", dir)
    elseif system.windows() then
        return execute("mkdir %s %s", dir, win_ignore_error)
    end
end

function system.touch(filename)
    if system.unix() then
        return execute("touch %s", filename)
    elseif system.windows() then
        return execute("type nul >> %s", filename)
    end
end

function system.copy(old, new)
    if system.unix() then
        return execute("cp -f %s %s", old, new)
    elseif system.windows() then
        return execute("copy /Y %s %s", old, new)
    end
end

function system.copy_dir(old, new)
    if system.unix() then
        return execute("cp -r -f %s %s", old, new)
    elseif system.windows() then
        return execute("xcopy /S %s %s", old, new)
    end
end

function system.remove(filename)
    return os.remove(filename)
end

function system.remove_dir(dir)
    if system.unix() then
        return execute("rm -fr %s", dir)
    elseif system.windows() then
        return execute("del /S /Q %s/* %s", dir, win_ignore_error)
    end
end

system.set_platform("unix")
system.mkdir("hello")
system.touch("hello/world.txt")
system.copy("hello/world.txt", "hello/world.bak")
system.remove("hello/world.txt")
--system.remove_dir("hello")
