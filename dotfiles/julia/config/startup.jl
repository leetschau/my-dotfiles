atreplinit() do repl
    try
        @eval using OhMyREPL
        @eval using TerminalPager
    catch e
        @warn "error while importing OhMyREPL" e
    end
end
