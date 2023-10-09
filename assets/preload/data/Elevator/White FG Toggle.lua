function onCreate()
    makeLuaSprite('White2', 'white', -2500, -1400);
	--setScrollFactor('Background1', 0.5, 0.5);
    setProperty('White2.alpha', 0);
    addLuaSprite('White2', true);
    setObjectOrder('White2', 50);
end


function onEvent(name, value1, value2)
	if name == 'White FG Toggle' then

        alphaAmount = value1;
        duration = value2;  
        
        doTweenAlpha('FGAlphawhite', 'White2', alphaAmount, duration, 'linear');
	end  
end