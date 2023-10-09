opdir = ''
pldir = ''
beingfucked = false;
isophit = false;
isplayhit = false;
ishitting = false;
isbothhitting = false;

function onCreate()
 -- DEBUG FOR BUMPERS

 makeLuaText('fuck', 'gay people', 300,-5,305);
 setTextString('fuck', 'type of hit:');
 setTextSize('fuck',50);
 --setTextColor('fuck', 'FFFFFF');
 --setTextFont('BalloonNo2')
 addLuaText('fuck');
 setObjectCamera('fuck',"hud");
 setProperty('fuck.alpha', 0);

 makeLuaText('fuck2', 'gay people', 300,950,305);
 setTextString('fuck2', 'type of hit:');
 setTextSize('fuck2',50);
 --setTextColor('fuck', 'FFFFFF');
 --setTextFont('BalloonNo2')
 addLuaText('fuck2');
 setObjectCamera('fuck2',"hud");
 setProperty('fuck2.alpha', 0);

 makeLuaText('fuck3', 'gay people', 300,400,605);
 setTextString('fuck3', 'anim name:');
 setTextSize('fuck3',50);
 --setTextColor('fuck', 'FFFFFF');
 --setTextFont('BalloonNo2')
 addLuaText('fuck3');
 setObjectCamera('fuck3',"hud");
 setProperty('fuck3.alpha', 0);
end

function onBeatHit()
    if ((curBeat >= 68) and (curBeat <= 75)) or ((curBeat >= 116) and (curBeat <= 140)) then
        isbothhitting = true;
    else
        isbothhitting = false;
    end
end

-- MAKE CONNOR MOVE

function opponentNoteHit(id, direction, noteType, isSustainNote)
    opdir = ''
    --pldir = ''
    
    ishitting = true;
    isophit = true;

    runTimer('reset notes op', 2)
    --runTimer('reset notes pl', 1)

    if beingfucked == false then
        anim = ''
        anim3 = ''
        if direction == 0 then
            anim = 'singLEFT-A'
            anim3 = 'singLEFT'
            opdir = 'left'
        elseif direction == 1 then
            anim = 'singDOWN-A'
            anim3 = 'singDOWN'
            opdir = 'down'
        elseif direction == 2 then
            anim = 'singUP-A'
            anim3 = 'singUP'
            opdir = 'up'
        elseif direction == 3 then
            anim = 'singRIGHT-A'
            anim3 = 'singRIGHT'
            opdir = 'right'
        end
        

        -- if the directions are the same, then play 3rd alt
        if opdir == pldir then
        -- characterPlayAnim('gf', anim3, true);
        else
        --characterPlayAnim('gf', anim, true);
        end
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    --opdir = ''
    pldir = ''

    --runTimer('reset notes op', 1)
    runTimer('reset notes pl', 2)


    ishitting = true;
    isplayhit = true;

    if beingfucked == false then
        anim2 = ''
        anim3 = ''
        if direction == 0 then
            anim2 = 'singLEFT-R'
            anim3 = 'singLEFT'
            pldir = 'left'
        elseif direction == 1 then
            anim2 = 'singDOWN-R'
            anim3 = 'singDOWN'
            pldir = 'down'
        elseif direction == 2 then
            anim2 = 'singUP-R'
            anim3 = 'singUP'
            pldir = 'up'
        elseif direction == 3 then
            anim2 = 'singRIGHT-R'
            anim3 = 'singRIGHT'
            pldir = 'right'
        end

        

        -- if the directions are the same, then play 3rd alt
        if opdir == pldir then
        --characterPlayAnim('gf', anim3, true);
        else
        --characterPlayAnim('gf', anim2, true);
        end
    end

end

function onUpdate()

    --animationhere = getProperty(boyfriend.animation.curAnim.name);

    setTextString('fuck', 'type of hit:'.. opdir ..' hitting '.. tostring(isophit));
    setTextString('fuck2', 'type of hit:'.. pldir ..' hitting '.. tostring(isplayhit));
    setTextString('fuck3', 'is both hitting?: '.. tostring(isbothhitting));


    if (isplayhit == true) and (isophit == true) then
        --isbothhitting = true;
    end


    -- checks if note has been hit
    if ishitting == true then
        --checks if both sides are playing notes
        if isbothhitting == true then
            --Checks if both notes are the same
            if opdir == pldir then
                --if so play unison animation
                --characterPlayAnim('gf', anim3, true);
                triggerEvent('Play Animation', anim3, 'gf');
            else
                --else play ramses one
                --characterPlayAnim('gf', anim2, true);
                triggerEvent('Play Animation', anim2, 'gf');
            end
            isophit = false;
            isplayhit = false;
        --isbothhitting = false;
        --If not both checks who's hitting
        elseif isophit == true then
            -- if opponent, play Allen anim
                --characterPlayAnim('gf', anim, true);
                triggerEvent('Play Animation', anim, 'gf');
                isophit = false;
            -- if player, play ramses anim
        elseif isplayhit == true then
                --characterPlayAnim('gf', anim2, true);
                triggerEvent('Play Animation', anim2, 'gf');
                isplayhit = false;
        end
            --isbothhitting = false;
    end
        

    ishitting = false;

    

end



function onUpdatePost()
    
end

function onTimerCompleted(tag, loops, loopsLeft)

    if tag == 'reset notes op' then
        opdir = ''
        --pldir = ''
    end

    if tag == 'reset notes pl' then
        --opdir = ''
        pldir = ''
    end
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
end