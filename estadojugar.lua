EstadoJugar  =  Class{__includes = Estado}
function EstadoJugar:init()
     --self.jugador = Jugador(ventana.ancho / 2,ventana.alto / 2,mundo)
     --self.enemigo = Enemigo(ventana.ancho -20,20) 
        self.jugador = nil 
        self.enemigo = nil 
        self.camara_principal = nil
        self.mapa = nil 
        self.mundo = nil 
    end
function EstadoJugar:ingresar()
    self.mundo = bump.newWorld(16)
    self.mapa = sti("mapa/arena1.lua")
    if self.mapa then
        ventana.mapa_ancho = self.mapa.width * self.mapa.tilewidth 
        ventana.mapa_alto = self.mapa.height * self.mapa.tileheight 
    end
    self.jugador = Jugador(ventana.ancho / 2,ventana.alto / 2,mundo,self.mundo)
     self.enemigo = Enemigo(ventana.ancho -20,20,self.mundo)
    self.enemigo.esenemigo = true
    self.camara_principal = camara() 
   
end
function EstadoJugar:salir()
    
end
function EstadoJugar:update(dt)
     self.jugador:update(dt)
    self.enemigo:update(dt,self.jugador) 
    if self.mapa then 
     self.mapa:update(dt)
    end
    local cx = math.floor(self.jugador.x)
    local cy = math.floor(self.jugador.y)
    self.camara_principal:lookAt(cx , cy)
    local caja = self.jugador:getAABB()
    local items, len = self.mundo:queryRect(caja.x, caja.y, caja.ancho, caja.alto)
    
    for i = 1, len do
        local item = items[i]
        if item ~= self.jugador then  
        if item.esenemigo  then 
            atrapado = true 
            MaquinaEstadoGlobal:cambiar('derota')
            print("¡Colisión detectada entre Jugador y Enemigo!")
            break
             end
    end 
  end
        ventana.camara_centro_x = ventana.ancho * 0.5 
        ventana.camara_centro_y = ventana.alto * 0.5 
if self.camara_principal.x < ventana.camara_centro_x then
  self.camara_principal.x = ventana.camara_centro_x 
end
if self.camara_principal.x > (ventana.mapa_ancho - ventana.camara_centro_x) then
    self.camara_principal.x = (ventana.mapa_ancho - ventana.camara_centro_x)
end
if self.camara_principal.y < (ventana.camara_centro_y) then
  self.camara_principal.y = (ventana.camara_centro_y)
end
if self.camara_principal.y > (ventana.mapa_alto - ventana.camara_centro_y) then
  self.camara_principal.y = (ventana.mapa_alto - ventana.camara_centro_y)
end
     end
function EstadoJugar:draw() 
     love.graphics.setColor(1,1,1,1)
     love.graphics.setCanvas(lienso) 
              love.graphics.clear()
              self.camara_principal:attach(0, 0, ventana.ancho, ventana.alto) 
              if self.mapa and self.mapa.layers['Capa de patrones 1'] then 
               self.mapa:drawLayer(self.mapa.layers['Capa de patrones 1'])
              end
           --   love.graphics.push()
             -- love.graphics.translate(-self.jugador.x + ventana.ancho/2, -self.jugador.y + ventana.alto/2)
            --love.graphics.setCanvas()

           -- self.mapa:draw()
            self.jugador:draw()
            self.enemigo:draw()
               if self.mapa and self.mapa.layers["deco"] then 
               self.mapa:drawLayer(self.mapa.layers["deco"])
              end
          
            self.camara_principal:detach()
           --- love.graphics.draw(jugador.sprite,jugador.x,jugador.y,0,0.5,0.5,jugador.origen_x,jugador.origen_y)
           -- love.graphics.draw(enemigo.sprite,enemigo.x,enemigo.y,0,0.1,0.1)
    -- love.graphics.pop()
      ---     love.graphics.setCanvas()
         --   love.graphics.draw(lienso,0,0,0,ventana.escala,ventana.escala)
           --    mapa:draw() 
          end 
function EstadoJugar:keypressed(key)
    self.jugador:keypressed(key)
end