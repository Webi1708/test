function onCreate()
    makeLuaSprite('Black', 'black', -2500, -1400);
	--setScrollFactor('Background1', 0.5, 0.5);
    setProperty('Black.alpha', 0);
    addLuaSprite('Black', false);
end


function onEvent(name, value1, value2)
	if name == 'Black BG Toggle' then

        alphaAmount = value1;
        duration = value2;  
        
        doTweenAlpha('BGAlpha', 'Black', alphaAmount, duration, 'linear');
	end  
end