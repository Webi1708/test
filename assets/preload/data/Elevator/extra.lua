function onCreate()
    precacheSound('ramsescum');
    precacheImage('LAdeath');

    setPropertyFromClass('GameOverSubstate', 'characterName', 'ramses-death'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'ramsescum'); --put in mods/sounds/
end

function noteMiss(id, direction, noteType, isSustainNote)
	if direction == 0 then
        --doTweenColor('missTween', 'boyfriend', '800080', 0.1, 'quintInOut');
        playSound('missleft', 1);
        noteTweenAngle('broke0', direction + 4, -25, 0.5, 'bounceOut');
    elseif direction == 1 then
        --doTweenColor('missTween', 'boyfriend', '800080', 0.1, 'quintInOut');
        playSound('missdown', 1);
        noteTweenAngle('broke1', direction + 4, -25, 0.5, 'bounceOut');
    elseif direction == 2 then
        --doTweenColor('missTween', 'boyfriend', '800080', 0.1, 'quintInOut');
        playSound('missup', 1);
        noteTweenAngle('broke2', direction + 4, -25, 0.5, 'bounceOut');
    elseif direction == 3 then
        --doTweenColor('missTween', 'boyfriend', '800080', 0.1, 'quintInOut');
        playSound('missright', 1);
        noteTweenAngle('broke3', direction + 4, -25, 0.5, 'bounceOut');
    end

if curBeat <= 171 then
    doTweenColor('missTween', 'boyfriend', '6A6A6A', 0.1, 'quintInOut');
end

if (curBeat >= 172) and (curBeat <= 187) then
    doTweenColor('missTween1', 'Alling', '262626', 0.1, 'quintInOut');
end

if (curBeat >= 188) and (curBeat <= 203) then
    doTweenColor('missTween2', 'Ramming', '262626', 0.1, 'quintInOut');
end



    triggerEvent('Play Animation', 'sit', 'bf');
    
    -- Called after the note miss calculations
	-- Player missed a note by letting it go offscreen
end

function onBeatHit()

    if not lowQuality then
        if ((curBeat >= 172) and (curBeat <= 187)) or (curBeat == 139) then
            cancelTween('missTween');
            cancelTween('normalbf');
            setProperty('boyfriend.alpha', 0);
        end

        if curBeat == 140 then
            setProperty('boyfriend.alpha', 1);
        end
        
        if curBeat >= 188 then
            cancelTween('missTween1');
            cancelTween('normalbf1');
            setProperty('Alling.alpha', 0);
        end
        
        if curBeat >= 204 then
            cancelTween('missTween2');
            cancelTween('normalbf2');
            setProperty('Ramming.alpha', 0);
        end
    end
end

function onTweenCompleted(tag)
    -- A tween you called has been completed, value "tag" is it's tag
    -- setObjectX('laser', getCharacterX('dad') + 100);
    --doTweenX('laser return', 'laser', getCharacterX('dad') + 100, 0.001, 'linear');
    if tag == 'note0' then
        for i=0, noteMax, 1
        do
        noteTweenAngle('returnnote' .. i, i, 0, 0.5, 'quadInOut');
        end
    end

    if tag == 'missTween' then
        doTweenColor('normalbf', 'boyfriend', 'FFFFFF', 1, 'quintOut');
    end

    if tag == 'missTween1' then
        doTweenColor('normalbf1', 'Alling', 'FFFFFF', 1, 'quintOut');
    end

    if tag == 'missTween2' then
        doTweenColor('normalbf2', 'Ramming', 'FFFFFF', 1, 'quintOut');
    end

    if (tag == 'broke0')then
        noteTweenAngle('fix0', 4, 0, 1, 'quadInOut');
    end
    if (tag == 'broke1')then
        noteTweenAngle('fix1', 5, 0, 1, 'quadInOut');
    end
    if (tag == 'broke2')then
        noteTweenAngle('fix2', 6, 0, 1, 'quadInOut');
    end
    if (tag == 'broke3')then
        noteTweenAngle('fix3', 7, 0, 1, 'quadInOut');
    end

end