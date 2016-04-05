class LRUCache
    constructor: (@size = 10) ->
        @_keys = []
        @_data = {}

    put: (key, data) =>
        i = @_keys.indexOf key
        if i >= 0
            @_keys.splice i, 1

        @_data[key] = data
        @_keys.push key

        if @_keys.length > @size
            delete @_data[@_keys.shift()]

        return true
        
    get: (key) =>
        return if key not in @_keys
        i = @_keys.indexOf key
        if i >= 0
            if i != @_keys.length - 1
                @_keys.splice i, 1
                @_keys.push key
        else
            @_keys.push key

        return @_data[key] or null

    forEach: (cb) =>
        for key, val of @_data
            cb(val, key)

    map: (cb) ->
        ret = {}
        for key, val of @_data
            Object.assign ret, cb(val, key)
        return ret

    clear: =>
        @_keys = []
        @_data = {}

    setSize: (newSize) =>
        return if @size == newSize
        @size = newSize
        while @_keys.length > newSize
            delete @_data[@_keys.shift()]

    dict: => Object.assign {}, @_data
    
    rawDict: => @_data

module.exports = LRUCache
