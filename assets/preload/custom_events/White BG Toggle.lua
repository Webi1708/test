function onCreate()
    makeLuaSprite('White', 'white', -2500, -1400);
	--setScrollFactor('Background1', 0.5, 0.5);
    setProperty('White.alpha', 0);
    addLuaSprite('White', false);
end


function onEvent(name, value1, value2)
	if name == 'White BG Toggle' then

        alphaAmount = value1;
        duration = value2;  
        
        doTweenAlpha('BGAlphawhite', 'White', alphaAmount, duration, 'linear');
	end  
end