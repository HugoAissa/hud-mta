local screenW, screenH = guiGetScreenSize() -- Pegar a resolução do jogador
local resW, resH = 1280,1024 -- Selecionar a resolução
local x, y = (screenW/resW), (screenH/resH) -- Divisão de altura por largura da tela
    
hud = function () -- função
vida = getElementHealth(localPlayer) -- variável para pegar vida do player
colete = getPlayerArmor(localPlayer) -- variável para pegar colete do player
  dxDrawRectangle(x*936.57, y*948, x*224.98/100*vida, y*5, tocolor(255,0,0,255), false) -- função de desenhar o retangulo
  dxDrawRectangle(x*958, y*918, x*178.11/100*colete, y*5, tocolor( 11, 255, 226, 255), false) -- função de desenhar o retangulo    11, 255, 226, 255   255, 0, 0, 255)
end
addEventHandler('onClientRender', root, hud) -- evento que chama a função


--Retangulo que fica quando a vida ou colete estiver acabando
local screenW, screenH = guiGetScreenSize()

function renderDisplay ( )
	local seconds = getTickCount() / 1000

  dxDrawImage ( 958, 918, 178.11, 10, 'assets/11.png', 0, 0 )
  dxDrawImage ( 936.57, 948, 224.98, 10, 'assets/10.png', 0, 0 )





  dxDrawImage ( 923, 62, 62, 65, 'assets/1.png', 0,0)
  dxDrawImage ( 994, 62, 62, 65, 'assets/2.png', 0,0)
  dxDrawImage ( 1062, 62, 66, 65, 'assets/3.png', 0,0)
  dxDrawImage ( 1135, 62, 62, 65, 'assets/4.png', 0,0)



end

function HandleTheRendering ( )
	addEventHandler("onClientRender", root, renderDisplay)  -- Keep everything visible with onClientRender.
end
addEventHandler("onClientResourceStart",resourceRoot, HandleTheRendering)

  --hud principal fica inv
function setHud()
    setPlayerHudComponentVisible("armour", false)
    setPlayerHudComponentVisible("wanted", false)
    setPlayerHudComponentVisible("weapon", false)
    setPlayerHudComponentVisible("money", false)
    setPlayerHudComponentVisible("health", false)
    setPlayerHudComponentVisible("clock", false)
    setPlayerHudComponentVisible("breath", false)
    setPlayerHudComponentVisible("ammo", false)
  
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), setHud)
  
  function removeHud()
    setPlayerHudComponentVisible("armour", true)
    setPlayerHudComponentVisible("wanted", true)
    setPlayerHudComponentVisible("weapon", true)
    setPlayerHudComponentVisible("money", true)
    setPlayerHudComponentVisible("health", true)
    setPlayerHudComponentVisible("clock", true)
    setPlayerHudComponentVisible("breath", true)
    setPlayerHudComponentVisible("ammo", true)
  end
  addEventHandler("onClientResourceStop", getResourceRootElement(getThisResource()), removeHud)    




  function loadMap(startedMap)
    mapRoot = getResourceRootElement(startedMap)
  end
  
  addEventHandler("onGamemodeMapStart", getRootElement(), loadMap)
  




  function joinHandler()
    local spawn = getElementsByType("spawnpoint", mapRoot)
    local x,y,z,r
    for key, value in pairs(spawn) do
      x = getElementData(value, "posX")
      y = getElementData(value, "posY")
      z = getElementData(value, "posZ")
      r = getElementData(value, "rot")
    end
    spawnPlayer(source, x, y, z)
    fadeCamera(source, true)
  end


  
