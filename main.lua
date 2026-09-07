
ventana = {
    ancho = 900,
    alto = 700,
    escala = 1
}
musica = nil 
fuente = nil 
sfx_ataque = nil 
det_derota = nil 
require 'dependencias' 
function comprobarcolicion(a, b)
    return a.x < b.x + b.ancho and
           a.x + a.ancho > b.x and
           a.y < b.y + b.alto and
           a.y + a.alto > b.y
end
function love.load()
    love.window.setMode(ventana.ancho * ventana.escala, ventana.alto * ventana.escala)
    lienso = love.graphics.newCanvas(ventana.ancho, ventana.alto)
    musica = love.audio.newSource("Alpha Dance.ogg","stream")
    musica:setLooping(true)
    love.audio.play(musica) 
     sfx_ataque = love.audio.newSource("EFX INT Mutt Growl 42 B.wav","static")
     det_derota = love.audio.newSource("Beat ident.ogg","static")
    fuente = love.graphics.newFont("fuentes/Blox2.ttf", 50)  
   MaquinaEstadoGlobal = MaquinaEstado({
    ['Jugar'] = function () return  EstadoJugar() end,
    ['titulo'] = function () return  EstadoTitulo() end,
    ['derota'] = function () return  EstadoDerota() end
   }) 
   MaquinaEstadoGlobal:cambiar('titulo',{titulo = "arena 2d", subtitulo = "presione enter"})
   
   
end 
function love.keypressed(key, scancode, isrepeat )
  if  key == "f1" then 
    depurar = not depurar 
  end 
 if key == "return" then 
        MaquinaEstadoGlobal:cambiar('Jugar') 
    elseif key == "escape" then 
        MaquinaEstadoGlobal:cambiar('titulo',{titulo = "arena 2d", subtitulo = "reintentar"}) 

    end 
    MaquinaEstadoGlobal:keypressed(key, scancode, isrepeat)
end
function love.update(dt)
      MaquinaEstadoGlobal:update(dt)
end 
function love.draw()
love.graphics.setCanvas(lienso)
love.graphics.clear()
MaquinaEstadoGlobal:draw()
          love.graphics.setCanvas()
          love.graphics.draw(lienso, 0, 0, 0, ventana.escala, ventana.escala)
end 

