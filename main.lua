
ventana = {
    ancho = 900,
    alto = 700,
    escala = 1
}
musica = nil 
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
    musica = love.audio.newSource("EFX INT Mutt Growl 42 B.wav","stream")
    musica:setLooping(true)
    love.audio.play(musica)
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

