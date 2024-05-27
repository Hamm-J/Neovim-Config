local setup, bufresize = pcall(require, "bufresize")
if not setup then
    return
end

bufresize.setup();
