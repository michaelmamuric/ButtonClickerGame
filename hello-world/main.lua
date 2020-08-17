--called once the game loads
function love.load()
    love.window.setTitle("Hello World Program")
    love.graphics.setFont(love.graphics.newFont(40))
end

-- draws graphics on screen
function love.draw()
    love.graphics.print("Hello World!")
end