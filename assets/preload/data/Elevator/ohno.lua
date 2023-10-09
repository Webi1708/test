
adjustmenty = 30;
christmas = false;
chvolume = 0.001;
songtime = 0;

function onCreate()
    setObjectOrder('gfGroup', 6);
    setProperty('Black2.alpha', 1);
    setProperty('boyfriend.alpha', 0);
    setProperty('dad.alpha', 0);
    --setProperty('gf.alpha', 0);

    --raMING();
    --alLING();

    christmas = false;
    


    if not lowQuality then

        addCharacterToList('ramses2', 'boyfriend');
        addCharacterToList('ramsesf', 'boyfriend');
        --addCharacterToList('bf', 'boyfriend');
        addCharacterToList('allen2', 'dad');
        addCharacterToList('allenf', 'dad');
        --addCharacterToList('bf-pixel-opponent', 'dad');

        makeAnimatedLuaSprite('Ramming', 'RamsesF2', -45, -420);
        addAnimationByPrefix('Ramming', 'idle', 'RamsesF2', 35, false);
        objectPlayAnimation('Ramming', 'idle');
        --setScrollFactor('shadow', 1, 1);
        --scaleObject('shadow', 2, 2);
        --setProperty('shadow.alpha', 0);
        --setObjectOrder('shadow',20);
        --setBlendMode('shadow','OVERLAY');

        makeAnimatedLuaSprite('Alling', 'AllenF2', 160, -125);
        addAnimationByPrefix('Alling', 'idle', 'AllenF', 38, false);
        objectPlayAnimation('Alling', 'idle');
        --setScrollFactor('shadow', 1, 1);
        scaleObject('Alling', 1.1, 1.1);
        --setProperty('shadow.alpha', 0);
        --setObjectOrder('shadow',20);
        --setBlendMode('shadow','OVERLAY');

        makeAnimatedLuaSprite('Conend', 'ConnorEnd', 320, 250 - adjustmenty);
        addAnimationByPrefix('Conend', 'idle', 'ConnorNuttedin', 24, true);
        objectPlayAnimation('Conend', 'idle');
        setProperty('Conend.alpha', 0);


        if flashingLights then
        makeAnimatedLuaSprite('Pulse', 'pulses', -50, 20);
        addAnimationByPrefix('Pulse', 'Allen', 'ElectricPulse', 40, false);
        addAnimationByPrefix('Pulse', 'Ramses', 'LovePulse', 40, false);
        objectPlayAnimation('Pulse', 'Ramses');
        scaleObject('Pulse', 1.2, 1.2);
        setBlendMode('Pulse','ADD');
        setProperty('Pulse.alpha', 0);
        setObjectOrder('Pulse',5);
        end

        addLuaSprite('Alling', false);
        addLuaSprite('Ramming', false);
        if flashingLights then
        addLuaSprite('Pulse', false);
        end
        addLuaSprite('Conend', false);

        --setProperty('camHUD.alpha', 0);

    end


    fuckScene('');

    pulsetype = '';
    togglenumber = 0;
    togglebg = 'white';
    --strumsOFF();
    
    makeLuaText('fuck4', 'gay people', 700,300,585);
 setTextString('fuck4', 'anim name:');
 setTextSize('fuck4',50);

    addLuaText('fuck4');
    setObjectCamera('fuck4',"hud");
    setProperty('fuck4.alpha', 0);

    makeLuaText('fuck5', 'gay people', 700,300,385);
 setTextString('fuck5', 'anim name:');
 setTextSize('fuck5',50);

    addLuaText('fuck5');
    setObjectCamera('fuck5',"hud");
    setProperty('fuck5.alpha', 0);


end

function onSongStart()
    --punchZoom(3,18);
    --strumsOFF();

    
    
    doTweenZoom('beginpunch', 'camGame', 2, 0.001, 'linear');
    doTweenZoom('easeOutpunch', 'camGame', 1, 18, 'quadOut');

end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	if counter == 4 then
        playSound('christ', chvolume, 'christ');
    end--> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
end

function onPause()
	-- Called when you press Pause while not on a cutscene/etc
	-- return Function_Stop if you want to stop the player from pausing the game
    pauseSound('christ');
    --songtime = getSoundTime('christ');
	return Function_Continue;
    
end

function onResume()
	-- Called after the game has been resumed from a pause (WARNING: Not necessarily from the pause screen, but most likely is!!!)
    resumeSound('christ');
    --setSoundTime('christ', songtime);
end

function onUpdate()

    if curBeat <= 8 then
        if keyboardJustPressed('C') then
            --setProperty('Black2.alpha', 0.5);

            if christmas == false then
            christmas = true;
            soundFadeIn('christ', 0.5, chvolume, 1);
            setProperty('BGC.alpha', 1);
            chvolume = 1;
            else
            christmas = false;
            soundFadeOut('christ', 0.5, 0);
            setProperty('BGC.alpha', 0);
            chvolume = 0;
            end

            setProperty('fuck4.alpha', 1);
            doTweenAlpha('christman', 'fuck4', 0, 1, 'quadInOut');
            --setSoundVolume('christmas', chvolume);
        end
    end

    setTextString('fuck4', 'Christmas Mode:'.. tostring(christmas));
    setTextString('fuck5', 'Song at:'.. tostring(getSoundVolume('christ')) .. 'and duration now is' .. tostring(getSoundTime('christ')));

