ancho_ventana = 144
alto_ventana = 160
escala = 4
x = 0
y = 0
img = love.graphics.newImage("cartoon-dog.png")
img = love.graphics.newImage("sleeping-cat.png")
ventana = {
    ancho = 400,
    alto = 300,
    escala = 2
}
enemigo = {

x=0,
y=0,
velocidad = 1000,
sprite=nil


}
jugador = {
alto,
ancho,
origen_x,
origen_y,
x=0,
y=0,
velocidad = 1000,
sprite=nil

}
musica = nil 

function love.load()
    love.window.setMode(ventana.ancho * ventana.escala, ventana.alto * ventana.escala)
    lienso = love.graphics.newCanvas(ancho_ventana, alto_ventana)
    jugador.sprite = love.graphics.newImage("cartoon-dog.png")
    enemigo.sprite = love.graphics.newImage("sleeping-cat.png")
    jugador.ancho = jugador.sprite:getWidth()
    jugador.alto = jugador.sprite:getHeight()
    jugador.origen_x = jugador.ancho/2
    jugador.origen_y = jugador.alto/2
    jugador.x = ventana.ancho  / 2
    jugador.y = ventana.alto  / 2
    enemigo.x = ventana.ancho  -20
    enemigo.y = 20
    musica = love.audio.newSource("EFX INT Mutt Growl 42 B.wav","stream")
    musica:setLooping(true)
    love.audio.play(musica)
end
function love.update(dt)
    if love.keyboard.isDown("right") then 
    jugador.x = jugador.x + (jugador.velocidad*dt)
elseif love.keyboard.isDown("left") then
    jugador.x = jugador.x - (jugador.velocidad*dt)
elseif love.keyboard.isDown("down")  then
    jugador.y = jugador.y + (jugador.velocidad*dt)
elseif love.keyboard.isDown("up") then 
    jugador.y = jugador.y - (jugador.velocidad*dt)
end
local dist_x = math.abs(enemigo.x-jugador.x)
local dist_y = math.abs(enemigo.y-jugador.y)
if dist_x > dist_y then
    if dist_x > jugador.ancho then
if enemigo.x < jugador.x then 
    enemigo.x = enemigo.x + (enemigo.velocidad * dt)
elseif enemigo.x > jugador.x then
enemigo.x = enemigo.x - (enemigo.velocidad * dt)
end 
end 
else
    if dist_y > jugador.alto then 
if enemigo.y < jugador.y then 
    enemigo.y = enemigo.y + (enemigo.velocidad * dt)
elseif enemigo.y > jugador.y then
enemigo.y = enemigo.y - (enemigo.velocidad * dt)
end 
end 
end 
end

function love.draw()
love.graphics.setCanvas(lienso)
            love.graphics.clear()
            love.graphics.setCanvas()
            love.graphics.draw(jugador.sprite,jugador.x,jugador.y,0,0.5,0.5,jugador.origen_x,jugador.origen_y)
            love.graphics.draw(enemigo.sprite,enemigo.x,enemigo.y,0,0.1,0.1)
            love.graphics.draw(lienso,0,0,0,escala,escala)
end


