EstadoJugar  =  Class{__includes = Estado}
function EstadoJugar:init()
     self.jugador = Jugador(ventana.ancho / 2,ventana.alto / 2)
     self.enemigo = Enemigo(ventana.ancho -20,20) 
end
function EstadoJugar:ingresar()
    mapa = sti("mapa/arena1.lua")
end
function EstadoJugar:salir()
    
end
function EstadoJugar:update(dt)
     self.jugador:update(dt)
    self.enemigo:update(dt,self.jugador)
    local caja_jugador = self.jugador:getAABB()
    local caja_enemigo = self.enemigo:getAABB()
    if comprobarcolicion(caja_jugador, caja_enemigo) then 
     atrapado = true 
     MaquinaEstadoGlobal:cambiar('derota')
        print("¡Colisión detectada entre Jugador y Enemigo!")
        end
end
function EstadoJugar:draw() 
     love.graphics.setColor(1,1,1,1)
     love.graphics.setCanvas(lienso) 
              love.graphics.clear()
              love.graphics.push()
              love.graphics.translate(-self.jugador.x + ventana.ancho/2, -self.jugador.y + ventana.alto/2)
            --love.graphics.setCanvas()

            self.jugador:draw()
            self.enemigo:draw()
           --- love.graphics.draw(jugador.sprite,jugador.x,jugador.y,0,0.5,0.5,jugador.origen_x,jugador.origen_y)
           -- love.graphics.draw(enemigo.sprite,enemigo.x,enemigo.y,0,0.1,0.1)
     love.graphics.pop()
           love.graphics.setCanvas()
            love.graphics.draw(lienso,0,0,0,ventana.escala,ventana.escala)
               mapa:draw() 
          end 
function EstadoJugar:keypressed(key)
    self.jugador:keypressed(key)
end