end

function onStartCountdown()
    
end


function strumsOFF()

    
    noteTweenAlpha('off0', 0, 0, 0.01, 'linear');
    noteTweenAlpha('off1', 1, 0, 0.01, 'linear');
    noteTweenAlpha('off2', 2, 0, 0.01, 'linear');
    noteTweenAlpha('off3', 3, 0, 0.01, 'linear');
    noteTweenAlpha('off4', 4, 0, 0.01, 'linear');
    noteTweenAlpha('off5', 5, 0, 0.01, 'linear');
    noteTweenAlpha('off6', 6, 0, 0.01, 'linear');
    noteTweenAlpha('off7', 7, 0, 0.01, 'linear');

end



function punchZoom(amount, duration)
    if cameraZoomOnBeat then
    doTweenZoom('beginpunch', 'camGame', amount, 0.001, 'linear');
    doTweenZoom('easeOutpunch', 'camGame', 1, duration, 'quintOut');
    end
end

function fuckScene(which,toggle)
    if which == 'ramses' then
        --RAMSES FUCKING CONNOR
        punchZoom(3,0.5);
        setProperty('Alling.alpha', 0);
        setProperty('Ramming.alpha', 1);
        setProperty('boyfriend.alpha', 0);
        setProperty('dad.alpha', 0);
        pulsetype = 'ramses';
        setProperty('Pulse.alpha', 0.7);
        objectPlayAnimation('Pulse', 'Ramses');
    elseif which == 'allen' then
        --ALLEN FUCKING CONNOR
        punchZoom(3,0.5);
        setProperty('Ramming.alpha', 0);
        setProperty('Alling.alpha', 1);
        setProperty('boyfriend.alpha', 0);
        setProperty('dad.alpha', 0);
        pulsetype = 'allen';
        setProperty('Pulse.alpha', 0.7);
        objectPlayAnimation('Pulse', 'Allen');
    elseif which == 'ending' then
        --ENDING
        
        
        triggerEvent('White FG Toggle', 0, 7);
        --punchZoom(2,18);
        doTweenZoom('beginpunch', 'camGame', 3.5, 0.001, 'linear');
        doTweenZoom('easeOutpunch', 'camGame', 1, 14, 'quadOut');
        setProperty('Ramming.alpha', 0);
        setProperty('Alling.alpha', 0);
        --setProperty('boyfriend.alpha', 0);
        --setProperty('dad.alpha', 0);
        setProperty('Pulse.alpha', 0);

        setProperty('BG2.alpha', 1);
        setProperty('BG3.alpha', 0);
        setProperty('Conend.alpha', 1);
        --setProperty('shadow2.alpha', 0.74);
    else
        --TOGGLE OFF
        setProperty('Ramming.alpha', 0);
        setProperty('Alling.alpha', 0);
        setProperty('Pulse.alpha', 0);
    
    end
end

function colorSwap()

    if togglenumber < 3 then
    togglenumber = togglenumber + 1;
    elseif togglenumber >= 3 then
    togglenumber = 0;
    end
        if christmas == true then
            if togglenumber == 0 then
                colortag = "00CC66"
            end

            if togglenumber == 1 then
                colortag = "FF3366"
            end

            if togglenumber == 2 then
                colortag = "FFFFFF"
            end

            if togglenumber == 3 then
                colortag = "00927E"
            end
        elseif pulsetype == 'ramses' then
            if togglenumber == 0 then
                colortag = "DBC28A"
            end

            if togglenumber == 1 then
                colortag = "CA5C8B"
            end

            if togglenumber == 2 then
                colortag = "FFE7FD"
            end
            if togglenumber == 3 then
                colortag = "FFFFFF"
            end
        elseif pulsetype == 'allen' then
            if togglenumber == 0 then
                colortag = "D38F52"
            end

            if togglenumber == 1 then
                colortag = "3C3A4F"
            end

            if togglenumber == 2 then
                colortag = "FFCCCC"
            end
            if togglenumber == 3 then
                colortag = "FFFFFF"
            end
        elseif pulsetype == 'before' then
            if togglenumber == 0 then
                colortag = "FFC543"
            end

            if togglenumber == 1 then
                colortag = "FF4594"
            end

            if togglenumber == 2 then
                colortag = "922BFF"
            end

            if togglenumber == 3 then
                colortag = "13194D"
            end

        
        end



        if pulsetype == 'ending' then
            --DO LITERALLY NOTHING
            setProperty('Pulse.alpha', 0);

        --setProperty('BG2.alpha', 1);
        setProperty('BG3.alpha', 0);
        else
            doTweenColor('colorchange', 'Pulse', colortag, 0.2, bounceOut);
            doTweenColor('colorchange2', 'BG3', colortag, 0.3, bounceOut);
        end
    
    --setProperty('BG3.alpha', 0);
