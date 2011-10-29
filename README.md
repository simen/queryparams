# Querystring

A straight forward gem to convert ruby hashes and arrays to http query strings. It supports hashes, arrays, nested hashes and arrays of hashes and all combinations thereof. E.g.:

    Querystring.encode({a: 1, b: "c"})
    => "a=1&b=c"

    Querystring.encode({a: {b: 'c', d: 'e'}, f: 'g'})
    => "a[b]=c&a[d]=e&f=g"

    Querystring.encode({a: ['bingo', 'hepp']})
    => "a[0]=bingo&a[1]=hepp"

    Querystring.encode({a: [{b:'c', d:'e'}, {f:'g'}]})
    => "a[0][b]=c&a[0][d]=e&a[1][f]=g"
