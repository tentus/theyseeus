local baton = require 'libraries.baton'

Bindings = baton.new {
    controls = {
        up     = {'key:w', 'key:up',    'button:dpup',       'axis:lefty-', 'wheel:y+'},
        down   = {'key:s', 'key:down',  'button:dpdown',     'axis:lefty+', 'wheel:y-'},
        left   = {'key:a', 'key:left',  'button:dpleft',     'axis:leftx-', 'wheel:x-'},
        right  = {'key:d', 'key:right', 'button:dpright',    'axis:leftx+', 'wheel:x+'},

        action = {'key:return', 'key:space', 'key:tab', 'button:a', 'mouse:1'},
        cancel = {'key:escape', 'key:backspace',        'button:b', 'mouse:2'},
    },
    pairs = {
        move = {'left', 'right', 'up', 'down'}
    },
    joystick = love.joystick.getJoysticks()[1],
}