end

function colorSwapBGONLY()

    if togglenumber < 3 then
    togglenumber = togglenumber + 1;
    elseif togglenumber >= 3 then
    togglenumber = 0;
    end

        if christmas == true then
            if togglenumber == 0 then
                colortag = "00CC66"
            end

            if togglenumber == 1 then
                colortag = "FF3366"
            end

            if togglenumber == 2 then
                colortag = "FFFFFF"
            end

            if togglenumber == 3 then
                colortag = "00927E"
            end
        else
            if togglenumber == 0 then
                colortag = "FFC543"
            end

            if togglenumber == 1 then
                colortag = "FF4594"
            end

            if togglenumber == 2 then
                colortag = "922BFF"
            end

            if togglenumber == 3 then
                colortag = "13194D"
            end
        end

    --doTweenColor('colorchange', 'Pulse', colortag, 0.2, bounceOut);
    doTweenColor('colorchange2', 'BG3', colortag, 0.3, bounceOut);

end

function raMING()
    triggerEvent('Change Character', 0, 'ramsesf');
    triggerEvent('Change Character', 1, 'allen2');

    setProperty('dad.x', defaultOpponentX + 60);
    setProperty('dad.y', defaultOpponentY + 29);

    setProperty('boyfriend.x', defaultBoyfriendX - 260);
    setProperty('boyfriend.y', defaultBoyfriendY - 10);
    setObjectOrder('dad', 2);
end

function alLING()
    triggerEvent('Change Character', 0, 'ramses2');
    triggerEvent('Change Character', 1, 'allenf');

    setProperty('dad.x', defaultOpponentX - 25);
    setProperty('dad.y', defaultOpponentY + 29);

    setProperty('boyfriend.x', defaultBoyfriendX - 210);
    setProperty('boyfriend.y', defaultBoyfriendY - 10);

    setObjectOrder('dad', 14);
end

function onStepHit()
    --if cutStep  then
        --objectPlayAnimation('Ramming', 'idle');
        --objectPlayAnimation('Alling', 'idle');
    --end
end

function danceHit()
        objectPlayAnimation('Ramming', 'idle',true);
        objectPlayAnimation('Alling', 'idle', true);
        
        if flashingLights then
            if pulsetype == 'ramses' then
                objectPlayAnimation('Pulse', 'Ramses', true);
                colorSwap();
            elseif pulsetype == 'allen' then
                objectPlayAnimation('Pulse', 'Allen', true); 
                colorSwap();
            elseif pulsetype == 'before' then
                colorSwapBGONLY();
            end
        end

        

        
        
end

function onBeatHit()

    if curBeat % 2 == 0 then
        if togglebg == 'white' then
            objectPlayAnimation('BG3', 'white');
            togglebg = 'black';
        elseif togglebg == 'black' then
            objectPlayAnimation('BG3', 'black');
            togglebg = 'white';
        end
    end

    if curBeat % 1 == 0 then
        danceHit();

    end
    if curBeat == 8 then
        doTweenAlpha('fadein1','Black2', 0, 7.4, 'quadInOut')
    end

    if curBeat == 39 then
        doTweenAlpha('fadeinfordoor','shadow', 0.5, 1, 'quadInOut')
    end

    if curBeat == 40 then
        objectPlayAnimation('shadow', 'open');
    end

    if curBeat == 42 then
        objectPlayAnimation('shadow', 'boys');
    end

    if curBeat == 44 then
    setProperty('boyfriend.alpha', 1);
    setProperty('dad.alpha', 1);
    setProperty('shadow.alpha', 0);
    end


    if not lowQuality then

        if curBeat == 139 then
            setProperty('gf.alpha', 0);
            pulsetype = 'before';
            raMING();
        end

        if curBeat == 155 then
            alLING();
        end

        if curBeat == 172 then
            fuckScene('allen');

        end

        if curBeat == 187 then
            fuckScene('ramses');
        end

        if curBeat == 202 then
            triggerEvent('White FG Toggle', 1, 1);
        end

        if curBeat == 203 then
            --fuckScene('ending');
            pulsetype = 'ending';
        end


        if curBeat == 204 then
            fuckScene('ending');
        end

        if curBeat == 216 then
            doTweenAlpha('seeyabuddy', 'shadow2', 0.7, 8, 'quadInOut');
        end

        if curBeat == 232 then
            objectPlayAnimation('shadow2', 'close');
        end
    
    



        if (curBeat >= 140) and (curBeat <= 155) then
            if curBeat % 1 == 0 then
                triggerEvent('Play Animation', 'idle', 'boyfriend');
            end
        elseif (curBeat >= 156) and (curBeat <= 172) then
            if curBeat % 1 == 0 then
                triggerEvent('Play Animation', 'fuck', 'dad');
            end
        end
    end
end


