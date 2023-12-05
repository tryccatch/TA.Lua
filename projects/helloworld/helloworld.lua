local msg = { "Hello", "Lua", "World", "from", "VS Code", "and the Lua extension!" }

for _, word in ipairs(msg) do
    io.write(word .. " ")
end
