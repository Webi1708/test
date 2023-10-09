function onCreate()
    makeLuaSprite('Black2', 'black', -2500, -1400);
	--setScrollFactor('Background1', 0.5, 0.5);
    setProperty('Black2.alpha', 0);
    addLuaSprite('Black2', true);
end


function onEvent(name, value1, value2)
	if name == 'Black FG Toggle' then

        alphaAmount = value1;
        duration = value2;  
        
        doTweenAlpha('FGAlpha', 'Black2', alphaAmount, duration, 'linear');
	end  
end