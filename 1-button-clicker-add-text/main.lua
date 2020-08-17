-- Load - called when the game starts
function love.load()
    -- Set Window Title
    love.window.setTitle("Button Clicker Game")

    -- Variables
    score = 0
    timer = 10

    myFont = love.graphics.newFont(40)
end

--[[ Draw - Similar to update, called every frame
 Used to draw graphics to screen
]]
function love.draw()
    love.graphics.setFont(myFont)
    love.graphics.setColor(255, 255, 255)
    love.graphics.print('Score: '..score)
    love.graphics.print('Time: '..timer, 300, 0)
end